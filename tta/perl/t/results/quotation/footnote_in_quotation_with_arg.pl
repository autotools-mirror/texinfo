use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'footnote_in_quotation_with_arg'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@quotation C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:lean}
     {spaces_after_argument:\\n}
   *paragraph C3
    {normal_text:A}
    *normal_command@footnote C1 l2
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {normal_text:My feet}
    {normal_text: b.\\n}
   *normal_command@end C1 l3
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'footnote_in_quotation_with_arg'} = '@quotation lean
A@footnote{My feet} b.
@end quotation
';


$result_texts{'footnote_in_quotation_with_arg'} = 'lean
A b.
';

$result_errors{'footnote_in_quotation_with_arg'} = '';

$result_nodes_list{'footnote_in_quotation_with_arg'} = '';

$result_sections_list{'footnote_in_quotation_with_arg'} = '';

$result_sectioning_root{'footnote_in_quotation_with_arg'} = '';

$result_headings_list{'footnote_in_quotation_with_arg'} = '';


$result_converted{'plaintext'}->{'footnote_in_quotation_with_arg'} = '     lean: A(1) b.

   ---------- Footnotes ----------

   (1) My feet

';


$result_converted{'html_text'}->{'footnote_in_quotation_with_arg'} = '<blockquote class="quotation">
<p><b class="b">lean:</b> A<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a> b.
</p></blockquote>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>My feet</p>
</div>
';


$result_converted{'xml'}->{'footnote_in_quotation_with_arg'} = '<quotation endspaces=" "><quotationtype> lean</quotationtype>
<para>A<footnote><para>My feet</para></footnote> b.
</para></quotation>
';


$result_converted{'docbook'}->{'footnote_in_quotation_with_arg'} = '<blockquote><para><emphasis role="bold">lean:</emphasis> A<footnote><para>My feet</para></footnote> b.
</para></blockquote>';

1;
