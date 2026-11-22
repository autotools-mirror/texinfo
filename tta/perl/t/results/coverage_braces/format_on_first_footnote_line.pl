use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'format_on_first_footnote_line'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *paragraph C3
   {normal_text:Texte}
   *normal_command@footnote C1 l1
   |global_command_number:{1}
    *brace_command_context C1
     *normal_command@quotation C3 l1
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *paragraph C1
       {normal_text:in quotation on the first footnote line\\n}
      *normal_command@end C1 l3
      |text_arg:{quotation}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:quotation}
        {spaces_after_argument:\\n}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Last text }
   *normal_command@footnote C1 l6
   |global_command_number:{2}
    *brace_command_context C2
     *normal_command@example C3 l6
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *preformatted C1
       {normal_text:in example\\n}
      *normal_command@end C1 l8
      |text_arg:{example}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:example}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
   {normal_text:\\n}
';


$result_texis{'format_on_first_footnote_line'} = 'Texte@footnote{@quotation
in quotation on the first footnote line
@end quotation
}.

Last text @footnote{@example
in example
@end example

}
';


$result_texts{'format_on_first_footnote_line'} = 'Texte.

Last text 
';

$result_errors{'format_on_first_footnote_line'} = '* W l1|@quotation should only appear at the beginning of a line
 warning: @quotation should only appear at the beginning of a line

* W l6|@example should only appear at the beginning of a line
 warning: @example should only appear at the beginning of a line

';

$result_nodes_list{'format_on_first_footnote_line'} = '';

$result_sections_list{'format_on_first_footnote_line'} = '';

$result_sectioning_root{'format_on_first_footnote_line'} = '';

$result_headings_list{'format_on_first_footnote_line'} = '';


$result_converted{'plaintext'}->{'format_on_first_footnote_line'} = 'Texte(1).

   Last text (2)

   ---------- Footnotes ----------

   (1) in quotation on the first footnote line

   (2) in example

';


$result_converted{'html_text'}->{'format_on_first_footnote_line'} = '<p>Texte<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>.
</p>
<p>Last text <a class="footnote" id="DOCF2" href="#FOOT2"><sup>2</sup></a>
</p><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<blockquote class="quotation">
<p>in quotation on the first footnote line
</p></blockquote>
<h5 class="footnote-body-heading"><a id="FOOT2" href="#DOCF2">(2)</a></h5>
<div class="example">
<pre class="example-preformatted">in example
</pre></div>

</div>
';


$result_converted{'latex_text'}->{'format_on_first_footnote_line'} = '\\begin{document}
Texte\\footnote{\\begin{quote}
in quotation on the first footnote line
\\end{quote}
}.

Last text \\footnote{\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in example
\\end{Texinfopreformatted}
\\end{Texinfoindented}

}
';


$result_converted{'docbook'}->{'format_on_first_footnote_line'} = '<para>Texte<footnote><blockquote><para>in quotation on the first footnote line
</para></blockquote></footnote>.
</para>
<para>Last text <footnote><screen>in example
</screen>
</footnote>
</para>';

1;
