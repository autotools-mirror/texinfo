use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'footnote'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C3
   {normal_text:text}
   *normal_command@footnote C1 l1
   |global_command_number:{1}
    *brace_command_context C3
     *paragraph C1
      {normal_text:in footnote.\\n}
     {empty_line:\\n}
     *paragraph C2
      *normal_command@r C1 l3
       *brace_container C1
        {normal_text:in footnote r}
      {normal_text:. }
   {normal_text: after footnote.}
';


$result_texis{'footnote'} = 'text@footnote{in footnote.

@r{in footnote r}. } after footnote.';


$result_texts{'footnote'} = 'text after footnote.';

$result_errors{'footnote'} = '';

$result_nodes_list{'footnote'} = '';

$result_sections_list{'footnote'} = '';

$result_sectioning_root{'footnote'} = '';

$result_headings_list{'footnote'} = '';


$result_converted{'plaintext'}->{'footnote'} = 'text(1) after footnote.

   ---------- Footnotes ----------

   (1) in footnote.

   in footnote r.

';


$result_converted{'html_text'}->{'footnote'} = '<p>text<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a> after footnote.</p><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>in footnote.
</p>
<p><span class="r">in footnote r</span>. </p>
</div>
';


$result_converted{'latex_text'}->{'footnote'} = '\\begin{document}
text\\footnote{in footnote.

\\textnormal{in footnote r}. } after footnote.';


$result_converted{'docbook'}->{'footnote'} = '<para>text<footnote><para>in footnote.
</para>
<para>in footnote r. </para></footnote> after footnote.</para>';

1;
