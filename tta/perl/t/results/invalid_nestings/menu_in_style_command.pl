use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'menu_in_style_command'} = '*document_root C2
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
  *paragraph C1
   *normal_command@code C1 l3
    *brace_container C1
     {normal_text:\\n}
  *normal_command@menu C3 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:truc}
     {normal_text:)}
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
';


$result_texis{'menu_in_style_command'} = '@node first

@code{
}@menu
* (truc)::
@end menu
';


$result_texts{'menu_in_style_command'} = '

* (truc)::
';

$result_errors{'menu_in_style_command'} = '* E l3|@code missing closing brace
 @code missing closing brace

* E l7|misplaced }
 misplaced }

';

$result_nodes_list{'menu_in_style_command'} = '1|first
 menus:
  (truc)
';

$result_sections_list{'menu_in_style_command'} = '';

$result_sectioning_root{'menu_in_style_command'} = '';

$result_headings_list{'menu_in_style_command'} = '';

1;
