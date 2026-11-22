use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'style_not_closed_no_newline_root_commands'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C5 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l6
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   *normal_command@code C1 l8
    *brace_container C1
     {normal_text:not closed\\n}
 *normal_command@node C1 l9 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l10 {chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   *normal_command@code C1 l12
    *brace_container C1
     {normal_text:still not closed\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'style_not_closed_no_newline_root_commands'} = '@node Top
@top top

@menu
* chapter::
@end menu

@code{not closed
}@node chapter
@chapter chapter

@code{still not closed
}@bye
';


$result_texts{'style_not_closed_no_newline_root_commands'} = 'top
***

* chapter::

not closed
1 chapter
*********

still not closed
';

$result_errors{'style_not_closed_no_newline_root_commands'} = '* W l9|@node should not appear in @code
 warning: @node should not appear in @code

* E l8|@node seen before @code closing brace
 @node seen before @code closing brace

* W l13|@bye should not appear in @code
 warning: @bye should not appear in @code

* E l12|@bye seen before @code closing brace
 @bye seen before @code closing brace

';

$result_nodes_list{'style_not_closed_no_newline_root_commands'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'style_not_closed_no_newline_root_commands'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'style_not_closed_no_newline_root_commands'} = 'level: -1
list:
 1|top
';

$result_headings_list{'style_not_closed_no_newline_root_commands'} = '';

1;
