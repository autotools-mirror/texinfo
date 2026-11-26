use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_item_in_index'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@multitable C3 l1
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      {normal_text:aaa}
     {normal_text: }
     *bracketed_arg C1 l1
      {normal_text:bbb}
     {spaces_after_argument:\\n}
   *before_item C1
    *index_entry_command@vindex C1 l2
    |index_entry:I{vr,1}
     *line_arg C4
      {spaces_before_argument: }
      {spaces_before_argument: }
      {normal_text:on item line}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l3
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable_item_in_index'} = '@multitable {aaa} {bbb}
@vindex  on item line
@end multitable
';


$result_texts{'multitable_item_in_index'} = '';

$result_errors{'multitable_item_in_index'} = '* W l2|@item should not appear on @vindex line
 warning: @item should not appear on @vindex line

* E l2|@item outside of table or list
 @item outside of table or list

* W l2|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l1|@multitable has text but no @item
 warning: @multitable has text but no @item

';

$result_nodes_list{'multitable_item_in_index'} = '';

$result_sections_list{'multitable_item_in_index'} = '';

$result_sectioning_root{'multitable_item_in_index'} = '';

$result_headings_list{'multitable_item_in_index'} = '';

$result_indices_sort_strings{'multitable_item_in_index'} = 'vr:
 on item line
';

1;
