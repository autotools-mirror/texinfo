use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'headitem_itemx_in_enumerate'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@enumerate C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@item C5 l2
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:item enumerate\\n}
    *normal_command@itemx C1 l3
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:itemx enumerate}
      {spaces_after_argument:\\n}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:headitem enumerate\\n}
   *normal_command@end C1 l5
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
';


$result_texis{'headitem_itemx_in_enumerate'} = '@enumerate
@item item enumerate
@itemx itemx enumerate
 headitem enumerate
@end enumerate
';


$result_texts{'headitem_itemx_in_enumerate'} = '1. item enumerate
itemx enumerate
headitem enumerate
';

$result_errors{'headitem_itemx_in_enumerate'} = '* E l3|@itemx outside of table or list
 @itemx outside of table or list

* E l4|@headitem not meaningful inside `@enumerate\' block
 @headitem not meaningful inside `@enumerate\' block

';

$result_nodes_list{'headitem_itemx_in_enumerate'} = '';

$result_sections_list{'headitem_itemx_in_enumerate'} = '';

$result_sectioning_root{'headitem_itemx_in_enumerate'} = '';

$result_headings_list{'headitem_itemx_in_enumerate'} = '';

1;
