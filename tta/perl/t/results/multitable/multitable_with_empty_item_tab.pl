use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multitable_with_empty_item_tab'} = '*document_root C1
 *before_node_section C1
  *@multitable C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C1
     *@columnfractions C1 l1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |misc_args:A{0.3|0.7}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {0.3 0.7}
   *multitable_body C3
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {1-1 }
     *@tab C2 l2
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {1-2 }
    *row C2
    |EXTRA
    |row_number:{2}
     *@item l2
     |EXTRA
     |cell_number:{1}
     *@tab l2
     |EXTRA
     |cell_number:{2}
    *row C2
    |EXTRA
    |row_number:{3}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {3-1 }
     *@tab C2 l2
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {3-2\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {multitable}
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


$result_converted{'xml'}->{'multitable_with_empty_item_tab'} = '<multitable spaces=" " endspaces=" "><columnfractions spaces=" " line="0.3 0.7"><columnfraction value="0.3"></columnfraction><columnfraction value="0.7"></columnfraction></columnfractions>
<tbody><row><entry command="item"> <para>1-1 </para></entry><entry command="tab"> <para>1-2 </para></entry></row><row><entry command="item"></entry><entry command="tab"></entry></row><row><entry command="item"> <para>3-1 </para></entry><entry command="tab"> <para>3-2
</para></entry></row></tbody></multitable>
';

1;
