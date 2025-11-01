use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multitable_figure_space'} = '*document_root C1
 *before_node_section C1
  *@multitable C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *bracketed_arg C1 l1
      {999999999}
     { }
     *bracketed_arg C1 l1
      {xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx}
   *multitable_body C3
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {   55 }
     *@tab C2 l2
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {explanation\\n}
    *row C2
    |EXTRA
    |row_number:{2}
     *@item C2 l3
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {  535 }
     *@tab C2 l3
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {explanation\\n}
    *row C2
    |EXTRA
    |row_number:{3}
     *@item C2 l4
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {49303 }
     *@tab C2 l4
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {explanation\\n}
   *@end C1 l5
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


$result_texis{'multitable_figure_space'} = '@multitable {999999999} {xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx}
@item    55 @tab explanation
@item   535 @tab explanation
@item 49303 @tab explanation
@end multitable
';


$result_texts{'multitable_figure_space'} = '   55 explanation
  535 explanation
49303 explanation
';

$result_errors{'multitable_figure_space'} = '';

$result_nodes_list{'multitable_figure_space'} = '';

$result_sections_list{'multitable_figure_space'} = '';

$result_sectioning_root{'multitable_figure_space'} = '';

$result_headings_list{'multitable_figure_space'} = '';


$result_converted{'plaintext'}->{'multitable_figure_space'} = '   55       explanation
  535       explanation
49303       explanation
';


$result_converted{'html_text'}->{'multitable_figure_space'} = '<table class="multitable">
<tbody><tr><td>   55</td><td>explanation</td></tr>
<tr><td>  535</td><td>explanation</td></tr>
<tr><td>49303</td><td>explanation</td></tr>
</tbody>
</table>
';


$result_converted{'xml'}->{'multitable_figure_space'} = '<multitable spaces=" " endspaces=" "><columnprototypes><columnprototype bracketed="on">999999999</columnprototype> <columnprototype bracketed="on">xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</columnprototype></columnprototypes>
<tbody><row><entry command="item"> <para>   55 </para></entry><entry command="tab"> <para>explanation
</para></entry></row><row><entry command="item"> <para>  535 </para></entry><entry command="tab"> <para>explanation
</para></entry></row><row><entry command="item"> <para>49303 </para></entry><entry command="tab"> <para>explanation
</para></entry></row></tbody></multitable>
';

1;
