use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'fullwidth_in_prototype'} = '*document_root C1
 *before_node_section C1
  *@multitable C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{3}
   *arguments_line C1
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *bracketed_arg C1 l1
      {éééé éééé éééé éééé}
     { }
     *bracketed_arg C1 l1
      {xxxx xxxx xxxx xxxx}
     { }
     *bracketed_arg C1 l1
      {人人 人人 人人 人人}
   *multitable_body C1
    *row C3
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command:\\n}
      *paragraph C6
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
     *@tab C2 l9
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command:\\n}
      *paragraph C6
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
     *@tab C2 l16
     |EXTRA
     |cell_number:{3}
      {ignorable_spaces_after_command:\\n}
      *paragraph C6
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
       {aaa aà aaa aa aaa aa\\n}
   *@end C1 l23
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


$result_texis{'fullwidth_in_prototype'} = '@multitable {éééé éééé éééé éééé} {xxxx xxxx xxxx xxxx} {人人 人人 人人 人人}
@item
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
@tab
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
@tab
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
@end multitable
';


$result_texts{'fullwidth_in_prototype'} = 'aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
';

$result_errors{'fullwidth_in_prototype'} = '';

$result_nodes_list{'fullwidth_in_prototype'} = '';

$result_sections_list{'fullwidth_in_prototype'} = '';

$result_sectioning_root{'fullwidth_in_prototype'} = '';

$result_headings_list{'fullwidth_in_prototype'} = '';


$result_converted{'plaintext'}->{'fullwidth_in_prototype'} = 'aaa aà aaa aa aaa     aaa aà aaa aa aaa     aaa aà aaa aa aaa
aa aaa aà aaa aa      aa aaa aà aaa aa      aa aaa aà aaa aa
aaa aa aaa aà aaa     aaa aa aaa aà aaa     aaa aa aaa aà aaa
aa aaa aa aaa aà      aa aaa aa aaa aà      aa aaa aa aaa aà
aaa aa aaa aa aaa     aaa aa aaa aa aaa     aaa aa aaa aa aaa
aà aaa aa aaa aa      aà aaa aa aaa aa      aà aaa aa aaa aa
aaa aà aaa aa aaa     aaa aà aaa aa aaa     aaa aà aaa aa aaa
aa                    aa                    aa
';


$result_converted{'html_text'}->{'fullwidth_in_prototype'} = '<table class="multitable">
<tbody><tr><td>aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa</td><td>aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa</td><td>aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa</td></tr>
</tbody>
</table>
';


$result_converted{'xml'}->{'fullwidth_in_prototype'} = '<multitable spaces=" " endspaces=" "><columnprototypes><columnprototype bracketed="on">éééé éééé éééé éééé</columnprototype> <columnprototype bracketed="on">xxxx xxxx xxxx xxxx</columnprototype> <columnprototype bracketed="on">人人 人人 人人 人人</columnprototype></columnprototypes>
<tbody><row><entry command="item">
<para>aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
</para></entry><entry command="tab">
<para>aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
</para></entry><entry command="tab">
<para>aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
aaa aà aaa aa aaa aa
</para></entry></row></tbody></multitable>
';

1;
