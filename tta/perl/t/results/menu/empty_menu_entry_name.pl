use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_menu_entry_name'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C4 l1 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C6 l4
    {menu_entry_leading_text:* }
    *menu_entry_name
    {menu_entry_separator:: }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:vvv}
     {normal_text:)}
    {menu_entry_separator:. }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:fff\\n}
   *menu_entry C6 l5
    {menu_entry_leading_text:* }
    *menu_entry_name
    {menu_entry_separator::}
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{aaa}
     {normal_text:aaa}
    {menu_entry_separator:,}
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
 *normal_command@node C1 l8 {aaa}
 |identifier:{aaa}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:aaa}
    {spaces_after_argument:\\n}
';


$result_texis{'empty_menu_entry_name'} = '@node first

@menu
* : (vvv). fff
* :aaa,
@end menu

@node aaa
';


$result_texts{'empty_menu_entry_name'} = '
* : (vvv). fff
* :aaa,

';

$result_errors{'empty_menu_entry_name'} = '* W l4|empty menu entry name in `* : (vvv). \'
 warning: empty menu entry name in `* : (vvv). \'

* W l5|empty menu entry name in `* :aaa,\'
 warning: empty menu entry name in `* :aaa,\'

* W l1|node `first\' not in menu
 warning: node `first\' not in menu

';

$result_nodes_list{'empty_menu_entry_name'} = '1|first
 menus:
  (vvv)
  aaa
2|aaa
 node_directions:
  prev->(vvv)
  up->first
';

$result_sections_list{'empty_menu_entry_name'} = '';

$result_sectioning_root{'empty_menu_entry_name'} = '';

$result_headings_list{'empty_menu_entry_name'} = '';

1;
