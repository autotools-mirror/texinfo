use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unknown_node_in_menu'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *@node C3 l1 {first}
 |EXTRA
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{unknown}
     {normal_text:unknown}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l5
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'unknown_node_in_menu'} = '@node first

@menu
* unknown::
@end menu
';


$result_texts{'unknown_node_in_menu'} = '
* unknown::
';

$result_errors{'unknown_node_in_menu'} = '* E l4|@menu reference to nonexistent node `unknown\'
 @menu reference to nonexistent node `unknown\'

';

$result_nodes_list{'unknown_node_in_menu'} = '1|first
 menus:
  unknown
';

$result_sections_list{'unknown_node_in_menu'} = '';

$result_sectioning_root{'unknown_node_in_menu'} = '';

$result_headings_list{'unknown_node_in_menu'} = '';

1;
