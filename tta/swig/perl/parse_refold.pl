#! /usr/bin/env perl

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
#
# Original author: Patrice Dumas <pertusus@free.fr>

# Parse a Texinfo manual and walk the tree to output the original Texinfo
# code by re-folding macros, values and other similar constructs found
# in the source marks as Texinfo code.  Also output include files separately.

use strict;
use warnings;

# To check if there is no erroneous autovivification
#no autovivification qw(fetch delete exists store strict);

use Carp qw(cluck confess);

# to determine the path separator
use Config;

# for fileparse
use File::Basename;
use File::Spec;

use File::Path;

use Encode;

use Getopt::Long qw(GetOptions);

use Cwd;

BEGIN {
  my ($real_command_name, $command_directory, $command_suffix)
     = fileparse($0, '.pl');
  my $updir = File::Spec->updir();

  # Nothing needed in source directory for now, but keep the include there
  # nonetheless
  my $srcdir = $ENV{'srcdir'};
  if (!defined($srcdir)) {
    $srcdir = $command_directory;
  }
  unshift @INC, $srcdir;

  # To find the XS extension
  my $t2a_builddir = $ENV{'t2a_builddir'};
  if (!defined($t2a_builddir) and defined($srcdir)) {
    # this is correct for in-source builds only.
    $t2a_builddir = join('/', ($srcdir, $updir, $updir));
  }
  my $xs_found;
  if (defined($t2a_builddir)) {
    my $xsdir = join('/', ($t2a_builddir, 'swig', 'perl', '.libs'));
    if (-d $xsdir) {
      $xs_found = 1;
      # for Texinfo.pm
      unshift @INC, join('/', ($t2a_builddir, 'swig', 'perl'));
      # for XS
      unshift @INC, $xsdir;
    }
  }
  if (not $xs_found and -d 'blib' and -f 'Makefile.PL') {
    # with Perl build system, in-source paths
    unshift @INC, 'blib/arch', 'blib/lib';
  }
}

use Texinfo;

my ($real_command_name, $command_directory, $command_suffix)
   = fileparse($0, '.pl');

# determine the path separators
my $path_separator = $Config{'path_sep'};
$path_separator = ':' if (!defined($path_separator));
my $quoted_path_separator = quotemeta($path_separator);

my @include_dirs = ();

Getopt::Long::Configure("gnu_getopt");

my $debug = 0;
my $result_options = Getopt::Long::GetOptions (
 'debug|d' => \$debug,
 'I=s' => sub { push @include_dirs, split(/$quoted_path_separator/, $_[1]); },
);

Texinfo::setup(1);

my $curdir = File::Spec->curdir();

my $input_file;
my $output_dir;
my $args_nr = scalar(@ARGV);
if ($args_nr) {
  $input_file = $ARGV[0];
  if ($args_nr > 1) {
    $output_dir = $ARGV[1];
    if ($output_dir !~ /\S/) {
      $output_dir = $curdir;
    }
  }
} else {
  warn "Need arg\n";
  exit 1;
}

my ($input_filename, $input_directory, $suffix) = fileparse($input_file);

if (defined($output_dir)) {
  my $compared_dir = $input_directory;
  if (!defined($compared_dir) or $compared_dir eq '') {
    $compared_dir = $curdir;
  }
  if (Cwd::abs_path($compared_dir) eq Cwd::abs_path($output_dir)) {
    die "$real_command_name: ERROR: $compared_dir: $output_dir: input and output directories are the same\n";
  }
}

if (defined($output_dir)) {
  if (! -d $output_dir) {
    my $errors;
    my @created = File::Path::mkpath($output_dir, {'error' => \$errors});
    if (defined($errors) and scalar(@$errors)) {
      foreach my $error (@$errors) {
        my ($file, $message) = each %$error;
        warn "Error creating $file: $message\n";
      }
      die "$real_command_name: ERROR: $output_dir: error creating directory\n";
    }
  }
}


