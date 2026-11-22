use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text_between_item_itemx'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@table C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@strong l1
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C3
     *@item C1 l2
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:in item}
       {spaces_after_argument:\\n}
     *inter_item C1
      *paragraph C1
       {normal_text:text\\n}
     *@itemx C1 l4
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:in itemx}
       {spaces_after_argument:\\n}
   *@end C1 l5
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'text_between_item_itemx'} = '@table @strong
@item in item
text
@itemx in itemx
@end table
';


$result_texts{'text_between_item_itemx'} = 'in item
text
in itemx
';

$result_errors{'text_between_item_itemx'} = '* E l4|@itemx must follow @item
 @itemx must follow @item

';

$result_nodes_list{'text_between_item_itemx'} = '';

$result_sections_list{'text_between_item_itemx'} = '';

$result_sectioning_root{'text_between_item_itemx'} = '';

$result_headings_list{'text_between_item_itemx'} = '';

1;
