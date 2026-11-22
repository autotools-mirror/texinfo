use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'w_in_multitable'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@multitable C3 l1
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      {normal_text:aaaaaaaaa}
     {normal_text: }
     *bracketed_arg C1 l1
      {normal_text:bbbbbbbbbbb}
     {spaces_after_argument:\\n}
   *multitable_body C1
    *row C2
    |row_number:{1}
     *normal_command@item C2 l2
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C2
       *normal_command@w C1 l2
        *brace_container C2
         {normal_text:aaaaaaaa\\n}
         {normal_text:bbbbbbbbbb}
       {normal_text:\\n}
     *normal_command@tab C2 l4
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:gg\\n}
   *normal_command@end C1 l5
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'w_in_multitable'} = '@multitable {aaaaaaaaa} {bbbbbbbbbbb}
@item @w{aaaaaaaa
bbbbbbbbbb}
@tab gg
@end multitable
';


$result_texts{'w_in_multitable'} = 'aaaaaaaa
bbbbbbbbbb
gg
';

$result_errors{'w_in_multitable'} = '';

$result_nodes_list{'w_in_multitable'} = '';

$result_sections_list{'w_in_multitable'} = '';

$result_sectioning_root{'w_in_multitable'} = '';

$result_headings_list{'w_in_multitable'} = '';


$result_converted{'plaintext'}->{'w_in_multitable'} = 'aaaaaaaa bbbbbbbbbbgg
';


$result_converted{'html_text'}->{'w_in_multitable'} = '<table class="multitable">
<tbody><tr><td>aaaaaaaa&nbsp;bbbbbbbbbb<!-- /@w --></td><td>gg</td></tr>
</tbody>
</table>
';


$result_converted{'xml'}->{'w_in_multitable'} = '<multitable endspaces=" "><columnprototypes> <columnprototype bracketed="on">aaaaaaaaa</columnprototype> <columnprototype bracketed="on">bbbbbbbbbbb</columnprototype>
</columnprototypes>
<tbody><row><entry command="item"> <para><w>aaaaaaaa
bbbbbbbbbb</w>
</para></entry><entry command="tab"> <para>gg
</para></entry></row></tbody></multitable>
';

1;