# Parse the input file
my $canon_input_dir;
if (!defined($input_directory) or $input_directory eq '') {
  $input_directory = $curdir;
  $canon_input_dir = $curdir;
} else {
  $canon_input_dir = File::Spec->canonpath($input_directory);
}

my @prepended_include_directories = ($curdir);
push @prepended_include_directories, $input_directory
      if ($canon_input_dir ne $curdir);

unshift @include_dirs, @prepended_include_directories;

my $parser = Texinfo::parser;

Texinfo::parser_conf_clear_INCLUDE_DIRECTORIES($parser);
foreach my $dir (@include_dirs) {
  Texinfo::parser_conf_add_include_directory($parser, $dir);
}

Texinfo::parser_conf_clear_expanded_formats($parser);
foreach my $format ('info', 'plaintext', 'html', 'latex', 'docbook', 'xml') {
  Texinfo::parser_conf_add_expanded_format($parser, $format);
}

my ($document, $status) = Texinfo::parse_file($parser, $input_file);

Texinfo::destroy_parser($parser);

Texinfo::output_parser_error_messages($document);

if ($status) {
  warn "$real_command_name: ERROR: processing $input_file\n";
  exit 1;
}

my $tree = Texinfo::document_tree($document);

#print STDERR "Tree parsed\n";

if ($debug) {
  print STDERR Texinfo::tree_print_details($tree)."\n\n\n";
}


my $global_info = Texinfo::document_global_information($document);

#my $include_directories = $global_info->swig_included_files_get();
#
#my $include_directories_nr
#   = Texinfo::string_list_strings_number($include_directories);
#for (my $i = 0; $i < $include_directories_nr; $i++) {
#  my $include_dir
#     = Texinfo::string_list_string_by_index($include_directories, $i);
#  print STDERR "IDIR: $include_dir\n";
#}

my $encoding = $global_info->swig_input_encoding_name_get();
# not actually possible, encoding is also set in the default case.
$encoding = 'UTF-8' if (!defined($encoding));

# To support old manuals in which US-ASCII can be specified although
# the encoding corresponds to any 8bit encoding compatible with ISO-8859-1,
# we convert US-ASCII as ISO-8859-1 to avoid errors for characters in
# ISO-8859-1 but not in US-ASCII.
my $out_encoding;
if (lc($encoding) eq 'us-ascii') {
  $out_encoding = 'iso-8859-1';
} else {
  $out_encoding = $encoding;
}

# SWIG always uses sv_setpvn returning bytes and C encodes in UTF-8, so we
# convert to Perl characters by decoding from UTF-8
sub _decode($) {
  my $text = shift;
  return Encode::decode('UTF-8', $text);
}

sub _current_smark($) {
  my $current_smark = shift;

  return defined($current_smark) ?
             "$current_smark->[0]:$current_smark->[1]" : '-';
}

# used to avoid outputting again an include file already included
my %files_done;

sub _write_output($) {
  my $spec = shift;

  my ($file_name, $result, $counter, $s_mark) = @$spec;

  my ($input_filename, $input_directory, $suffix) = fileparse($file_name);

  return if ($files_done{$input_filename});

  $files_done{$input_filename} = 1;

  my $out_file;
  my $filehandle;
  if (defined($output_dir)) {
    $out_file = join('/', ($output_dir, $input_filename));
    if (!open($filehandle, '>', $out_file)) {
      warn "$real_command_name: ERROR: open $out_file: $!\n";
      return;
    }
  } else {
    $filehandle = \*STDOUT;
  }

  my $output = $$result;

  # We encode the output strings to the document encoding

  binmode($filehandle, ":encoding($out_encoding)");

  print $filehandle "$output";

  if (defined($out_file)) {
    if (!close($filehandle)) {
      warn("$real_command_name: ERROR: closing $out_file: $!\n");
    }
  }
  return;
}

sub _text($$$;$) {
  my ($text, $from, $type, $to) = @_;

  my $result = '';

  $from = 0 if (!defined($from));

  if ($type eq 'bracketed_linemacro_arg') {
    # recreate the text the source marks are relative too
    $text = '{'.$text.'}';
  }

  my $length;
  if (defined($to)) {
    $length = $to - $from;
  }

  if (defined($length)) {
    $result .= substr($text, $from, $length);
  } else {
    $result .= substr($text, $from);
  }
  return $result;
}

