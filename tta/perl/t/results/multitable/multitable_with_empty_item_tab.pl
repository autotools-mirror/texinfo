use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_with_empty_item_tab'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@multitable C3 l1
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@columnfractions C1 l1
     |misc_args:A{0.3|0.7}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.3 0.7}
       {spaces_after_argument:\\n}
   *multitable_body C3
    *row C2
    |row_number:{1}
     *normal_command@item C2 l2
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:1-1 }
     *normal_command@tab C2 l2
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:1-2 }
    *row C2
    |row_number:{2}
     *normal_command@item l2
     |cell_number:{1}
     *normal_command@tab l2
     |cell_number:{2}
    *row C2
    |row_number:{3}
     *normal_command@item C2 l2
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:3-1 }
     *normal_command@tab C2 l2
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:3-2\\n}
   *normal_command@end C1 l3
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable_with_empty_item_tab'} = '@multitable @columnfractions 0.3 0.7
@item 1-1 @tab 1-2 @item@tab@item 3-1 @tab 3-2
@end multitable
';


$result_texts{'multitable_with_empty_item_tab'} = '1-1 1-2 3-1 3-2
';

$result_errors{'multitable_with_empty_item_tab'} = '';

$result_nodes_list{'multitable_with_empty_item_tab'} = '';

$result_sections_list{'multitable_with_empty_item_tab'} = '';

$result_sectioning_root{'multitable_with_empty_item_tab'} = '';

$result_headings_list{'multitable_with_empty_item_tab'} = '';


$result_converted{'plaintext'}->{'multitable_with_empty_item_tab'} = '1-1                    1-2
3-1                    3-2
';


$result_converted{'html_text'}->{'multitable_with_empty_item_tab'} = '<table class="multitable">
<tbody><tr><td width="30%">1-1</td><td width="70%">1-2</td></tr>
<tr><td width="30%"></td><td width="70%"></td></tr>
<tr><td width="30%">3-1</td><td width="70%">3-2</td></tr>
</tbody>
</table>
';


$result_converted{'xml'}->{'multitable_with_empty_item_tab'} = '<multitable endspaces=" "><columnfractions line=" 0.3 0.7"><columnfraction value="0.3"></columnfraction><columnfraction value="0.7"></columnfraction></columnfractions>
<tbody><row><entry command="item"> <para>1-1 </para></entry><entry command="tab"> <para>1-2 </para></entry></row><row><entry command="item"></entry><entry command="tab"></entry></row><row><entry command="item"> <para>3-1 </para></entry><entry command="tab"> <para>3-2
</para></entry></row></tbody></multitable>
';

1;
