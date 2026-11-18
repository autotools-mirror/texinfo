use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'two_nodes_at_the_end_texi2html'} = '*document_root C7
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
    {Top}
    {spaces_after_argument:\\n}
 *@top C4 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter-1}
     {chapter 1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{node-after-chapter-1}
     {node after chapter 1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{last-node-in-chapter-1}
     {last node in chapter 1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l8
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l10 {chapter 1}
 |EXTRA
 |identifier:{chapter-1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {chapter 1}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{node-after-chapter-1}
    {spaces_before_argument: }
    {node after chapter 1}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {Top}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@chapter C2 l11 {chapter c1}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter c1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C4 l13 {node after chapter 1}
 |EXTRA
 |identifier:{node-after-chapter-1}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {node after chapter 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {in node after chapter 1\\n}
  {empty_line:\\n}
 *@node C1 l17 {last node in chapter 1}
 |EXTRA
 |identifier:{last-node-in-chapter-1}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {last node in chapter 1}
    {spaces_after_argument:\\n}
';


$result_texis{'two_nodes_at_the_end_texi2html'} = '@node Top
@top top

@menu
* chapter 1::
* node after chapter 1::
* last node in chapter 1::
@end menu

@node chapter 1, node after chapter 1, Top, Top
@chapter chapter c1

@node node after chapter 1

in node after chapter 1

@node last node in chapter 1
';


$result_texts{'two_nodes_at_the_end_texi2html'} = 'top
***

* chapter 1::
* node after chapter 1::
* last node in chapter 1::

1 chapter c1
************


in node after chapter 1

';

$result_errors{'two_nodes_at_the_end_texi2html'} = '* W l7|unexpected node `last node in chapter 1\' in menu
 warning: unexpected node `last node in chapter 1\' in menu

';

$result_nodes_list{'two_nodes_at_the_end_texi2html'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter 1
  node after chapter 1
  last node in chapter 1
 node_directions:
  next->chapter 1
2|chapter 1
 associated_section: 1 chapter c1
 associated_title_command: 1 chapter c1
 node_directions:
  next->node after chapter 1
  prev->Top
  up->Top
3|node after chapter 1
 node_directions:
  next->last node in chapter 1
  prev->chapter 1
  up->Top
4|last node in chapter 1
 node_directions:
  prev->node after chapter 1
  up->Top
';

$result_sections_list{'two_nodes_at_the_end_texi2html'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter c1
 section_children:
  1|chapter c1
2|chapter c1
 associated_anchor_command: chapter 1
 associated_node: chapter 1
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'two_nodes_at_the_end_texi2html'} = 'level: -1
list:
 1|top
';

$result_headings_list{'two_nodes_at_the_end_texi2html'} = '';

1;