sub _convert($$$;$);

sub _handle_source_marks($$$$) {
  my ($element, $type, $inputs, $current_smark) = @_;

  my $result = $inputs->[-1]->[1];
  my $last_position;
  my $smark_e_text;
  my $source_marks_nr = Texinfo::element_source_marks_number($element);
  if ($source_marks_nr) {
    if ($debug) {
      print STDERR "_SOURCEMARKS ($source_marks_nr)\n";
    }
    for (my $i = 0; $i < $source_marks_nr; $i++) {
      my $source_mark = Texinfo::element_get_source_mark($element, $i);
      my $source_mark_counter = $source_mark->swig_counter_get();
      my $source_mark_type = $source_mark->swig_type_get();

      if ($current_smark) {
        if ($source_mark_counter == $current_smark->[1]
            and $current_smark->[0] eq $source_mark_type) {
          $last_position = $source_mark->swig_position_get();
          if ($debug) {
            print STDERR "END_SMARK($i): $source_mark_type;".
               "c:$source_mark_counter;p:$last_position\n";
          }
          $current_smark = undef;
        }
      }

      my $source_mark_status = $source_mark->swig_status_get();

      my $source_mark_position = $source_mark->swig_position_get();
      if (defined($source_mark_position) and $source_mark_position > 0) {
        if (!$current_smark) {
          # source_mark_position > 0 only in text elements
          my $text = _decode(Texinfo::element_text($element));
          my $text_result = _text($text, $last_position, $type,
                                  $source_mark_position);
          if ($debug) {
            print STDERR "TEXT_SMARK($i) "
              .(defined($last_position) ? $last_position : '-')
                .":$source_mark_position"
                ." '$text_result'\n";
                #."\n";
          }
          $$result .= $text_result;
        }
      }
      $last_position = $source_mark_position;

      # value expansion has both a line and an element, the line
      # is the flag name, what we are interested in is the element
      my $source_mark_element = $source_mark->swig_element_get();
      if (defined($source_mark_element)) {
        if ($debug) {
          print STDERR "_E_SMARK($i): "
           #.Texinfo::tree_print_details($source_mark_element)."\n";
           ."\n";
        }

        ($result, $current_smark)
          = _convert($source_mark_element, $document, $inputs, $current_smark);
      } elsif (!$current_smark) {
        if ($source_mark_type == $Texinfo::SM_type_delcomment) {
          $$result .= "\x{7F}";
        } elsif ($source_mark_type
                   == $Texinfo::SM_type_macro_arg_escape_backslash) {
          $$result .= '\\';
        }
        my $source_mark_line = _decode($source_mark->swig_line_get());
        if (defined($source_mark_line)) {
          $$result .= $source_mark_line;
        } elsif ($source_mark_type == $Texinfo::SM_type_defline_continuation) {
          $$result .= "@\n";
        }
      }
      if ($source_mark_type eq $Texinfo::SM_type_include) {
        if ($source_mark_status eq $Texinfo::SM_status_start) {
          my $file_name
           = Texinfo::element_attribute_string($source_mark_element,
                                               'text_arg');
          if ($debug) {
            print STDERR "INCLUDE($i) '$file_name' "
              ."c:$source_mark_counter;s_m:".
                        _current_smark($current_smark)."\n";
          }
          my $result_text = '';
          $result = \$result_text;
          push @$inputs, [$file_name, $result, $source_mark_counter,
                          $current_smark];
          $current_smark = undef;
        } elsif ($source_mark_status eq $Texinfo::SM_status_end) {
          my $previous_input = pop @$inputs;
          if ($debug) {
            print STDERR "END_INCLUDE($i) c:$source_mark_counter"
                     ."|$previous_input->[2];s_m:".
                        _current_smark($inputs->[-1]->[3])." \n";
          }
          _write_output($previous_input);
          $current_smark = $previous_input->[3];
          $result = $inputs->[-1]->[1];
        }
      } elsif (!$current_smark) {
        if ($source_mark_status eq $Texinfo::SM_status_start
            # expanded conditional has a start and an end, but the
            # tree within is the expanded tree and should not be skipped
            and $source_mark_type
                != $Texinfo::SM_type_expanded_conditional_command) {
          if ($debug) {
            print STDERR "START_SMARK($i): $source_mark_type;"
              ."c:$source_mark_counter\n";
          }
          $current_smark = [$source_mark_type, $source_mark_counter];
        }
      }
    }
    if ($debug) {
      print STDERR "_OUTSMARKS [p:".
        (defined($last_position) ? $last_position : 0)."] "
           ._current_smark($current_smark)."\n";
    }
  }
  return $result, $last_position, $current_smark;
}

