use strict;

use lib '.';
use Texinfo::ModulePath (undef, undef, undef, 'updirs' => 2);

require 't/test_utils.pl';

my @test_cases = (
['protect_colon_source_mark',
'@macro klm {arg}
some text : \arg\ then more
@end macro

There is @klm{nop} and after.
', {'TREE_TRANSFORMATIONS' => 'protect_colon'}],
['protect_node_after_label_source_mark_in_protected',
'@macro vvv {}
some text .,
@end macro

@set punct ,.

There is @vvv{},@value{punct}. and after.
', {'TREE_TRANSFORMATIONS' => 'protect_node_after_label'}],
['protect_comma_source_mark',
'@macro vvv {}
some text ,,
@end macro

@set punct ,,

There is @vvv{},@value{punct}, and after.
', {'TREE_TRANSFORMATIONS' => 'protect_comma'}],
['protect_first_parenthesis_source_mark',
'@macro vvv {}
(some text) aa,,
@end macro

@anchor{@vvv{}}.
', {'TREE_TRANSFORMATIONS' => 'protect_first_parenthesis'}],
['protect_first_parenthesis_after_parenthesis_source_mark',
'@macro vvv {}
(
@end macro

@anchor{@vvv{}my_f)}.
', {'TREE_TRANSFORMATIONS' => 'protect_first_parenthesis'}],
['protect_hashchar_at_line_beginning_source_mark',
undef,
  {'test_file' => 'cpp_directives_line_value_macro.texi',
   'TREE_TRANSFORMATIONS' => 'protect_hashchar_at_line_beginning'}],
['regenerate_master_menu_no_need_for_master_menu',
'@node Top
@top top

@menu
* chap::
@end menu

@node chap
@chapter Chapter
',{'TREE_TRANSFORMATIONS' => 'regenerate_master_menu',
   'FORMAT_MENU' => 'menu'},
  {'FORMAT_MENU' => 'menu'},
],
['regenerate_master_menu_with_menu_comment',
'@node Top
@top top

@menu
* chap::

A MC.
@end menu

@node chap
@chapter Chapter

@node sec
@section Sec
',{'TREE_TRANSFORMATIONS' => 'regenerate_master_menu',
   'FORMAT_MENU' => 'menu'},
  {'FORMAT_MENU' => 'menu'},
],
# NOTE sync with t/z_misc/automatic_nodes.t $sections_text
['insert_nodes_for_sectioning_commands',
'@top top section

@part part

@chapter chap, @code{a chap}

@node a node
@section section

@section truc
@subsection sub1

Text.

@subsection sub2 @c comment

@section section

@section section

@unnumbered

@section @asis{}

@bye',
  {'AUTO_SECTION_NODE' => 1,
   'WARN_DUPLICATE_SECTION_TARGET' => 1,},
],
['test_fill_gaps_in_sectioning',
'@top top

@chapter Chap

@section Section

@subsubsection There
', {'TREE_TRANSFORMATIONS' => 'fill_gaps_in_sectioning'},],
['test_fill_gaps_in_sectioning_insert_nodes',
'@top top

@chapter Chap

@section Section

@subsubsection There
', {'TREE_TRANSFORMATIONS' => 'fill_gaps_in_sectioning',
    'AUTO_SECTION_NODE' => 1},],
['test_insert_nodes_with_empty_headings',
'@top top

@chapter Chap

@section

@section

@node @strong{}
@section @strong{}
', {'AUTO_SECTION_NODE' => 1,},],
['index_entry_before_item_with_subentry',
'@node Top
@top top

@node Chap
@chapter chap

@itemize
@item first item

@cindex entry @subentry subentry
@item second item
@end itemize

@node Node index
@chapter Chap printindex

@printindex cp
', {'TREE_TRANSFORMATIONS' => 'move_index_entries_after_items'},
],
# Test addition of nodes with diverse protection and transformations needing
# to be done on node names more than AUTO_SECTION_NODE=1 as such.
['various_added_nodes_and_refs',
'@top otp

@chapter a node

@chapter a node @code{in code} @c comment

@section a ,, node @code{a,b,}

@section (in paren(too  aaa

@subsection changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})

@subsection @asis{}

@chapter a::b	 c

@section a node


@ref{a node}
@ref{a node @code{in code} @c comment
}
@ref{a ,, node @code{a,b,}}
@ref{(in paren(too  aaa}
@ref{changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})}
@ref{@asis{}}
@ref{a::b	 c}


', {'AUTO_SECTION_NODE' => 1},
],
['test_new_node_empty_ref',
'@top top

@chapter aa @ref{ , , , } g

@section b @ref{}

@subsection @ref

', {'AUTO_SECTION_NODE' => 1},
],
);

my @tests_converted = (
['test_insert_nodes_nodedescription',
'@top top
@nodedescription D1

@chapter Chap

@section Sec
@nodedescription D2
@nodedescription D3

@subsection Subsec

', {'AUTO_SECTION_NODE' => 1,
    'FORMAT_MENU' => 'menu'},
   {'FORMAT_MENU' => 'menu'},
],
['test_insert_nodes_reallocated_nodedescriptionblock',
'@node Top
@top top

@node chap
@chapter Chap

@section Sec
@nodedescriptionblock
D1
@end nodedescriptionblock

@nodedescriptionblock
D2
@end nodedescriptionblock

@subsection Subsec

', {'AUTO_SECTION_NODE' => 1,
    'FORMAT_MENU' => 'menu'},
   {'FORMAT_MENU' => 'menu'},
],
['regenerate_master_menu_language_at_beginning_and_end',
  undef,
  {'test_file'
       => '../../../tests/formatting/no_detailmenu_lang_at_begin_end.texi',
   'TREE_TRANSFORMATIONS' => 'regenerate_master_menu',
   'FORMAT_MENU' => 'menu',},
  {'FORMAT_MENU' => 'menu',},
],
['regenerate_master_menu_language_at_beginning_end_set_lang',
  undef,
  {'test_file'
       => '../../../tests/formatting/no_detailmenu_lang_at_begin_end.texi',
   'TREE_TRANSFORMATIONS' => 'regenerate_master_menu',
   'FORMAT_MENU' => 'menu', 'documentlanguage' => 'pl'},
  {'FORMAT_MENU' => 'menu', 'documentlanguage' => 'pl'},
],
);

my @tests_files = (
['master_menu_fr',
  undef,
  {'test_file'
       => '../../../tests/many_input_files/input_files/no_master_menu_fr.texi',
   'TREE_TRANSFORMATIONS' => 'regenerate_master_menu',
   'FORMAT_MENU' => 'menu'},
  {'FORMAT_MENU' => 'menu'},
],
# in the test suite, no transformation is set up in the default case.
# Therefore in the next test there is no relate_index_entries_to_table_items
# transformation used even when HTML is output.  With texi2any, outputting
# HTML sets the relate_index_entries_to_table_items transformation (tested in
# tests/indices index_entries_relate_to_item).
['index_entries_relate_to_item_no_transformation',
  undef,
  {'test_file' => '../../../tests/formatting/index_entries_relate_to_item.texi'},
],
# test relate_index_entries_to_table_items transformation
['index_entries_relate_to_item_transformation',
  undef,
  {'test_file' => '../../../tests/formatting/index_entries_relate_to_item.texi',
   'TREE_TRANSFORMATIONS' => 'relate_index_entries_to_table_items'},
],
);

foreach my $test (@tests_converted) {
  push @{$test->[2]->{'test_formats'}}, 'html';
  push @{$test->[2]->{'test_formats'}}, 'info';
}

foreach my $test (@tests_files) {
  push @{$test->[2]->{'test_formats'}}, 'file_html';
  push @{$test->[2]->{'test_formats'}}, 'info';
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all('transformations', [@test_cases, @tests_converted, @tests_files]);
