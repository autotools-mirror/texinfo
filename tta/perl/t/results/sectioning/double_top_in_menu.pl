use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_top_in_menu'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C5 l1 {ToP}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C2
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:ToP}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:top}
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
    |normalized:{Top}
     {normal_text:top}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Top}
     {normal_text:TOP}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:myself\\n}
   *normal_command@end C1 l7
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C2 l9 {top}
 |identifier:{Top}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:top}
   *line_arg
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:ToP}
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:second node.\\n}
';


$result_texis{'double_top_in_menu'} = '@node ToP, top
Top node

@menu
* top::
* TOP:: myself
@end menu

@node top,,ToP,Top
second node.
';


$result_texts{'double_top_in_menu'} = 'Top node

* top::
* TOP:: myself

second node.
';

$result_errors{'double_top_in_menu'} = '* E l9|@node `top\' previously defined
 @node `top\' previously defined

* EC l1|here is the previous definition as @node
 here is the previous definition as @node

* W l1|Next pointer `top\' (for node `ToP\') different from node name `ToP\'
 warning: Next pointer `top\' (for node `ToP\') different from node name `ToP\'

* W l9|Up pointer `Top\' (for node `top\') different from node name `ToP\'
 warning: Up pointer `Top\' (for node `top\') different from node name `ToP\'

* W l5|@menu entry node name `top\' different from node name `ToP\'
 warning: @menu entry node name `top\' different from node name `ToP\'

* W l6|@menu entry node name `TOP\' different from node name `ToP\'
 warning: @menu entry node name `TOP\' different from node name `ToP\'

';

$result_nodes_list{'double_top_in_menu'} = '1|ToP
 menus:
  top
  TOP
 node_directions:
  next->ToP
2|top
 node_directions:
  prev->ToP
  up->ToP
';

$result_sections_list{'double_top_in_menu'} = '';

$result_sectioning_root{'double_top_in_menu'} = '';

$result_headings_list{'double_top_in_menu'} = '';

1;
