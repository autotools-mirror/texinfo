use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'rec_nodes'} = '*document_root C6
 *before_node_section C1
  *preamble
 *normal_command@node C5 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Top node\\n}
  {empty_line:\\n}
  *normal_command@menu C4 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chap-node}
     {normal_text:chap node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node-following-second}
     {normal_text:node following second}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l7
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C4 l9 {chap node}
 |identifier:{chap-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chap node}
   *line_arg
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l12
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{other-node}
     {normal_text:other node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l13
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chap-node}
     {normal_text:chap node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l14
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C4 l16 {other node}
 |identifier:{other-node}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:other node}
   *line_arg
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{chap-node}
    {normal_text:chap node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l18
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *menu_entry C4 l19
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{other-node}
     {normal_text:other node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l20
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C5 l22 {node up node following second}
 |identifier:{node-up-node-following-second}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:node up node following second}
   *line_arg
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{node-following-second}
    {normal_text:node following second}
    {spaces_after_argument:\\n}
  *normal_command@menu C3 l23
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l24
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node-following-second}
     {normal_text:node following second}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l25
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in node up node following second\\n}
  {empty_line:\\n}
 *normal_command@node C4 l29 {node following second}
 |identifier:{node-following-second}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:node following second}
   *line_arg
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{node-up-node-following-second}
    {normal_text:node up node following second}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in node following second\\n}
  *normal_command@menu C3 l32
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l33
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node-up-node-following-second}
     {normal_text:node up node following second}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l34
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'rec_nodes'} = '@node Top
Top node

@menu
* chap node::
* node following second::
@end menu

@node chap node,,Top,Top

@menu
* other node::
* chap node::
@end menu

@node other node,,,chap node

@menu 
* other node::
@end menu

@node node up node following second,,,node following second
@menu
* node following second::
@end menu

in node up node following second

@node node following second,,,node up node following second

in node following second
@menu
* node up node following second::
@end menu
';


$result_texts{'rec_nodes'} = 'Top node

* chap node::
* node following second::


* other node::
* chap node::


* other node::

* node following second::

in node up node following second


in node following second
* node up node following second::
';

$result_errors{'rec_nodes'} = '* W l13|node up pointer for `chap node\' is `Top\' but up is `chap node\' in menu
 warning: node up pointer for `chap node\' is `Top\' but up is `chap node\' in menu

* W l13|node prev pointer for `chap node\' is `Top\' but prev is `other node\' in menu
 warning: node prev pointer for `chap node\' is `Top\' but prev is `other node\' in menu

* W l19|node up pointer for `other node\' is `chap node\' but up is `other node\' in menu
 warning: node up pointer for `other node\' is `chap node\' but up is `other node\' in menu

';

$result_nodes_list{'rec_nodes'} = '1|Top
 menus:
  chap node
  node following second
 node_directions:
  next->chap node
2|chap node
 menus:
  other node
  chap node
 node_directions:
  prev->Top
  up->Top
3|other node
 menus:
  other node
 node_directions:
  up->chap node
4|node up node following second
 menus:
  node following second
 node_directions:
  up->node following second
5|node following second
 menus:
  node up node following second
 node_directions:
  up->node up node following second
';

$result_sections_list{'rec_nodes'} = '';

$result_sectioning_root{'rec_nodes'} = '';

$result_headings_list{'rec_nodes'} = '';

1;
