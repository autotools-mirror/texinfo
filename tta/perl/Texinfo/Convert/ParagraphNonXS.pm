# ParagraphNonXS.pm: handle paragraph text.
#
# Copyright 2010-2026 Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# this module has nothing Texinfo specific.  In contrast with existing
# modules Text::Wrap, Text::Format, it keeps a state of the paragraph
# and waits for text to be fed into it.

package Texinfo::Convert::Paragraph;

use 5.006;
use strict;
use warnings;

use if $] >= 5.014, re => '/a';  # ASCII-only character classes in regexes

# To check if there is no erroneous autovivification
#no autovivification qw(fetch delete exists store strict);

use Unicode::EastAsianWidth;
use Texinfo::Convert::Unicode;
use Carp qw(cluck confess);

# same ordering as in C
my @para_ordered_conf = ('debug', 'indent_length', 'frenchspacing',
   'counter', 'indent_length_next', 'unfilled', 'max', 'keep_end_lines',
   'no_final_newline', 'add_final_space');

# used if debugging only, to have legible identifier for debug messages
my @para_array;

# initialize a paragraph hash.
sub new(;$) {
  my $conf = shift;

  my $self = {
    # defaults that can be changed with conf, in the same order as
    # @para_ordered_conf
    'debug' => 0, 'indent_length' => 0, 'indent_length_next' => undef,
    'frenchspacing' => 0, 'counter' => 0, 'unfilled' => 0, 'max' => 72,
    'keep_end_lines' => 0, 'no_final_newline' => 0, 'add_final_space' => 0,
    # set by function calls, not by $conf
    # 'no_break' => 0, 'double_width_no_break' => 0,

    # state
    'word_counter' => 0, 'space' => '', # 'end_sentence' is unset
    'last_letter' => '', 'word' => '',
    # This indicates an unbreakable "word", corresponding to @w.  It is useful
    # if not already in a word and @w{} is empty, such that it is considered
    # as an "unbreakable" word of length 0.
    'invisible_word' => 0,
  };

  if (defined($conf)) {
    foreach my $key (keys(%$conf)) {
      $self->{$key} = $conf->{$key};
    }
  }
  #$self->{'debug'} = 1;
  if ($self->{'debug'}) {
    # setup an identifier number in the same way as in C for better
    # debugging messages
    my $id = 0;
    my $array_len = scalar(@para_array);
    for (my $i = 0; $i < $array_len; $i++) {
      if (!defined($para_array[$i])) {
        $para_array[$i] = $self;
        $self->{'id'} = $i;
        last;
      }
    }
    if (!exists($self->{'id'})) {
      $self->{'id'} = $array_len;
      push @para_array, $self;
    }
    # show the conf, in reproducible order
    if (defined($conf)) {
      foreach my $key (@para_ordered_conf) {
        if (defined($conf->{$key})) {
          print STDERR "CONF $self->{'id'} $key: $conf->{$key}\n";
        }
      }
    }
  }
  return $self;
}

# for debugging
sub dump($) {
  my $self = shift;

  print STDERR "para ($self->{'counter'}+$self->{'word_counter'}) "
    ."word(invisible:$self->{'invisible_word'}): $self->{'word'}"
    .", space `$self->{'space'}' "
    ."end_sentence: ".(exists($self->{'end_sentence'})
                                ? $self->{'end_sentence'} : 'UNSET')."\n";
}

sub add_to_counter($$) {
  my ($paragraph, $n) = @_;

  $paragraph->{'counter'} += $n;
}

sub counter($) {
  my $paragraph = shift;

  return $paragraph->{'counter'};
}

# End a line, throwing away a pending space.  The caller should add
# a new line and increase/set the lines count.
sub _reset_state_for_end_line($) {
  my $paragraph = shift;

  $paragraph->{'counter'} = 0;
  $paragraph->{'space'} = '';
  # do not reset in case it is an end of command and we want to keep
  # the information about upper-case letter
  #$paragraph->{'last_letter'} = '';
  if (defined($paragraph->{'indent_length_next'})) {
    $paragraph->{'indent_length'} = $paragraph->{'indent_length_next'};
    delete $paragraph->{'indent_length_next'};
  }
  print STDERR "END_LINE\n" if ($paragraph->{'debug'});
}

