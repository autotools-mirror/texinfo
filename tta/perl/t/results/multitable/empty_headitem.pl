use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_headitem'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@multitable C4 l1
  |EXTRA
  |max_columns:{3}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@columnfractions C1 l1
     |EXTRA
     |misc_args:A{.1|.1|.1}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:.1 .1 .1}
       {spaces_after_argument:\\n}
   *multitable_head C1
    *row C3
    |EXTRA
    |row_number:{1}
     *@headitem C1 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
     *@tab C2 l2
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:Index }
     *@tab C2 l2
     |EXTRA
     |cell_number:{3}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:Value\\n}
   *multitable_body C1
    *row C3
    |EXTRA
    |row_number:{2}
     *@item C1 l3
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
     *@tab C2 l3
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C2
       *@code C1 l3
        *brace_container C1
         {normal_text:3}
       {normal_text: }
     *@tab C2 l3
     |EXTRA
     |cell_number:{3}
      {ignorable_spaces_after_command: }
      *paragraph C2
       *@code C1 l3
        *brace_container C1
         {normal_text:30}
       {normal_text:\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_headitem'} = '@multitable @columnfractions .1 .1 .1
@headitem @tab Index @tab Value
@item @tab @code{3} @tab @code{30}
@end multitable
';


$result_texts{'empty_headitem'} = 'Index Value
3 30
';

$result_errors{'empty_headitem'} = '';

$result_nodes_list{'empty_headitem'} = '';

$result_sections_list{'empty_headitem'} = '';

$result_sectioning_root{'empty_headitem'} = '';

$result_headings_list{'empty_headitem'} = '';


$result_converted{'plaintext'}->{'empty_headitem'} = '        Index   Value
------------------------
        ‘3’     ‘30’
';


$result_converted{'html_text'}->{'empty_headitem'} = '<table class="multitable">
<thead><tr><th width="10%"></th><th width="10%">Index</th><th width="10%">Value</th></tr></thead>
<tbody><tr><td width="10%"></td><td width="10%"><code class="code">3</code></td><td width="10%"><code class="code">30</code></td></tr>
</tbody>
</table>
';


$result_converted{'xml'}->{'empty_headitem'} = '<multitable endspaces=" "><columnfractions line=" .1 .1 .1"><columnfraction value=".1"></columnfraction><columnfraction value=".1"></columnfraction><columnfraction value=".1"></columnfraction></columnfractions>
<thead><row><entry command="headitem"> </entry><entry command="tab"> <para>Index </para></entry><entry command="tab"> <para>Value
</para></entry></row></thead><tbody><row><entry command="item"> </entry><entry command="tab"> <para><code>3</code> </para></entry><entry command="tab"> <para><code>30</code>
</para></entry></row></tbody></multitable>
';

1;
