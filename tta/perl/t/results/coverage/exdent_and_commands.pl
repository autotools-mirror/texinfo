use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'exdent_and_commands'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *normal_command@quotation C7 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:quotation1\\n}
   *normal_command@exdent C1 l3
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:in exdented protected eol }
     *normal_command@\\n
   *paragraph C1
    {normal_text:following\\n}
   *normal_command@exdent C1 l5
    *line_arg C7
     {spaces_before_argument: }
     {normal_text:in exdented a }
     *normal_command@@
     {normal_text:* }
     *normal_command@*
     {normal_text: and following}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:after exdented\\n}
   *normal_command@end C1 l7
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C7 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:example\\n}
   *normal_command@exdent C1 l11
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:in exdented protected eol }
     *normal_command@\\n
   *preformatted C1
    {normal_text:following\\n}
   *normal_command@exdent C1 l13
    *line_arg C7
     {spaces_before_argument: }
     {normal_text:in exdented a }
     *normal_command@@
     {normal_text:* }
     *normal_command@*
     {normal_text: and following}
     {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:after exdented\\n}
   *normal_command@end C1 l15
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'exdent_and_commands'} = '@quotation
quotation1
@exdent in exdented protected eol @
following
@exdent in exdented a @@* @* and following
after exdented
@end quotation

@example
example
@exdent in exdented protected eol @
following
@exdent in exdented a @@* @* and following
after exdented
@end example
';


$result_texts{'exdent_and_commands'} = 'quotation1
in exdented protected eol  
following
in exdented a @* 
 and following
after exdented

example
in exdented protected eol  
following
in exdented a @* 
 and following
after exdented
';

$result_errors{'exdent_and_commands'} = '* W l3|@ should not occur at end of argument to line command
 warning: @ should not occur at end of argument to line command

* W l11|@ should not occur at end of argument to line command
 warning: @ should not occur at end of argument to line command

';

$result_nodes_list{'exdent_and_commands'} = '';

$result_sections_list{'exdent_and_commands'} = '';

$result_sectioning_root{'exdent_and_commands'} = '';

$result_headings_list{'exdent_and_commands'} = '';


$result_converted{'plaintext'}->{'exdent_and_commands'} = '     quotation1
in exdented protected eol  
     following
in exdented a @*
and following
     after exdented

     example
in exdented protected eol  
     following
in exdented a @*
 and following
     after exdented
';


$result_converted{'html_text'}->{'exdent_and_commands'} = '<blockquote class="quotation">
<p>quotation1
</p><p class="exdent">in exdented protected eol &nbsp;
</p><p>following
</p><p class="exdent">in exdented a @* <br> and following
</p><p>after exdented
</p></blockquote>

<div class="example">
<pre class="example-preformatted">example
</pre><pre class="exdent">in exdented protected eol &nbsp;
</pre><pre class="example-preformatted">following
</pre><pre class="exdent">in exdented a @* 
 and following
</pre><pre class="example-preformatted">after exdented
</pre></div>
';


$result_converted{'xml'}->{'exdent_and_commands'} = '<quotation endspaces=" ">
<para>quotation1
</para><exdent> in exdented protected eol <spacecmd type="nl"/></exdent><para>following
</para><exdent> in exdented a &arobase;* &linebreak; and following</exdent>
<para>after exdented
</para></quotation>

<example endspaces=" ">
<pre xml:space="preserve">example
</pre><exdent> in exdented protected eol <spacecmd type="nl"/></exdent><pre xml:space="preserve">following
</pre><exdent> in exdented a &arobase;* &linebreak; and following</exdent>
<pre xml:space="preserve">after exdented
</pre></example>
';


$result_converted{'latex_text'}->{'exdent_and_commands'} = '\\begin{document}
\\begin{quote}
quotation1
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
in exdented protected eol \\ {}
\\\\
following
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
in exdented a @* \\leavevmode{}\\\\ and following
\\\\
after exdented
\\end{quote}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily example
\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
in exdented protected eol \\ {}
\\\\
\\begin{Texinfopreformatted}%
\\ttfamily following
\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
in exdented a @* \\leavevmode{}\\\\ and following
\\\\
\\begin{Texinfopreformatted}%
\\ttfamily after exdented
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';


$result_converted{'docbook'}->{'exdent_and_commands'} = '<blockquote><para>quotation1
</para><simpara role="exdent">in exdented protected eol &#160;</simpara>
<para>following
</para><simpara role="exdent">in exdented a @* 
 and following</simpara>
<para>after exdented
</para></blockquote>
<screen>example
</screen><simpara role="exdent">in exdented protected eol &#160;</simpara>
<screen>following
</screen><simpara role="exdent">in exdented a @* 
 and following</simpara>
<screen>after exdented
</screen>';

1;