sub end_line($) {
  my $paragraph = shift;

  _reset_state_for_end_line($paragraph);
  return ("\n", 1);
}

# Return 1 if the line should be cut.
# Verify that conditions are met to add a new line before the new space
# and word.
# $COLUMN_COUNTS should hold the line width with the new space and word
# length taken into account.
sub _cut_line($$) {
  my ($paragraph, $column_counts) = @_;

  # - $paragraph->{'counter'} == 0 avoids having an additional empty line output
  #   when the new text is longer than the max.
  # - If keep_end_lines is set, no line wrapping.
  # - Wrap the text before the new word only if new word end is past
  #   the line size.
  if ($column_counts <= $paragraph->{'max'} or $paragraph->{'keep_end_lines'}
      or $paragraph->{'counter'} == 0) {
    return 0;
  } else {
    _reset_state_for_end_line($paragraph);
    return 1;
  }
}

# put a pending word and spaces in the result string.
sub add_pending_word($;$) {
  my ($paragraph, $add_spaces) = @_;

  my $result = '';

  if ($paragraph->{'word'} eq '' and not $paragraph->{'invisible_word'}
      and not $add_spaces) {
    print STDERR "ADD_PENDING, nothing to add\n" if ($paragraph->{'debug'});
    return $result;
  }

  if ($paragraph->{'indent_length'} > $paragraph->{'counter'}) {
    $result .= ' ' x ($paragraph->{'indent_length'} - $paragraph->{'counter'});
    $paragraph->{'counter'} = $paragraph->{'indent_length'};
    print STDERR "INDENT($paragraph->{'counter'}+$paragraph->{'word_counter'})\n"
                 if ($paragraph->{'debug'});
    $paragraph->{'space'} = '' unless $paragraph->{'unfilled'};
  }
  if ($paragraph->{'space'} ne '') {
    $result .= $paragraph->{'space'};
    print STDERR "ADD_SPACES($paragraph->{'counter'})+"
         .length($paragraph->{'space'})
         . " `"._print_escaped_spaces($paragraph->{'space'})."'\n"
       if ($paragraph->{'debug'});
    $paragraph->{'counter'} += length($paragraph->{'space'});
    $paragraph->{'space'} = '';
  }
  if ($paragraph->{'word'} ne '') {
    $result .= $paragraph->{'word'};
    $paragraph->{'counter'} += $paragraph->{'word_counter'};
    print STDERR "ADD_WORD[$paragraph->{'word'}]+$paragraph->{'word_counter'}"
      ." ($paragraph->{'counter'})\n"
        if ($paragraph->{'debug'});
    $paragraph->{'word'} = '';
    $paragraph->{'word_counter'} = 0;
  }
  if ($paragraph->{'invisible_word'}) {
    print STDERR "INVISIBLE WORD UNSET\n" if ($paragraph->{'debug'});
    $paragraph->{'invisible_word'} = 0;
  }
  return $result;
}

# end a paragraph
sub end($) {
  my $paragraph = shift;

  my $end_line_count = 0;
  print STDERR "PARA END\n" if ($paragraph->{'debug'});
  my $result = add_pending_word($paragraph, $paragraph->{'add_final_space'});
  # cleaner if the paragraph is reused
  $paragraph->{'last_letter'} = '';
  if (!$paragraph->{'no_final_newline'} and $paragraph->{'counter'} != 0) {
    $result .= "\n";
    $end_line_count++;
  }
  return ($result, $end_line_count);
}

sub destroy($) {
  my $paragraph = shift;

  if ($paragraph->{'debug'}) {
    $para_array[$paragraph->{'id'}] = undef;
    print STDERR "SET UNUSED $paragraph->{'id'}\n";
  }
  $paragraph = undef;
}

my $end_sentence_characters = quotemeta('.?!');
# DEL is also there even though it is not an end sentence character,
# such that it is ignored too, if there is a quoted node name in
# an @*ref before end sentence punctuation
my $after_punctuation_characters = quotemeta('"\')]'."\x{7f}");

# Add $WORD to paragraph.
sub add_next($;$$) {
  my ($paragraph, $word, $transparent) = @_;

  return _add_next_word($paragraph, $word, $transparent);
}

