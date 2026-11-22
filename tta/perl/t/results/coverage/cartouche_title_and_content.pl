use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'cartouche_title_and_content'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@cartouche C3 l1
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:Box title on }
     *@emph C1 l1
      *brace_container C1
       {normal_text:documentation}
     {spaces_after_argument:\\n}
   *paragraph C2
    {normal_text:Text on documentation explaining something important out of the main\\n}
    {normal_text:flow of the text.\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:cartouche}
     {spaces_after_argument:\\n}
';


$result_texis{'cartouche_title_and_content'} = '@cartouche Box title on @emph{documentation}
Text on documentation explaining something important out of the main
flow of the text.
@end cartouche
';


$result_texts{'cartouche_title_and_content'} = 'Box title on documentation
Text on documentation explaining something important out of the main
flow of the text.
';

$result_errors{'cartouche_title_and_content'} = '';

$result_nodes_list{'cartouche_title_and_content'} = '';

$result_sections_list{'cartouche_title_and_content'} = '';

$result_sectioning_root{'cartouche_title_and_content'} = '';

$result_headings_list{'cartouche_title_and_content'} = '';


$result_converted{'plaintext'}->{'cartouche_title_and_content'} = '                     Box title on _documentation_
Text on documentation explaining something important out of the main
flow of the text.
';


$result_converted{'html_text'}->{'cartouche_title_and_content'} = '<table class="cartouche"><tr><th>
Box title on <em class="emph">documentation</em></th></tr><tr><td>
<p>Text on documentation explaining something important out of the main
flow of the text.
</p></td></tr></table>
';


$result_converted{'xml'}->{'cartouche_title_and_content'} = '<cartouche endspaces=" "><cartouchetitle> Box title on <emph>documentation</emph></cartouchetitle>
<para>Text on documentation explaining something important out of the main
flow of the text.
</para></cartouche>
';


$result_converted{'latex_text'}->{'cartouche_title_and_content'} = '\\begin{document}
\\begin{Texinfocartouche}[title={Box title on \\emph{documentation}}]
Text on documentation explaining something important out of the main
flow of the text.
\\end{Texinfocartouche}
';


$result_converted{'docbook'}->{'cartouche_title_and_content'} = '<sidebar><title>Box title on <emphasis>documentation</emphasis></title>
<para>Text on documentation explaining something important out of the main
flow of the text.
</para></sidebar>';

1;
