use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'cartouche_in_example_with_title'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@example C5 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@cartouche C3 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:first no heading\\n}
    *normal_command@end C1 l4
    |EXTRA
    |text_arg:{cartouche}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:cartouche}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *normal_command@cartouche C3 l6
    *arguments_line C1
     *block_line_arg C4
      {spaces_before_argument: }
      {normal_text:Tit--le }
      *normal_command@emph C1 l6
       *brace_container C1
        {normal_text:of box}
      {spaces_after_argument:\\n}
    *preformatted C1
     {normal_text:With title c--artouche\\n}
    *normal_command@end C1 l8
    |EXTRA
    |text_arg:{cartouche}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:cartouche}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l9
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'cartouche_in_example_with_title'} = '@example
@cartouche
first no heading
@end cartouche

@cartouche Tit--le @emph{of box}
With title c--artouche
@end cartouche
@end example
';


$result_texts{'cartouche_in_example_with_title'} = 'first no heading

Tit--le of box
With title c--artouche
';

$result_errors{'cartouche_in_example_with_title'} = '';

$result_nodes_list{'cartouche_in_example_with_title'} = '';

$result_sections_list{'cartouche_in_example_with_title'} = '';

$result_sectioning_root{'cartouche_in_example_with_title'} = '';

$result_headings_list{'cartouche_in_example_with_title'} = '';


$result_converted{'plaintext'}->{'cartouche_in_example_with_title'} = '     first no heading

                            Tit-le _of box_
     With title c--artouche
';


$result_converted{'html_text'}->{'cartouche_in_example_with_title'} = '<div class="example">
<table class="cartouche"><tr><td>
<pre class="example-preformatted">first no heading
</pre></td></tr></table>
<pre class="example-preformatted">

</pre><table class="cartouche"><tr><th>
Tit--le <em class="emph">of box</em></th></tr><tr><td>
<pre class="example-preformatted">With title c--artouche
</pre></td></tr></table>
</div>
';


$result_converted{'xml'}->{'cartouche_in_example_with_title'} = '<example endspaces=" ">
<cartouche endspaces=" ">
<pre xml:space="preserve">first no heading
</pre></cartouche>
<pre xml:space="preserve">
</pre><cartouche endspaces=" "><cartouchetitle> Tit--le <emph>of box</emph></cartouchetitle>
<pre xml:space="preserve">With title c--artouche
</pre></cartouche>
</example>
';


$result_converted{'latex_text'}->{'cartouche_in_example_with_title'} = '\\begin{document}
\\begin{Texinfoindented}
\\begin{Texinfocartouche}
\\begin{Texinfopreformatted}%
\\ttfamily first no heading
\\end{Texinfopreformatted}
\\end{Texinfocartouche}
\\begin{Texinfopreformatted}%
\\ttfamily 
\\end{Texinfopreformatted}
\\begin{Texinfocartouche}[title={Tit--le \\emph{of box}}]
\\begin{Texinfopreformatted}%
\\ttfamily With title c{-}{-}artouche
\\end{Texinfopreformatted}
\\end{Texinfocartouche}
\\end{Texinfoindented}
';


$result_converted{'docbook'}->{'cartouche_in_example_with_title'} = '<sidebar><screen>first no heading
</screen></sidebar><screen>
</screen><sidebar><title>Tit--le <emphasis>of box</emphasis></title>
<screen>With title c--artouche
</screen></sidebar>';

1;
