use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'standard_quotations'} = '*document_root C1
 *before_node_section C12
  *preamble_before_content
  *normal_command@quotation C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Note}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:A Note\\n}
   *normal_command@end C1 l3
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l5
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:note}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:A note\\n}
   *normal_command@end C1 l7
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l9
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Caution}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Caution\\n}
   *normal_command@end C1 l11
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l13
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Important}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Important\\n}
   *normal_command@end C1 l15
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l17
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Tip}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:a Tip\\n}
   *normal_command@end C1 l19
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l21
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Warning}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:a Warning.\\n}
   *normal_command@end C1 l23
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'standard_quotations'} = '@quotation Note
A Note
@end quotation

@quotation note
A note
@end quotation

@quotation Caution
Caution
@end quotation

@quotation Important
Important
@end quotation

@quotation Tip
a Tip
@end quotation

@quotation Warning
a Warning.
@end quotation
';


$result_texts{'standard_quotations'} = 'Note
A Note

note
A note

Caution
Caution

Important
Important

Tip
a Tip

Warning
a Warning.
';

$result_errors{'standard_quotations'} = '';

$result_nodes_list{'standard_quotations'} = '';

$result_sections_list{'standard_quotations'} = '';

$result_sectioning_root{'standard_quotations'} = '';

$result_headings_list{'standard_quotations'} = '';


$result_converted{'plaintext'}->{'standard_quotations'} = '     Note: A Note

     note: A note

     Caution: Caution

     Important: Important

     Tip: a Tip

     Warning: a Warning.
';


$result_converted{'html_text'}->{'standard_quotations'} = '<blockquote class="quotation">
<p><b class="b">Note:</b> A Note
</p></blockquote>

<blockquote class="quotation">
<p><b class="b">note:</b> A note
</p></blockquote>

<blockquote class="quotation">
<p><b class="b">Caution:</b> Caution
</p></blockquote>

<blockquote class="quotation">
<p><b class="b">Important:</b> Important
</p></blockquote>

<blockquote class="quotation">
<p><b class="b">Tip:</b> a Tip
</p></blockquote>

<blockquote class="quotation">
<p><b class="b">Warning:</b> a Warning.
</p></blockquote>
';


$result_converted{'xml'}->{'standard_quotations'} = '<quotation endspaces=" "><quotationtype> Note</quotationtype>
<para>A Note
</para></quotation>

<quotation endspaces=" "><quotationtype> note</quotationtype>
<para>A note
</para></quotation>

<quotation endspaces=" "><quotationtype> Caution</quotationtype>
<para>Caution
</para></quotation>

<quotation endspaces=" "><quotationtype> Important</quotationtype>
<para>Important
</para></quotation>

<quotation endspaces=" "><quotationtype> Tip</quotationtype>
<para>a Tip
</para></quotation>

<quotation endspaces=" "><quotationtype> Warning</quotationtype>
<para>a Warning.
</para></quotation>
';


$result_converted{'docbook'}->{'standard_quotations'} = '<note><para>A Note
</para></note>
<note><para>A note
</para></note>
<caution><para>Caution
</para></caution>
<important><para>Important
</para></important>
<tip><para>a Tip
</para></tip>
<warning><para>a Warning.
</para></warning>';

1;
