use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'loop_nodes'} = '*document_root C6
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l2 {top}
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
    |normalized:{chap-node-up}
     {normal_text:chap node up}
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
 *normal_command@node C4 l8 {chap node up}
 |identifier:{chap-node-up}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chap node up}
   *line_arg
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{node-down}
    {normal_text:node down}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l10
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node-middle}
     {normal_text:node middle}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l12
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C4 l14 {node middle}
 |identifier:{node-middle}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:node middle}
   *line_arg
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{chap-node-up}
    {normal_text:chap node up}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l16
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l17
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node-down}
     {normal_text:node down}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l18
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l20 {node down}
 |identifier:{node-down}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node down}
    {spaces_after_argument:\\n}
';


$result_texis{'loop_nodes'} = '@node Top
@top top

@menu
* chap node up::
@end menu

@node chap node up,,,node down

@menu
* node middle::
@end menu

@node node middle,,,chap node up

@menu
* node down::
@end menu

@node node down
';


$result_texts{'loop_nodes'} = 'top
***

* chap node up::


* node middle::


* node down::

';

$result_errors{'loop_nodes'} = '';

$result_nodes_list{'loop_nodes'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chap node up
 node_directions:
  next->chap node up
2|chap node up
 menus:
  node middle
 node_directions:
  up->node down
3|node middle
 menus:
  node down
 node_directions:
  up->chap node up
4|node down
 node_directions:
  up->node middle
';

$result_sections_list{'loop_nodes'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'loop_nodes'} = 'level: -1
list:
 1|top
';

$result_headings_list{'loop_nodes'} = '';


$result_converted{'latex_text'}->{'loop_nodes'} = '\\begin{document}
\\label{anchor:Top}%
\\label{anchor:chap-node-up}%


\\label{anchor:node-middle}%


\\label{anchor:node-down}%
';

1;
