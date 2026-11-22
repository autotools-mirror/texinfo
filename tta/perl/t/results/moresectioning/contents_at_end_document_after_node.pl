use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'contents_at_end_document_after_node'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C4 l2 {contents at end document after node}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:contents at end document after node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{a-node}
     {normal_text:a node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@chapter C2 l8 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C3 l10 {a node}
 |EXTRA
 |identifier:{a-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:a node}
   *line_arg
   *line_arg
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@contents C1 l12
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'contents_at_end_document_after_node'} = '@node Top
@top contents at end document after node

@menu
* a node::
@end menu

@chapter chap

@node a node,,,Top

@contents
';


$result_texts{'contents_at_end_document_after_node'} = 'contents at end document after node
***********************************

* a node::

1 chap
******


';

$result_errors{'contents_at_end_document_after_node'} = '';

$result_nodes_list{'contents_at_end_document_after_node'} = '1|Top
 associated_section: contents at end document after node
 associated_title_command: contents at end document after node
 menus:
  a node
 node_directions:
  next->a node
2|a node
 node_directions:
  up->Top
';

$result_sections_list{'contents_at_end_document_after_node'} = '1|contents at end document after node
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 section_directions:
  up->contents at end document after node
 toplevel_directions:
  prev->contents at end document after node
  up->contents at end document after node
';

$result_sectioning_root{'contents_at_end_document_after_node'} = 'level: -1
list:
 1|contents at end document after node
';

$result_headings_list{'contents_at_end_document_after_node'} = '';

1;
