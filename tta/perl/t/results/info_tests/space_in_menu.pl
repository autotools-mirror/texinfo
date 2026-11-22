use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'space_in_menu'} = '*document_root C5
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
 *normal_command@top C6 l2 {Element}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Element}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Text.\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node}
     {normal_text:node}
    {menu_entry_separator:::           }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l8
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {node}
 |identifier:{node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l11 {node}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in chapter.\\n}
';


$result_texis{'space_in_menu'} = '@node Top
@top Element

Text.

@menu
* node::           
@end menu

@node node
@chapter node

in chapter.
';


$result_texts{'space_in_menu'} = 'Element
*******

Text.

* node::           

1 node
******

in chapter.
';

$result_errors{'space_in_menu'} = '';

$result_nodes_list{'space_in_menu'} = '1|Top
 associated_section: Element
 associated_title_command: Element
 menus:
  node
 node_directions:
  next->node
2|node
 associated_section: 1 node
 associated_title_command: 1 node
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'space_in_menu'} = '1|Element
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->node
 section_children:
  1|node
2|node
 associated_anchor_command: node
 associated_node: node
 section_directions:
  up->Element
 toplevel_directions:
  prev->Element
  up->Element
';

$result_sectioning_root{'space_in_menu'} = 'level: -1
list:
 1|Element
';

$result_headings_list{'space_in_menu'} = '';


$result_converted{'info'}->{'space_in_menu'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: node,  Up: (dir)

Element
*******

Text.

* Menu:

* node::


File: ,  Node: node,  Prev: Top,  Up: Top

1 node
******

in chapter.


Tag Table:
Node: Top27
Node: node117

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