# Values for 'end_sentence'.
# 'end_sentence' can also be unset, meaning not at the end of a sentence.
use constant {
  # at end of sentence
  eos_present => 1,
  # at end of sentence but frenchspacing is on.
  eos_present_frenchspacing => -1,
};

# add $WORD to $PARAGRPAH.
# If we go past the end of the line, fill the result string and start
# a new one.
# $TRANSPARENT means that the letters in $WORD are ignored for the purpose
# of deciding whether end sentence punctuation ends a sentence or not.
# If $DO_UPPER_CASE is set, upper-case the text after having determined
# if an upper-case letter precedes end sentence punctuation.
# If $SET_END_SENTENCE is set, the function is called through add_text and the
# end of sentence states should be set/unset.  If not set, the function is
# called through add_next, and the end of sentence states are not set/unset.
# 'last_letter' is set in both case, if not in unfilled container.
# Also, if called from add_text, there cannot be spaces in $WORD, if called
# from add_next there can be anything (in particular spaces and end of lines).
#
# Note that $DO_UPPER_CASE happens only with $SET_END_SENTENCE and $TRANSPARENT
# only with $SET_END_SENTENCE unset, but it would not be an issue if it was
# not the case.
sub _add_next_word($;$$$$) {
  my ($paragraph, $word, $transparent, $do_upper_case,
      $set_end_of_sentence) = @_;

  if (!defined($word)) {
    return ('', 0);
  }

  my $end_line_count = 0;

  if (!$transparent and !$paragraph->{'unfilled'}) {
    if ($word =~ /^[$after_punctuation_characters]*$/o) {
   # set nothing in the case of a continuation of after_punctuation_characters
    } elsif ($word =~
             /([^$after_punctuation_characters$end_sentence_characters])?
              [$after_punctuation_characters]*[$end_sentence_characters]
              [$end_sentence_characters$after_punctuation_characters]*$/ox) {
      # we have $end_sentence_characters, therefore we are possibly at the
      # end of a sentence.

      # Save the last character in $word before punctuation, if any
      $paragraph->{'last_letter'} = $1 if (defined($1));

      # to have an end of sentence, we should be called through add_text
      # and the punctuation should not be preceded by an upper-case letter.
      if ($set_end_of_sentence) {
        if ($paragraph->{'last_letter'} eq ''
            or $paragraph->{'last_letter'} =~ /^[^\p{Upper}]$/) {
          if ($paragraph->{'frenchspacing'}) {
            $paragraph->{'end_sentence'} = eos_present_frenchspacing;
          } else {
            $paragraph->{'end_sentence'} = eos_present;
          }
          print STDERR "END_SENTENCE\n" if ($paragraph->{'debug'});
        } else {
          if (exists($paragraph->{'end_sentence'})) {
            print STDERR "delete END_SENTENCE($paragraph->{'end_sentence'})\n"
              if ($paragraph->{'debug'});
            delete $paragraph->{'end_sentence'};
          }
        }
      }
    } else {
      if ($set_end_of_sentence) {
        if (exists($paragraph->{'end_sentence'})) {
          print STDERR "delete END_SENTENCE($paragraph->{'end_sentence'})\n"
            if ($paragraph->{'debug'});
          delete $paragraph->{'end_sentence'};
        }
      }
      $word =~ /([^$after_punctuation_characters])
                [$after_punctuation_characters]*$/ox;
      # Save the last character in $word before punctuation
      $paragraph->{'last_letter'} = $1;
    }
  }

  my $result = '';

  if ($do_upper_case) {
    $paragraph->{'word'} .= uc($word);
  } else {
    $paragraph->{'word'} .= $word;
  }

  # if $set_end_of_sentence, called from add_text, no end of line in
  # word, spaces are handled separately.
  # end of line in word can only happen when called for 'raw' text.
  if (not $set_end_of_sentence and $word =~ /\n/) {
    $result .= add_pending_word($paragraph);
    _reset_state_for_end_line($paragraph);
    $end_line_count++;
  } else {
    $paragraph->{'word_counter'}
      += Texinfo::Convert::Unicode::string_width($word);

    if (_cut_line($paragraph,
            $paragraph->{'counter'} + $paragraph->{'word_counter'} +
            length($paragraph->{'space'}))) {
      $result .= "\n";
      $end_line_count++;
    }
  }

  if ($paragraph->{'debug'}) {
    print STDERR "WORD+ $word -> $paragraph->{'word'}\n";
  }

  return ($result, $end_line_count);
}

