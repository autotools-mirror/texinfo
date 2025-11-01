use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'paragraph_in_cells'} = '*document_root C1
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
      {AAA}
     {  }
     *bracketed_arg C1 l1
      {BBB}
   *multitable_body C2
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {truc }
     *@tab C2 l2
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {bidule\\n}
    *row C2
    |EXTRA
    |row_number:{2}
     *@item C5 l3
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {begin item\\n}
      {empty_line:\\n}
      *paragraph C1
       {new paragraph in item.\\n}
      {empty_line:\\n}
     *@tab C4 l7
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {begin tab\\n}
      {empty_line:\\n}
      *paragraph C1
       {new paragraph in tab.\\n}
   *@end C1 l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
     {multitable}
';


$result_texis{'paragraph_in_cells'} = '@multitable {AAA}  {BBB}
@item truc @tab bidule
@item begin item

new paragraph in item.

@tab begin tab

new paragraph in tab.
@end multitable';


$result_texts{'paragraph_in_cells'} = 'truc bidule
begin item

new paragraph in item.

begin tab

new paragraph in tab.
';

$result_errors{'paragraph_in_cells'} = '';

$result_nodes_list{'paragraph_in_cells'} = '';

$result_sections_list{'paragraph_in_cells'} = '';

$result_sectioning_root{'paragraph_in_cells'} = '';

$result_headings_list{'paragraph_in_cells'} = '';


$result_converted{'plaintext'}->{'paragraph_in_cells'} = 'truc  bidule
begin begin
item  tab
      
new   new
paragraphparagraph
in    in
item. tab.

';


$result_converted{'html_text'}->{'paragraph_in_cells'} = '<table class="multitable">
<tbody><tr><td>truc</td><td>bidule</td></tr>
<tr><td>begin item

<p>new paragraph in item.
</p></td><td>begin tab

<p>new paragraph in tab.
</p></td></tr>
</tbody>
</table>
';


$result_converted{'xml'}->{'paragraph_in_cells'} = '<multitable spaces=" " endspaces=" "><columnprototypes><columnprototype bracketed="on">AAA</columnprototype>  <columnprototype bracketed="on">BBB</columnprototype></columnprototypes>
<tbody><row><entry command="item"> <para>truc </para></entry><entry command="tab"> <para>bidule
</para></entry></row><row><entry command="item"> <para>begin item
</para>
<para>new paragraph in item.
</para>
</entry><entry command="tab"> <para>begin tab
</para>
<para>new paragraph in tab.
</para></entry></row></tbody></multitable>';

1;
