use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'space_in_footnote'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   {normal_text:text}
   *normal_command@footnote C1 l1
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C2
     {spaces_before_argument: }
     *paragraph C1
      {normal_text:in footnote.}
';


$result_texis{'space_in_footnote'} = 'text@footnote{ in footnote.}';


$result_texts{'space_in_footnote'} = 'text';

$result_errors{'space_in_footnote'} = '';

$result_nodes_list{'space_in_footnote'} = '';

$result_sections_list{'space_in_footnote'} = '';

$result_sectioning_root{'space_in_footnote'} = '';

$result_headings_list{'space_in_footnote'} = '';


$result_converted{'plaintext'}->{'space_in_footnote'} = 'text(1)

   ---------- Footnotes ----------

   (1) in footnote.

';


$result_converted{'html_text'}->{'space_in_footnote'} = '<p>text<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a></p><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>in footnote.</p>
</div>
';


$result_converted{'latex_text'}->{'space_in_footnote'} = '\\begin{document}
text\\footnote{in footnote.}';


$result_converted{'docbook'}->{'space_in_footnote'} = '<para>text<footnote><para>in footnote.</para></footnote></para>';

1;
