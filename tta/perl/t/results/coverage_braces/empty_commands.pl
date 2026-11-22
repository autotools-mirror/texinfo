use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_commands'} = '*document_root C1
 *before_node_section C5
  *preamble_before_content
  *@titlefont C1 l1
  |EXTRA
  |global_command_number:{1}
   *brace_container
  {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C15
   *@uref C1 l3
    *brace_arg
   {normal_text: }
   *@abbr C1 l3
    *brace_arg
   {normal_text: }
   *@email C1 l3
    *brace_arg
   {normal_text: }
   *@code C1 l3
    *brace_container
   *@footnote C1 l3
   |EXTRA
   |global_command_number:{1}
    *brace_command_context
   {normal_text: }
   *@~ C1 l3
    *brace_container
   {normal_text: }
   *@dotless C1 l3
    *brace_container
   {normal_text: }
   *@verb C1 l3
    *brace_container C2
     {verb_delimiter:;}
     {verb_delimiter:;}
   {normal_text:\\n}
';


$result_texis{'empty_commands'} = '@titlefont{}

@uref{} @abbr{} @email{} @code{}@footnote{} @~{} @dotless{} @verb{;;}
';


$result_texts{'empty_commands'} = '

    ~  
';

$result_errors{'empty_commands'} = '* W l3|@abbr missing first argument
 warning: @abbr missing first argument

';

$result_nodes_list{'empty_commands'} = '';

$result_sections_list{'empty_commands'} = '';

$result_sectioning_root{'empty_commands'} = '';

$result_headings_list{'empty_commands'} = '';


$result_converted{'plaintext'}->{'empty_commands'} = '
‘’(1) ̃

   ---------- Footnotes ----------

   (1) 
';


$result_converted{'html_text'}->{'empty_commands'} = '

<p> <abbr class="abbr"></abbr>  <a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a> &#771;  <code class="verb"></code>
</p><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>

</div>
';


$result_converted{'latex_text'}->{'empty_commands'} = '\\begin{document}


   \\texttt{}\\footnote{} \\~{}  
';


$result_converted{'docbook'}->{'empty_commands'} = '

<para><ulink url=""></ulink>    &#771;  <literal></literal>
</para>';

1;
