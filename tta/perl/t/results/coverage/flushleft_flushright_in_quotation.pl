use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'flushleft_flushright_in_quotation'} = '*document_root C1
 *before_node_section C3
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *normal_command@quotation C5 l2
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@flushleft C4 l3
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {spaces_before_paragraph:   }
    *paragraph C1
     {normal_text:f l\\n}
    *normal_command@end C1 l5
    |EXTRA
    |text_arg:{flushleft}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:flushleft}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@flushright C4 l7
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {spaces_before_paragraph:  }
    *paragraph C1
     {normal_text:f r\\n}
    *normal_command@end C1 l9
    |EXTRA
    |text_arg:{flushright}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:flushright}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l10
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'flushleft_flushright_in_quotation'} = '
@quotation
@flushleft
   f l
@end flushleft

@flushright
  f r
@end flushright
@end quotation
';


$result_texts{'flushleft_flushright_in_quotation'} = 'f l

f r
';

$result_errors{'flushleft_flushright_in_quotation'} = '';

$result_nodes_list{'flushleft_flushright_in_quotation'} = '';

$result_sections_list{'flushleft_flushright_in_quotation'} = '';

$result_sectioning_root{'flushleft_flushright_in_quotation'} = '';

$result_headings_list{'flushleft_flushright_in_quotation'} = '';


$result_converted{'plaintext'}->{'flushleft_flushright_in_quotation'} = '     f l

                                                                    f r
';


$result_converted{'html_text'}->{'flushleft_flushright_in_quotation'} = '<blockquote class="quotation">
<div class="flushleft"><p class="flushleft-paragraph">f l
</p></div>
<div class="flushright"><p class="flushright-paragraph">f r
</p></div></blockquote>
';


$result_converted{'xml'}->{'flushleft_flushright_in_quotation'} = '<preamblebeforebeginning>
</preamblebeforebeginning><quotation endspaces=" ">
<flushleft endspaces=" ">
   <para>f l
</para></flushleft>

<flushright endspaces=" ">
  <para>f r
</para></flushright>
</quotation>
';


$result_converted{'latex_text'}->{'flushleft_flushright_in_quotation'} = '\\begin{document}
\\begin{quote}
\\begin{flushleft}
\\begin{Texinfopreformatted}%
   f l
\\end{Texinfopreformatted}
\\end{flushleft}

\\begin{flushright}
\\begin{Texinfopreformatted}%
  f r
\\end{Texinfopreformatted}
\\end{flushright}
\\end{quote}
';


$result_converted{'docbook'}->{'flushleft_flushright_in_quotation'} = '<blockquote><para>f l
</para>
<para>f r
</para></blockquote>';

1;
