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
my @para_ordered_conf = ('debug', 'indent_length', 'indent_length_next',
   'frenchspacing', 'counter', 'unfilled', 'max', 'keep_end_lines',
   'no_final_newline', 'add_final_space', 'ignore_columns');

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
    'ignore_columns' => 0,
    # set by function calls, not by $conf
    # 'no_break' => 0, 'double_width_no_break' => 0,

    # state
    'word_counter' => 0, 'space' => '', # 'end_sentence' is unset
    'end_line_count' => 0, 'last_letter' => '', 'word' => '',
    # When 'word' eq '', this indicates a word of length 0.
    'invisible_pending_word' => 0,};

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
    ."word(invisible:$self->{'invisible_pending_word'}): $self->{'word'}"
    .", space `$self->{'space'}' "
    ."end_sentence: ".(exists($self->{'end_sentence'})
                                ? $self->{'end_sentence'} : 'UNSET')."\n";
}

sub _cut_line($) {
  my $paragraph = shift;

  return '' if ($paragraph->{'ignore_columns'});
  return _end_line($paragraph);
}

sub end_line_count($) {
  my $paragraph = shift;

  return $paragraph->{'end_line_count'};
}

sub add_to_counter($$) {
  my ($paragraph, $n) = @_;

  $paragraph->{'counter'} += $n;
}


sub counter($) {
  my $paragraph = shift;

  return $paragraph->{'counter'};
}

sub end_line($) {
  my $paragraph = shift;

  $paragraph->{'end_line_count'} = 0;
  return _end_line($paragraph);
}

# end a line.
sub _end_line($) {
  my $paragraph = shift;

  $paragraph->{'counter'} = 0;
  $paragraph->{'space'} = '';
  if (defined($paragraph->{'indent_length_next'})) {
    $paragraph->{'indent_length'} = $paragraph->{'indent_length_next'};
    delete $paragraph->{'indent_length_next'};
  }
  $paragraph->{'end_line_count'}++;
  print STDERR "END_LINE\n" if ($paragraph->{'debug'});
  return "\n";
}

sub add_pending_word($;$) {
  my ($paragraph, $add_spaces) = @_;

  $paragraph->{'end_line_count'} = 0;
  return _add_pending_word($paragraph, $add_spaces);
}

# put a pending word and spaces in the result string.
sub _add_pending_word($;$) {
  my ($paragraph, $add_spaces) = @_;

  my $result = '';

  if ($paragraph->{'word'} eq '' and not $paragraph->{'invisible_pending_word'}
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
    $paragraph->{'counter'} += length($paragraph->{'space'});
    print STDERR "ADD_SPACES($paragraph->{'counter'}+$paragraph->{'word_counter'})"
         . " `"._print_escaped_spaces($paragraph->{'space'})."'\n"
       if ($paragraph->{'debug'});
    $paragraph->{'space'} = '';
  }
  if ($paragraph->{'word'} ne '' or $paragraph->{'invisible_pending_word'}) {
    $result .= $paragraph->{'word'};
    $paragraph->{'counter'} += $paragraph->{'word_counter'};
    print STDERR "ADD_WORD[$paragraph->{'word'}]+$paragraph->{'word_counter'}"
      ." ($paragraph->{'counter'})\n"
        if ($paragraph->{'debug'});
    $paragraph->{'word'} = '';
    $paragraph->{'word_counter'} = 0;
    $paragraph->{'invisible_pending_word'} = 0;
  }
  return $result;
}