sub _convert($$$;$) {
  my ($tree, $document, $inputs, $current_smark) = @_;

  if (ref($inputs) ne 'ARRAY' or ref($inputs->[-1]) ne 'ARRAY') {
    confess();
  }
  my $result = $inputs->[-1]->[1];

  if ($debug) {
    print STDERR "_CONVERT: "._current_smark($current_smark)."\n";
  }
  my $reader = Texinfo::new_reader($tree, $document);

  my $args_stack = [];

  while (1) {
    my $next_token = Texinfo::reader_read($reader);
    last if (!defined($next_token));

    my $element = $next_token->swig_element_get();
    my $category = $next_token->swig_category_get();

    my $type = Texinfo::element_type($element);
    $type = '' if (!defined($type));

    if ($debug) {
      print STDERR "R [".join('|', map {join(';', @$_)} @$args_stack)
        ."] $category ". _current_smark($current_smark)
        .' '.Texinfo::element_print_details($element)."\n";
    }

    if ($category == $Texinfo::TXI_READ_TEXT
        or $category == $Texinfo::TXI_READ_IGNORABLE_TEXT) {
      my ($last_position, $smark_result);
      ($result, $last_position, $current_smark)
        = _handle_source_marks($element, $type, $inputs, $current_smark);
      if (!defined($current_smark)) {
        if ($type eq 'spaces' or $type eq 'spaces_before_argument') {
          my ($inserted, $status)
                  = Texinfo::element_attribute_integer($element,
                                                       'inserted');
          next if ($inserted);
        }
        my $text = _decode(Texinfo::element_text($element));
        $$result .= _text($text, $last_position, $type);
      }
      next;
    }

    my $cmdname = Texinfo::element_cmdname($element);

    if (defined($cmdname)) {
      if ($category != $Texinfo::TXI_READ_ELEMENT_END) {
        if (!defined($current_smark)) {
          my $alias_of = Texinfo::element_attribute_string($element,
                                                          'alias_of');
          $$result .= '@';
          if (defined($alias_of)) {
            $$result .= $alias_of;
          } else {
            $$result .= $cmdname;
          }
        }

        my $spaces_cmd_before_arg
          = Texinfo::element_attribute_element($element,
                                 'spaces_after_cmd_before_arg');
        if (defined($spaces_cmd_before_arg)) {
          ($result, $current_smark)
           = _convert($spaces_cmd_before_arg, $document,
                      $inputs, $current_smark);
        }
      }

      if ($category == $Texinfo::TXI_READ_ELEMENT_START) {
        if (Texinfo::element_command_is_brace($element)
            or $type eq 'definfoenclose_command'
            or $type eq 'macro_call' or $type eq 'rmacro_call') {
          if ($cmdname eq 'verb') {
            push @$args_stack, [0, _decode(
                   Texinfo::element_attribute_string($element, 'delimiter'))];
          } else {
            push @$args_stack, [0, undef];
          }
        } elsif (!Texinfo::element_command_is_nobrace($element)) {
          push @$args_stack, [0, undef];
        }
      } elsif ($category == $Texinfo::TXI_READ_ELEMENT_END) {
        if (Texinfo::element_command_is_brace($element)
            or $type eq 'definfoenclose_command',
            or $type eq 'macro_call' or $type eq 'rmacro_call') {
          if (!defined($current_smark)) {
            if ($cmdname eq 'verb') {
              $$result
               .= _decode(
                 Texinfo::element_attribute_string($element, 'delimiter'));
            }
            if (Texinfo::element_type(
                  Texinfo::element_get_child($element, -1))
                       ne 'following_arg') {
              $$result .= '}';
            }
          }
        }
      }
    } else {
      if ($category == $Texinfo::TXI_READ_ELEMENT_START) {
        my ($inserted, $status)
                  = Texinfo::element_attribute_integer($element,
                                                       'inserted');
        if ($inserted) {
          Texinfo::reader_skip_children($reader, $element);
          next;
        }
      }
      if ($category == $Texinfo::TXI_READ_ELEMENT_START
          or $category == $Texinfo::TXI_READ_EMPTY) {
        if (!defined($current_smark)) {
          if ($type eq 'bracketed_arg') {
            $$result .= '{';
          }
        }
        if ($type eq 'brace_arg' or $type eq 'elided_brace_command_arg'
            or $type eq 'brace_command_context'
            or $type eq 'brace_container'
            or $type eq 'line_arg' or $type eq 'block_line_arg') {
          $args_stack->[-1]->[0]++;
          if (!defined($current_smark)) {
            if ($args_stack->[-1]->[0] > 1) {
              $$result .= ',';
            } elsif ($type ne 'line_arg' and $type ne 'block_line_arg') {
              my $verb_delimiter = $args_stack->[-1]->[1];
              $$result .= '{';
              if (defined($verb_delimiter)) {
                $$result .= $verb_delimiter;
              }
            }
          }
        }
      }
    }
    if ($category == $Texinfo::TXI_READ_ELEMENT_START
        or $category == $Texinfo::TXI_READ_EMPTY) {
      my $spaces_before_argument
        = Texinfo::element_attribute_element($element,
                               'spaces_before_argument');
      if (defined($spaces_before_argument)) {
        ($result, $current_smark)
           = _convert($spaces_before_argument, $document,
                      $inputs, $current_smark);
      }
    }
    if ($category == $Texinfo::TXI_READ_EMPTY
        or $category == $Texinfo::TXI_READ_ELEMENT_END) {
      my $spaces_after_argument
        = Texinfo::element_attribute_element($element,
                               'spaces_after_argument');
      if (defined($spaces_after_argument)) {
        ($result, $current_smark)
           = _convert($spaces_after_argument, $document,
                      $inputs, $current_smark);
      }

      if ($type eq 'line_arg' or $type eq 'block_line_arg') {
        my $comment_e = Texinfo::element_attribute_element($element,
                                           'comment_at_end');
        if ($comment_e) {
          my $comment;
          ($result, $current_smark)
             = _convert($comment_e, $document, $inputs, $current_smark);
        }
      }

      if (!defined($current_smark)) {
        if ($type eq 'bracketed_arg') {
          $$result .= '}';
        }
      }
    }

    if ($category == $Texinfo::TXI_READ_ELEMENT_END) {
      if (defined($cmdname)
          and !Texinfo::element_command_is_nobrace($element)) {
        pop @$args_stack;
      }
    }
    if ($category == $Texinfo::TXI_READ_EMPTY
        or $category == $Texinfo::TXI_READ_ELEMENT_END) {
      my ($last_position, $smark_result);
      ($result, $last_position, $current_smark)
         = _handle_source_marks($element, $type, $inputs, $current_smark);
    }
  }

  if ($debug) {
    print STDERR "_END "._current_smark($current_smark)."\n";
    print STDERR "RESULT: '$$result'\n";
  }
  return ($result, $current_smark);
}

my $result_text = '';
my $inputs = [[$input_filename, \$result_text, -1, undef]];
my ($result, $current_smark) = _convert($tree, $document, $inputs);

if (defined($current_smark)) {
  warn "REMARK: Source mark not closed\n";
}

_write_output($inputs->[0]);
