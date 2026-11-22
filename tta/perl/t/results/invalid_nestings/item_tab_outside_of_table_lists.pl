use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'item_tab_outside_of_table_lists'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content
  *@itemx C1 l1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:itemx outside.}
    {spaces_after_argument:\\n}
  {ignorable_spaces_after_command: }
  *paragraph C2
   {normal_text:headitem outside.\\n}
   {normal_text: someitem outside.\\n}
  {ignorable_spaces_after_command: }
  *paragraph C1
   {normal_text:tab outside\\n}
';


$result_texis{'item_tab_outside_of_table_lists'} = '@itemx itemx outside.
 headitem outside.
 someitem outside.
 tab outside
';


$result_texts{'item_tab_outside_of_table_lists'} = 'itemx outside.
headitem outside.
 someitem outside.
tab outside
';

$result_errors{'item_tab_outside_of_table_lists'} = '* E l1|@itemx outside of table or list
 @itemx outside of table or list

* E l2|@headitem outside of table or list
 @headitem outside of table or list

* E l3|unknown command `someitem\'
 unknown command `someitem\'

* E l4|ignoring @tab outside of multitable
 ignoring @tab outside of multitable

';

$result_nodes_list{'item_tab_outside_of_table_lists'} = '';

$result_sections_list{'item_tab_outside_of_table_lists'} = '';

$result_sectioning_root{'item_tab_outside_of_table_lists'} = '';

$result_headings_list{'item_tab_outside_of_table_lists'} = '';

1;
