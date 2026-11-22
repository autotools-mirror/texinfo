use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ref_in_multitable'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content C2
   *@novalidate C1 l1
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *@ref C1 l3
    *brace_arg C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX}
     {normal_text:XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX \\n}
     {normal_text:XXX XXX XXX XXX XXX XXX XXX XXX XX}
   {normal_text:.\\n}
  {empty_line:\\n}
  *@multitable C3 l6
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@columnfractions C1 l6
     |EXTRA
     |misc_args:A{.35|.65}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:.35 .65}
       {spaces_after_argument:\\n}
   *multitable_body C3
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l7
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX\\n}
     *@tab C2 l8
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C3
       {normal_text:See }
       *@ref C1 l8
        *brace_arg C1
        |EXTRA
        |node_content:A{0|0}
        |normalized:{RRR-RRR-RRR-RRR-RRR-RRR-RRR-RRR-RRR-RRRR}
         {normal_text:RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR}
       {normal_text:.\\n}
    *row C2
    |EXTRA
    |row_number:{2}
     *@item C2 l9
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX\\n}
     *@tab C2 l10
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C3
       {normal_text:See }
       *@ref C1 l10
        *brace_arg C1
        |EXTRA
        |node_content:A{0|0}
        |normalized:{SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSSSS}
         {normal_text:SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSSSS}
       {normal_text:.\\n}
    *row C2
    |EXTRA
    |row_number:{3}
     *@item C2 l11
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C3
       {normal_text:adsf}
       *@footnote C1 l11
       |EXTRA
       |global_command_number:{1}
        *brace_command_context C1
         *paragraph C1
          *@ref C1 l11
           *brace_arg C2
           |EXTRA
           |node_content:A{0|1}
           |normalized:{XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX}
            {normal_text:XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX \\n}
            {normal_text:XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX}
       {normal_text: }
     *@tab C2 l12
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: \\n}
      *paragraph C1
       {normal_text:second column\\n}
   *@end C1 l14
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l16
    *brace_arg C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX}
     {normal_text:XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX \\n}
     {normal_text:XXX XXX XXX XXX XXX XXX XXX XXX XX}
   {normal_text:.\\n}
';


$result_texis{'ref_in_multitable'} = '@novalidate

@ref{XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX}.

@multitable @columnfractions .35 .65
@item XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
@tab See @ref{RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR}.
@item XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
@tab See @ref{SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSSSS}.
@item adsf@footnote{@ref{XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX 
XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX}} @tab 
second column
@end multitable

@ref{XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX}.
';


$result_texts{'ref_in_multitable'} = '
XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX.

XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
See RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR.
XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
See SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSSSS.
adsf second column

XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX.
';

$result_errors{'ref_in_multitable'} = '';

$result_nodes_list{'ref_in_multitable'} = '';

$result_sections_list{'ref_in_multitable'} = '';

$result_sectioning_root{'ref_in_multitable'} = '';

$result_headings_list{'ref_in_multitable'} = '';


$result_converted{'info'}->{'ref_in_multitable'} = Encode::encode('utf-8', 'This is , produced from .

*note XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX
XXX XXX XXX XXX XXX XXX XXX XXX XX::.

XXX XXX XXX XXX XXX XXX   See
XXX XXX XXX XXX XXX XXX   *note RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR::.
XX
XXX XXX XXX XXX XXX XXX   See
XXX XXX XXX XXX XXX XXX   *note SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSSSS::.
XX
adsf(1)                   second column

   *note XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX
XXX XXX XXX XXX XXX XXX XXX XXX XXX XX::.

   ---------- Footnotes ----------

   (1) *note XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX
XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX::


Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'ref_in_multitable'} = '* W |document without nodes
 warning: document without nodes

* W l11|@footnote outside of any node
 warning: @footnote outside of any node

';


$result_converted{'plaintext'}->{'ref_in_multitable'} = 'XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX XXX
XXX XXX XXX XXX XXX XXX XXX XX.

XXX XXX XXX XXX XXX XXX   See RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR.
XXX XXX XXX XXX XXX XXX
XX
XXX XXX XXX XXX XXX XXX   See SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS
XXX XXX XXX XXX XXX XXX   SSS SSS SSSSS.
XX
adsf(1)                   second column

   XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX
XXX XXX XXX XXX XXX XXX XXX XXX XX.

   ---------- Footnotes ----------

   (1) XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX
XXX XXX XXX XXX XXX XXX XXX XXX XXX XX

';


$result_converted{'html_text'}->{'ref_in_multitable'} = '
<p>&lsquo;XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX&rsquo;.
</p>
<table class="multitable">
<tbody><tr><td width="35%">XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX</td><td width="65%">See &lsquo;RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR&rsquo;.</td></tr>
<tr><td width="35%">XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX</td><td width="65%">See &lsquo;SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSSSS&rsquo;.</td></tr>
<tr><td width="35%">adsf<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a></td><td width="65%">second column</td></tr>
</tbody>
</table>

<p>&lsquo;XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX&rsquo;.
</p><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>&lsquo;XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX 
XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX&rsquo;</p>
</div>
';


$result_converted{'xml'}->{'ref_in_multitable'} = '<novalidate></novalidate>

<para><ref label="XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX"><xrefnodename>XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX</xrefnodename></ref>.
</para>
<multitable endspaces=" "><columnfractions line=" .35 .65"><columnfraction value=".35"></columnfraction><columnfraction value=".65"></columnfraction></columnfractions>
<tbody><row><entry command="item"> <para>XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
</para></entry><entry command="tab"> <para>See <ref label="RRR-RRR-RRR-RRR-RRR-RRR-RRR-RRR-RRR-RRRR"><xrefnodename>RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR</xrefnodename></ref>.
</para></entry></row><row><entry command="item"> <para>XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
</para></entry><entry command="tab"> <para>See <ref label="SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSSSS"><xrefnodename>SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSSSS</xrefnodename></ref>.
</para></entry></row><row><entry command="item"> <para>adsf<footnote><para><ref label="XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX"><xrefnodename>XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX 
XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX</xrefnodename></ref></para></footnote> </para></entry><entry command="tab"> 
<para>second column
</para></entry></row></tbody></multitable>

<para><ref label="XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX"><xrefnodename>XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX</xrefnodename></ref>.
</para>';

1;