sub remove_end_sentence($) {
  my $paragraph = shift;

  printf STDERR "REMOVE END SENTENCE\n" if ($paragraph->{'debug'});
  delete $paragraph->{'end_sentence'};
}

sub add_end_sentence($) {
  my $paragraph = shift;

  $paragraph->{'end_sentence'} = eos_present;
}

# Reset 'last_letter' to a lower-case letter to allow an end of
# sentence to occur.
sub allow_end_sentence($) {
  my $paragraph = shift;

  printf STDERR "ALLOW END SENTENCE\n" if ($paragraph->{'debug'});
  $paragraph->{'last_letter'} = 'a'; # lower-case
}

sub set_frenchspacing($$) {
  my ($paragraph, $val) = @_;

  if ($paragraph->{'debug'}) {
    print STDERR "CONF $paragraph->{'id'} frenchspacing: $val\n";
  }
  $paragraph->{'frenchspacing'} = $val;
}

sub set_double_width_no_break($$) {
  my ($paragraph, $val) = @_;

  if ($paragraph->{'debug'}) {
    print STDERR "CONF $paragraph->{'id'} double_width_no_break: $val\n";
  }
  $paragraph->{'double_width_no_break'} = $val;
}

sub set_space_protection($$) {
  my ($paragraph, $no_break) = @_;

  $paragraph->{'no_break'} = $no_break
    if defined($no_break);

  # add an invisible word, to have something even if empty to put
  # between spaces.
  if ($no_break and $paragraph->{'word'} eq '') {
    print STDERR "INVISIBLE WORD SET\n" if ($paragraph->{'debug'});
    $paragraph->{'invisible_word'} = 1;
  }
}

