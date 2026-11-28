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

# NOTE this test is more important that it seems at first glance, since
# it is the only test of conversion of elements in source marks to Texinfo.

use strict;

use Data::Compare ();
use Test::More;

plan tests => 3;

# to find Texinfo_SWIG_Interface_Tests in source
use lib '.';

BEGIN {
  # to find Texinfo_SWIG_Interface_Tests in out of source builds
  my $srcdir = $ENV{'srcdir'};
  if (defined($srcdir)) {
    unshift @INC, $srcdir;
  }
}

use Texinfo_SWIG_Interface_Tests;

use Texinfo;

Texinfo::setup(1);

ok(1, 'modules loading');

my $parser = Texinfo::parser();

my $document = Texinfo::parse_text($parser, '@set myval toto

@macro do {a, b}
then \a\ and \b\.
@end macro

@macro onearg {gg}
OO \gg\
@end macro

@linemacro lm {one}
\one\bullet{}
@end linemacro

@linemacro defbuiltin {symbol, rest}
@defline \symbol\ f r
@defline expand Builtin and \rest\
@end linemacro

View @value{myval}.  And @do {mine, yours } .
Cmd @code{@value{myval}}, @footnote{@do{ feet , foot}}

@onearg the arg

text before @onearg  another arg@comment am I there?

@lm @

@defblock
@defbuiltin {my foo} a last {} arg{ument}

@defbuiltin {my foo} {} {}

@defbuiltin {my foo} {second arg} remaining on {line}
@end defblock

');

Texinfo::destroy_parser($parser);

my $error_messages
  = Texinfo_SWIG_Interface_Tests::get_parser_error_messages($document);

#foreach my $message (@$error_messages) {
#  print STDERR "'"
#    .Texinfo_SWIG_Interface_Tests::protect_perl_string($message)."',\n";
#}

my @reference_messages = ('28: misplaced { (possibly involving @lm)
',
'28: misplaced } (possibly involving @lm)
',
);
ok(Data::Compare::Compare($error_messages, \@reference_messages), 'errors');


my $tree = Texinfo::document_tree($document);
my $reader = Texinfo::new_reader($tree, $document);

my %expanded_source_mark_types;
foreach my $type ($Texinfo::SM_type_defline_continuation,
 $Texinfo::SM_type_macro_expansion, $Texinfo::SM_type_linemacro_expansion,
 $Texinfo::SM_type_value_expansion,
 $Texinfo::SM_type_ignored_conditional_block,
 $Texinfo::SM_type_expanded_conditional_command) {
  $expanded_source_mark_types{$type} = 1;
}

#print STDERR "TREE: ".Texinfo::tree_print_details($tree)."\n";

my $result = '';

while (1) {
  my $next_token = Texinfo::reader_read($reader);
  last if (!defined($next_token));

  # does not work
  #my $element = Texinfo::READER_TOKEN_element_get($next_token);
  my $element = $next_token->swig_element_get();
  my $category = $next_token->swig_category_get();

  next if ($category eq $Texinfo::TXI_READ_ELEMENT_END);

  my $source_marks_nr = Texinfo::element_source_marks_number($element);
  if ($source_marks_nr) {
    my $type = Texinfo::element_type($element);
    $type = '' if (!defined($type));
    $result .= $type;
    my $text = Texinfo::element_text($element);
    if (defined($text)) {
      if ($text eq '') {
        $result .= '[T]';
      } else {
        $text =~ s/\n/\\n/g;
        $result .= "[T: $text]";
      }
    }
    my $cmdname = Texinfo::element_cmdname($element);
    $result .= '@'.$cmdname if (defined($cmdname));
    $result .= '|'.$source_marks_nr."\n";

    for (my $i = 0; $i < $source_marks_nr; $i++) {
      my $source_mark = Texinfo::element_get_source_mark($element, $i);
      my $source_mark_type = $source_mark->swig_type_get();
      if ($expanded_source_mark_types{$source_mark_type}) {
        my $source_mark_counter = $source_mark->swig_counter_get();
        my $source_mark_status = $source_mark->swig_status_get();
        my $source_mark_position = $source_mark->swig_position_get();
        $source_mark_position = '-' if (!defined($source_mark_position));
        $result .= " $i: c:$source_mark_counter; s:$source_mark_status; ".
                   "p:$source_mark_position|";
        my $source_mark_line = $source_mark->swig_line_get();
        if (defined($source_mark_line)) {
          chomp($source_mark_line);
          $result .= "($source_mark_line)";
        }
        my $source_mark_element = $source_mark->swig_element_get();
        if (defined($source_mark_element)) {
          #print STDERR "!! ".Texinfo::tree_print_details($source_mark_element)."\n";
          $result
            .= '{'.Texinfo::convert_to_texinfo($source_mark_element).'}';
        }
        $result .= "\n";
      }
    }
  }
}

#my $result_string = Texinfo_SWIG_Interface_Tests::protect_perl_string($result);
#print STDERR "'$result_string'\n";

my $reference = 'normal_text[T: View toto.  And then mine and yours . .\\n]|4
 0: c:1; s:1; p:5|(toto){@value{myval}}
 1: c:1; s:2; p:9|
 2: c:1; s:1; p:16|{@do {mine, yours }}
 3: c:1; s:2; p:37|
normal_text[T: toto]|2
 0: c:2; s:1; p:0|(toto){@value{myval}}
 1: c:2; s:2; p:4|
normal_text[T: then feet  and foot.]|2
 0: c:2; s:1; p:0|{@do{ feet , foot}}
 1: c:2; s:2; p:20|
normal_text[T: OO the arg\\n]|2
 0: c:3; s:1; p:0|{@onearg the arg}
 1: c:3; s:2; p:10|
normal_text[T: text before OO another arg]|1
 0: c:4; s:1; p:12|{@onearg  another arg@comment am I there?}
rawline_text[T: am I there?]|1
 0: c:4; s:2; p:11|
empty_line[T: \\n]|1
 0: c:1; s:1; p:1|{@lm @
}
normal_text[T: bullet\\n]|1
 0: c:1; s:2; p:6|
block_line_arg|1
 0: c:2; s:1; p:0|{@defbuiltin {my foo} a last {} arg{ument}}
bracketed_arg|1
 0: c:2; s:2; p:0|
empty_line[T: \\n]|1
 0: c:3; s:1; p:1|{@defbuiltin {my foo} {} {}}
bracketed_arg|1
 0: c:3; s:2; p:0|
empty_line[T: \\n]|1
 0: c:4; s:1; p:1|{@defbuiltin {my foo} {second arg} remaining on {line}}
bracketed_arg|1
 0: c:4; s:2; p:0|
';

Texinfo_SWIG_Interface_Tests::is_diff($result, $reference,
                                      'source marks representation');

1;
