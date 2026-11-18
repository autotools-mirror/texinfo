use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text_before_node'} = '*document_root C5
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
 *@top C5 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
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
    |normalized:{chapter-node}
     {chapter node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {text.\\n}
 *@node C1 l9 {chapter node}
 |EXTRA
 |identifier:{chapter-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter node}
    {spaces_after_argument:\\n}
 *@chapter C1 l10 {chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C2
    {spaces_before_argument: }
    {chapter}
';


$result_texis{'text_before_node'} = '@node Top
@top top

@menu
* chapter node::
@end menu

text.
@node chapter node
@chapter chapter';


$result_texts{'text_before_node'} = 'top
***

* chapter node::

text.
1 chapter
*********
';

$result_errors{'text_before_node'} = '';

$result_nodes_list{'text_before_node'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter node
 node_directions:
  next->chapter node
2|chapter node
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'text_before_node'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 associated_anchor_command: chapter node
 associated_node: chapter node
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'text_before_node'} = 'level: -1
list:
 1|top
';

$result_headings_list{'text_before_node'} = '';


$result_converted{'info'}->{'text_before_node'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chapter node,  Up: (dir)

top
***

* Menu:

* chapter node::

text.


File: ,  Node: chapter node,  Prev: Top,  Up: Top

1 chapter
*********


Tag Table:
Node: Top27
Node: chapter node125

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
