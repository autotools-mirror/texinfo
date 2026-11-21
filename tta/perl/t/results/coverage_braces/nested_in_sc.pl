use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_in_sc'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   *@sc C1 l1
    *brace_container C1
     *@sc C1 l1
      *brace_container C14
       {aaa }
       *@~ C1 l1
        *following_arg C1
         {n}
       { }
       *@aa C1 l1
        *brace_container
       { }
       *@TeX C1 l1
        *brace_container
       { }
       *@~ C1 l1
        *brace_container C1
         *@aa C1 l1
          *brace_container
       { }
       *@footnote C1 l1
       |EXTRA
       |global_command_number:{1}
        *brace_command_context C1
         *paragraph C1
          {In footnote}
       {, }
       *@abbr C2 l1
        *brace_arg C1
         {ABr}
        *brace_arg C2
         {spaces_before_argument: }
         {expl}
       {, \\n}
       *@verb C1 l2
        *brace_container C3
         {verb_delimiter::}
         {raw:in verb}
         {verb_delimiter::}
   {\\n}
';


$result_texis{'nested_in_sc'} = '@sc{@sc{aaa @~n @aa{} @TeX{} @~{@aa{}} @footnote{In footnote}, @abbr{ABr, expl}, 
@verb{:in verb:}}}
';


$result_texts{'nested_in_sc'} = 'AAA N~ AA TeX AA~ , ABR (EXPL), 
in verb
';

$result_errors{'nested_in_sc'} = '';

$result_nodes_list{'nested_in_sc'} = '';

$result_sections_list{'nested_in_sc'} = '';

$result_sectioning_root{'nested_in_sc'} = '';

$result_headings_list{'nested_in_sc'} = '';


$result_converted{'plaintext'}->{'nested_in_sc'} = 'AAA Ñ Å TeX Å̃ (1), ABR (EXPL), in verb

   ---------- Footnotes ----------

   (1) In footnote

';


$result_converted{'html_text'}->{'nested_in_sc'} = '<p><small class="sc"><small class="sc">AAA &Ntilde; &Aring; TeX &Aring;&#771; <a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>, <abbr class="abbr" title="expl">ABR</abbr> (EXPL), 
<code class="verb">IN&nbsp;VERB</code></small></small>
</p><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>In footnote</p>
</div>
';


$result_converted{'latex_text'}->{'nested_in_sc'} = '\\begin{document}
\\textsc{\\textsc{aaa \\~{n} \\aa{} \\TeX{} \\~{\\aa{}} \\footnote{In footnote}, ABr (expl), 
\\verb:in verb:}}
';


$result_converted{'docbook'}->{'nested_in_sc'} = '<para>AAA &#209; &#197; &tex; &#197;&#771; <footnote><para>In footnote</para></footnote>, <abbrev>ABR</abbrev> (EXPL), 
<literal>IN VERB</literal>
</para>';

1;
