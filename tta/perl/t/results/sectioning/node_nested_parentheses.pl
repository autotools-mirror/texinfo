use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'node_nested_parentheses'} = '*document_root C2
 *before_node_section C1
  *preamble
 *normal_command@node C3 l1 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C6 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:(some) file}
     {normal_text:)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{node-name}
     {normal_text:(}
     {normal_text:other (file)}
     {normal_text:)}
     {normal_text:node name}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |manual_content:A{1|1}
    |node_content:A{4|4}
    |normalized:{close_0029}
     {normal_text:(}
     *normal_command@code C1 l6
      *brace_container C1
       {normal_text:open(}
     {normal_text:)}
     {normal_text: }
     {normal_text:close)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |node_content:A{0|2}
    |normalized:{_0028_0029_0029_0029-error}
     {normal_text:(}
     *normal_command@code C1 l7
      *brace_container C1
       {normal_text:)))}
     {normal_text: error}
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
';


$result_texis{'node_nested_parentheses'} = '@node first

@menu
* ((some) file)::
* (other (file))node name::
* (@code{open(}) close)::
* (@code{)))} error::
@end menu
';


$result_texts{'node_nested_parentheses'} = '
* ((some) file)::
* (other (file))node name::
* (open() close)::
* ())) error::
';

$result_errors{'node_nested_parentheses'} = '* E l7|@menu reference to nonexistent node `(@code{)))} error\'
 @menu reference to nonexistent node `(@code{)))} error\'

';

$result_nodes_list{'node_nested_parentheses'} = '1|first
 menus:
  ((some) file)
  (other (file))node name
  (@code{open(}) close)
  (@code{)))} error
';

$result_sections_list{'node_nested_parentheses'} = '';

$result_sectioning_root{'node_nested_parentheses'} = '';

$result_headings_list{'node_nested_parentheses'} = '';

1;
