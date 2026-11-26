use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodename_parentheses'} = '*document_root C9
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
 *normal_command@top C4 l2 {The top node}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:The top node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C5 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Node-_0028with-parentheses_0029}
     {normal_text:Node (with parentheses)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Other-node}
     {normal_text:Other node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{node}
     {normal_text:(}
     {normal_text:manual}
     {normal_text:)}
     {normal_text:node}
    {menu_entry_separator:::}
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
 *normal_command@node C1 l10 {Node (with parentheses)}
 |identifier:{Node-_0028with-parentheses_0029}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Node (with parentheses)}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l11 {Section (nodename with parentheses)}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section (nodename with parentheses)}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Dummy section\\n}
  {empty_line:\\n}
 *normal_command@node C1 l15 {Other node}
 |identifier:{Other-node}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Other node}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 l16 {Section (nodename without parentheses)}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section (nodename without parentheses)}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Dummy link to }
   *normal_command@ref C1 l18
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Node-_0028with-parentheses_0029}
     {normal_text:Node (with parentheses)}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Dummy link to }
   *normal_command@ref C1 l20
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{_0028manual_0029node}
     {normal_text:(manual)node}
   {normal_text:.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l22 {(manual)node}
 |identifier:{_0028manual_0029node}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:(manual)node}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 l23 {(manual)node}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:(manual)node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Dummy section with (manual)node node syntax.\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l27
  |identifier:{_0028manual_0029anchor}
  |is_target:{1}
   *brace_arg C1
    {normal_text:(manual)anchor}
  *paragraph C1
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'nodename_parentheses'} = '@node Top
@top The top node

@menu
* Node (with parentheses)::
* Other node::
* (manual)node::
@end menu

@node Node (with parentheses)
@chapter Section (nodename with parentheses)

Dummy section

@node Other node
@chapter Section (nodename without parentheses)

Dummy link to @ref{Node (with parentheses)}.

Dummy link to @ref{(manual)node}.

@node (manual)node
@chapter (manual)node

Dummy section with (manual)node node syntax.

@anchor{(manual)anchor}.

';


$result_texts{'nodename_parentheses'} = 'The top node
************

* Node (with parentheses)::
* Other node::
* (manual)node::

1 Section (nodename with parentheses)
*************************************

Dummy section

2 Section (nodename without parentheses)
****************************************

Dummy link to Node (with parentheses).

Dummy link to (manual)node.

3 (manual)node
**************

Dummy section with (manual)node node syntax.

.

';

$result_errors{'nodename_parentheses'} = '* E l22|syntax for an external node used for `(manual)node\'
 syntax for an external node used for `(manual)node\'

* E l27|syntax for an external node used for `(manual)anchor\'
 syntax for an external node used for `(manual)anchor\'

* W l1|node `Top\' lacks menu item for `(manual)node\' but is above it in sectioning
 warning: node `Top\' lacks menu item for `(manual)node\' but is above it in sectioning

';

$result_nodes_list{'nodename_parentheses'} = '1|Top
 associated_section: The top node
 associated_title_command: The top node
 menus:
  Node (with parentheses)
  Other node
  (manual)node
 node_directions:
  next->Node (with parentheses)
2|Node (with parentheses)
 associated_section: 1 Section (nodename with parentheses)
 associated_title_command: 1 Section (nodename with parentheses)
 node_directions:
  next->Other node
  prev->Top
  up->Top
3|Other node
 associated_section: 2 Section (nodename without parentheses)
 associated_title_command: 2 Section (nodename without parentheses)
 node_directions:
  next->(manual)node
  prev->Node (with parentheses)
  up->Top
4|(manual)node
 associated_section: 3 (manual)node
 associated_title_command: 3 (manual)node
 node_directions:
  prev->Other node
  up->Top
';

$result_sections_list{'nodename_parentheses'} = '1|The top node
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Section (nodename with parentheses)
 section_children:
  1|Section (nodename with parentheses)
  2|Section (nodename without parentheses)
  3|(manual)node
2|Section (nodename with parentheses)
 associated_anchor_command: Node (with parentheses)
 associated_node: Node (with parentheses)
 section_directions:
  next->Section (nodename without parentheses)
  up->The top node
 toplevel_directions:
  next->Section (nodename without parentheses)
  prev->The top node
  up->The top node
3|Section (nodename without parentheses)
 associated_anchor_command: Other node
 associated_node: Other node
 section_directions:
  next->(manual)node
  prev->Section (nodename with parentheses)
  up->The top node
 toplevel_directions:
  next->(manual)node
  prev->Section (nodename with parentheses)
  up->The top node
4|(manual)node
 associated_anchor_command: (manual)node
 associated_node: (manual)node
 section_directions:
  prev->Section (nodename without parentheses)
  up->The top node
 toplevel_directions:
  prev->Section (nodename without parentheses)
  up->The top node
';

$result_sectioning_root{'nodename_parentheses'} = 'level: -1
list:
 1|The top node
';

$result_headings_list{'nodename_parentheses'} = '';

1;