# end a paragraph
sub end($) {
  my $paragraph = shift;

  $paragraph->{'end_line_count'} = 0;
  print STDERR "PARA END\n" if ($paragraph->{'debug'});
  my $result = _add_pending_word($paragraph, $paragraph->{'add_final_space'});
  # probably not really useful, but cleaner
  $paragraph->{'last_letter'} = '';
  if (!$paragraph->{'no_final_newline'} and $paragraph->{'counter'} != 0) {
    $result .= "\n";
    $paragraph->{'end_line_count'}++;
  }
  return $result;
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
my $after_punctuation_characters = quotemeta('"\')]');

# Add $WORD to paragraph, returning the text to be added to the paragraph.
sub add_next($;$$) {
  my ($paragraph, $word, $transparent) = @_;

  $paragraph->{'end_line_count'} = 0;
  return _add_next($paragraph, $word, $transparent);
}

# add a word (without wrapping).
sub _add_next($;$$$) {
  my ($paragraph, $word, $transparent, $newlines_impossible) = @_;

  my $result = '';

  if (!defined($word)) {
    return '';
  }

  if ($word eq '') {
    $paragraph->{'invisible_pending_word'} = 1;
  } else {
    $paragraph->{'word'} .= $word;
  }

  if (!$transparent
      and ($word =~
           /([^$end_sentence_characters$after_punctuation_characters])
            [$end_sentence_characters$after_punctuation_characters]*$/ox)) {
    # Save the last character in $word before punctuation
    $paragraph->{'last_letter'} = $1;
  }

  if (!$newlines_impossible and $word =~ /\n/) {
    $result .= _add_pending_word($paragraph);
    _end_line($paragraph);
  } else {
    $paragraph->{'word_counter'}
      += Texinfo::Convert::Unicode::string_width($word);

    # The $paragraph->{'counter'} != 0 is here to avoid having an
    # additional line output when the text is longer than the max.
    if ($paragraph->{'counter'} != 0 and
        $paragraph->{'counter'} + $paragraph->{'word_counter'} +
           length($paragraph->{'space'}) > $paragraph->{'max'}) {
      $result .= _cut_line($paragraph);
    }
  }
  if ($paragraph->{'debug'}) {
    print STDERR "WORD+ $word -> $paragraph->{'word'}\n";
  }

  return $result;
}

# Values for 'end_sentence'.
# 'end_sentence' can also be unset, meaning not at the end of a sentence.
use constant {
  # end of sentence is inhibited
  eos_inhibited => 0,
  # at end of sentence
  eos_present => 1,
  # at end of sentence but frenchspacing is on.
  eos_present_frenchspacing => -1,
};

sub remove_end_sentence($) {
  my $paragraph = shift;

  $paragraph->{'end_sentence'} = eos_inhibited;
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

  # begin a word, to have something even if empty
  if ($no_break and $paragraph->{'word'} eq '') {
    $paragraph->{'invisible_pending_word'} = 1;
  }
}

# Wrap $TEXT, returning the wrapped text, taking into account the current state
# of $PARAGRAPH.  Any end of sentence punctuation in $TEXT that should be
# allowed to end a sentence but which would otherwise be preceded by an
# upper-case letter should instead by preceded by a backspace character.
sub add_text($$) {
  my ($paragraph, $text) = @_;

  $paragraph->{'end_line_count'} = 0;
  my $result = '';

  my @segments = split
    /(\s+)|(\p{InFullwidth})|((?:[^\s\p{InFullwidth}\x08])+)|(\x08)/,
    $text;

  # Check now if a newline exists anywhere in the string to
  # try to eliminate regex checks later.
  my $newline_possible_flag = ($text =~ /\n/);

  my $debug_flag = $paragraph->{'debug'};
  while (@segments) {
    # $empty_segment should be an empty string; the other variables
    # here were recognized as field separators by split.  One of the
    # other variable matched as separator, the other are undef.
    my ($empty_segment, $spaces, $fullwidth_segment, $added_word, $allow_eos)
     = splice (@segments, 0, 5);

    if ($debug_flag) {
      print STDERR "p ($paragraph->{'counter'}+$paragraph->{'word_counter'}) "
       ."s `" . _print_escaped_spaces($paragraph->{'space'})."', "
       ."l `$paragraph->{'last_letter'}', "
       ."w$paragraph->{'invisible_pending_word'} `$paragraph->{'word'}'\n";
    }
    if (defined($spaces)) {
      print STDERR "SPACES($paragraph->{'counter'}) `"
          ._print_escaped_spaces($spaces)."'\n" if $debug_flag;
      if ($paragraph->{'unfilled'}) {
        $result .= _add_pending_word($paragraph);
        if ($spaces =~ /\n/) {
          $result .= _end_line($paragraph);
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

            # The $paragraph->{'counter'} != 0 is here to avoid having an
            # additional line output when the text is longer than the max.
            if ($paragraph->{'counter'} != 0 and
                $paragraph->{'counter'} + $paragraph->{'word_counter'} +
                   length($paragraph->{'space'}) > $paragraph->{'max'}) {
              $result .= _cut_line($paragraph);
            }
          }
        } else { # no_break off
          my $pending = $paragraph->{'invisible_pending_word'};
          $result .= _add_pending_word($paragraph);
          if ($paragraph->{'counter'} != 0 or $pending) {
            # If we are at the end of a sentence where two spaces
            # are required.
            if ($at_two_spaces_end_sentence) {
              $paragraph->{'space'} = '  ';
            } else { # Not at end of sentence.
              # Only save the first space
              if (length($paragraph->{'space'}) < 1) {
                $paragraph->{'space'} = ' ';
              }
            }
          }
        }
      }
      if ($paragraph->{'counter'} + length($paragraph->{'space'})
                      > $paragraph->{'max'}) {
        $result .= _cut_line($paragraph);
      }
      if ($newline_possible_flag and !$paragraph->{'unfilled'}
          and $paragraph->{'keep_end_lines'} and $spaces =~ /\n/) {
        $result .= _end_line($paragraph);
      }
      $paragraph->{'last_letter'} = ' ';
    } elsif (defined($allow_eos)) {
      # allow an end of sentence to occur.
      allow_end_sentence($paragraph);
    } elsif (defined($added_word)) {
      my $tmp = $added_word;
      # Prepend 'last_letter' to add the information on the last
      # letter even if it was read as part of a previous string.
      # Add it here because _add_next overwrites it.
      $tmp = $paragraph->{'last_letter'} . $tmp;

      $result .= _add_next($paragraph, $added_word, undef,
                           !$newline_possible_flag);

      # Check if it is considered as an end of sentence.  There are two things
      # to check: one, that we have a ., ! or ?; and second, that it is not
      # preceded by an upper-case letter (ignoring some punctuation)
      if (exists($paragraph->{'end_sentence'})
          and $added_word =~ /^[$after_punctuation_characters]*$/o) {
        # do nothing in the case of a continuation of after_punctuation_characters
      } elsif (!$paragraph->{'unfilled'}
          and $tmp =~
        /(^|[^\p{Upper}$after_punctuation_characters$end_sentence_characters])
         [$after_punctuation_characters]*[$end_sentence_characters]
         [$end_sentence_characters$after_punctuation_characters]*$/ox) {
        if ($paragraph->{'frenchspacing'}) {
          $paragraph->{'end_sentence'} = eos_present_frenchspacing;
        } else {
          $paragraph->{'end_sentence'} = eos_present;
        }
        print STDERR "END_SENTENCE\n" if ($paragraph->{'debug'});
      } else {
        print STDERR "delete END_SENTENCE($paragraph->{'end_sentence'})\n"
          if (exists($paragraph->{'end_sentence'}) and $paragraph->{'debug'});
        delete $paragraph->{'end_sentence'};
      }
    } elsif (defined($fullwidth_segment)) {
      print STDERR "FULLWIDTH\n" if ($paragraph->{'debug'});

      $paragraph->{'word'} .= $fullwidth_segment;
      $paragraph->{'word_counter'} += 2;

      # fullwidth latin letters can be upper case, so it is important to
      # use the actual characters here.
      $paragraph->{'last_letter'} = $fullwidth_segment;

      # We allow a line break in between Chinese characters even if
      # there was no space between them, unlike single-width
      # characters.
      if ($paragraph->{'counter'} != 0 and
          $paragraph->{'counter'} + $paragraph->{'word_counter'}
                               > $paragraph->{'max'}) {
        $result .= _cut_line($paragraph);
      }
      if (!$paragraph->{'no_break'}
          and !$paragraph->{'double_width_no_break'}) {
        $result .= _add_pending_word($paragraph);
      }
      delete $paragraph->{'end_sentence'};
    }
  }
  return $result;
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
