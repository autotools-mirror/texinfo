use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_prototypes'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *@multitable C3 l1
  |EXTRA
  |max_columns:{3}
   *arguments_line C1
    *block_line_arg C10
     {spaces_before_argument:  }
     *bracketed_arg C1 l1
      {normal_text:aa b}
     {normal_text:  }
     *bracketed_arg C1 l1
      {normal_text: r }
     {normal_text: }
     *bracketed_arg C3 l1
      {normal_text:j }
      *@code C1 l1
       *brace_container C1
        {normal_text:some code}
      {normal_text: }
     {normal_text: }
     *@var C1 l1
      *brace_container C1
       {normal_text:cmd}
     {normal_text:gg hh j}
     {spaces_after_argument: \\n}
   *multitable_body C1
    *row C3
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:cc d\\n}
     *@tab C2 l3
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:s\\n}
     *@tab C4 l4
     |EXTRA
     |cell_number:{3}
      {ignorable_spaces_after_command: }
      *paragraph C3
       {normal_text:k }
       *@samp C1 l4
        *brace_container C1
         {normal_text:same samp}
       {normal_text:\\n}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:Invalid tab\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'multitable_prototypes'} = '@multitable  {aa b}  { r } {j @code{some code} } @var{cmd}gg hh j 
@item cc d
@tab s
@tab k @samp{same samp}
 Invalid tab
@end multitable

';


$result_texts{'multitable_prototypes'} = 'cc d
s
k same samp
Invalid tab

';

$result_errors{'multitable_prototypes'} = '* W l1|unexpected argument on @multitable line: @var{cmd}
 warning: unexpected argument on @multitable line: @var{cmd}

* E l5|too many columns in multitable item (max 3)
 too many columns in multitable item (max 3)

';

$result_nodes_list{'multitable_prototypes'} = '';

$result_sections_list{'multitable_prototypes'} = '';

$result_sectioning_root{'multitable_prototypes'} = '';

$result_headings_list{'multitable_prototypes'} = '';


$result_converted{'plaintext'}->{'multitable_prototypes'} = 'cc d   s    k ‘same samp’
            Invalid tab

';


$result_converted{'html_text'}->{'multitable_prototypes'} = '<table class="multitable">
<tbody><tr><td>cc d</td><td>s</td><td>k &lsquo;<samp class="samp">same samp</samp>&rsquo;
<p>Invalid tab
</p></td></tr>
</tbody>
</table>

';


$result_converted{'xml'}->{'multitable_prototypes'} = '<multitable endspaces=" "><columnprototypes>  <columnprototype bracketed="on">aa b</columnprototype>  <columnprototype bracketed="on"> r </columnprototype> <columnprototype bracketed="on">j <code>some code</code> </columnprototype> <var>cmd</var>gg hh j 
</columnprototypes>
<tbody><row><entry command="item"> <para>cc d
</para></entry><entry command="tab"> <para>s
</para></entry><entry command="tab"> <para>k <samp>same samp</samp>
</para> <para>Invalid tab
</para></entry></row></tbody></multitable>

';


$result_converted{'docbook'}->{'multitable_prototypes'} = '<informaltable><tgroup cols="3"><colspec colwidth="4*"></colspec><colspec colwidth="3*"></colspec><colspec colwidth="12*"></colspec><tbody><row><entry><para>cc d
</para></entry><entry><para>s
</para></entry><entry><para>k &#8216;<literal>same samp</literal>&#8217;
</para><para>Invalid tab
</para></entry></row></tbody></tgroup></informaltable>
';


$result_converted{'latex_text'}->{'multitable_prototypes'} = '\\begin{document}
\\begin{tabular}{m{0.210526315789474\\textwidth} m{0.157894736842105\\textwidth} m{0.631578947368421\\textwidth}}%
cc d&
s&
k `\\texttt{same samp}\'
Invalid tab\\\\
\\end{tabular}%

';

1;