# Wrap $TEXT, returning the wrapped text, taking into account the current state
# of $PARAGRAPH.
# If $DO_UPPER_CASE is set, upper-case the text after having determined
# if an upper-case letter precedes end sentence punctuation.
sub add_text($$;$) {
  my ($paragraph, $text, $do_upper_case) = @_;

  my $end_line_count = 0;
  my $result = '';

  my @segments = split
    /(\s+)|(\p{InFullwidth})|((?:[^\s\p{InFullwidth}])+)/,
    $text;

  my $debug_flag = $paragraph->{'debug'};
  while (@segments) {
    # $empty_segment should be an empty string; the other variables
    # here were recognized as field separators by split.  One of the
    # other variable matched as separator, the other are undef.
    my ($empty_segment, $spaces, $fullwidth_segment, $added_word)
     = splice (@segments, 0, 4);

    if ($debug_flag) {
      print STDERR "p ($paragraph->{'counter'}+$paragraph->{'word_counter'}) "
       ."s `" . _print_escaped_spaces($paragraph->{'space'})."', "
       ."l `$paragraph->{'last_letter'}', "
       ."eos ".(exists($paragraph->{'end_sentence'}) ?
                 $paragraph->{'end_sentence'} : '-2').', '
       ."w$paragraph->{'invisible_word'} `$paragraph->{'word'}'\n";
    }
    if (defined($spaces)) {
      print STDERR "SPACES($paragraph->{'counter'}) `"
          ._print_escaped_spaces($spaces)."'\n" if $debug_flag;
      if ($paragraph->{'unfilled'}) {
        $result .= add_pending_word($paragraph);
        if ($spaces =~ /\n/) {
          _reset_state_for_end_line($paragraph);
          $end_line_count++;
          $result .= "\n";
        } else {
          $paragraph->{'space'} .= $spaces;
        }
      } else {
        my $at_two_spaces_end_sentence = 0;
        $at_two_spaces_end_sentence = 1
                           if (exists($paragraph->{'end_sentence'})
                               and $paragraph->{'end_sentence'} == eos_present
                               and !$paragraph->{'frenchspacing'});
        if ($paragraph->{'no_break'}) {
          if (substr($paragraph->{'word'}, -1) ne ' ') {
            my $new_spaces = $at_two_spaces_end_sentence ? '  ' : ' ';
            $paragraph->{'word'} .= $new_spaces;
            $paragraph->{'word_counter'} += length($new_spaces);

            # Wrap the previous text if the new word end, with unbreakable
            # space added to the word, is past the line size.
            if (_cut_line($paragraph,
                 $paragraph->{'counter'} + $paragraph->{'word_counter'} +
                 length($paragraph->{'space'}))) {
              $result .= "\n";
              $end_line_count++;
            }
          }
        } else { # no_break off
          my $invisible_word = $paragraph->{'invisible_word'};
          $result .= add_pending_word($paragraph);
          # checking invisible_word is needed if there is a space before
          # an empty @w{}
          if ($paragraph->{'counter'} != 0 or $invisible_word) {
            # If we are at the end of a sentence where two spaces
            # are required.
            if ($at_two_spaces_end_sentence) {
              $paragraph->{'space'} = '  ';
            } else { # Not at end of sentence.
              # Add a space if there is not already one space that
              # was previously added.  Note that 'space' is only set here
              # (not in unfilled), therefore this other space would also
              # have been added here.
              # Another space added does not happen so often, since
              # contiguous spaces in text are processed together, this mainly
              # happens with spaces after command opening (that are not
              # ignored), or spaces after command closing.
              # Note also that setting $paragraph->{'space'} = ' '
              # unconditionally would have also worked out.
              if (length($paragraph->{'space'}) < 1) {
                $paragraph->{'space'} = ' ';
              }
            }
          }
        }
        if ($paragraph->{'keep_end_lines'} and $spaces =~ /\n/) {
          _reset_state_for_end_line($paragraph);
          $end_line_count++;
          $result .= "\n";
        }
        $paragraph->{'last_letter'} = ' ';
      }
    } elsif (defined($added_word)) {
      # regular text
      my ($result_text, $line_count)
        = _add_next_word($paragraph, $added_word, undef, $do_upper_case, 1);
      $result .= $result_text;
      $end_line_count += $line_count;
    } elsif (defined($fullwidth_segment)) {
      print STDERR "FULLWIDTH\n" if ($paragraph->{'debug'});

      # double-width latin letters can be upper case, so it is important to
      # use the actual characters here.
      $paragraph->{'last_letter'} = $fullwidth_segment;

      if ($do_upper_case) {
        $paragraph->{'word'} .= uc($fullwidth_segment);
      } else {
        $paragraph->{'word'} .= $fullwidth_segment;
      }
      # NOTE we assume that upper-case fullwidth character is also
      # fullwidth
      $paragraph->{'word_counter'} += 2;

      # We allow a line break before double-width characters even if
      # there is no space before unlike single-width characters.
      if (_cut_line($paragraph, $paragraph->{'counter'}
                                   + $paragraph->{'word_counter'})) {
        $result .= "\n";
        $end_line_count++;
      }

      if (!$paragraph->{'no_break'}
          and !$paragraph->{'double_width_no_break'}) {
        # accumulate the characters in result as soon as possible,
        # such that end of line can be added directly after the last
        # double-width character when over the max number on a line.
        $result .= add_pending_word($paragraph);
      }
      delete $paragraph->{'end_sentence'};
    }
  }

  return ($result, $end_line_count);
}

# for debug
sub _print_escaped_spaces($) {
  my $spaces = shift;

  my $result = '';
  foreach my $pos (0 .. length($spaces)-1) {
    my $char = substr($spaces, $pos, 1);
    if ($char eq ' ') {
      $result .= $char;
    } elsif ($char =~ /[\f\n]/) {
      $char =~ s/\f/\\f/;
      $char =~ s/\n/\\n/;
      $result .= $char;
    } elsif ($char =~ /\s/) {
      if (ord($char) <= hex(0xFFFF)) {
        $result .= '\x'.sprintf("%04x",ord($char));
      } else {
        $result .= '\x'.sprintf("%06x",ord($char));
      }
    } else {
      $result .= $char;
    }
  }
  return $result;
}

1;
