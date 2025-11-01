use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'exdent_and_commands'} = '*document_root C1
 *before_node_section C3
  *@quotation C7 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {quotation1\\n}
   *@exdent C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C2
     {in exdented protected eol }
     *@\\n
   *paragraph C1
    {following\\n}
   *@exdent C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {in exdented a }
     *@@
     {* }
     *@*
     { and following}
   *paragraph C1
    {after exdented\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
  {empty_line:\\n}
  *@example C7 l9
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C1
    {example\\n}
   *@exdent C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C2
     {in exdented protected eol }
     *@\\n
   *preformatted C1
    {following\\n}
   *@exdent C1 l13
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {in exdented a }
     *@@
     {* }
     *@*
     { and following}
   *preformatted C1
    {after exdented\\n}
   *@end C1 l15
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
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
</para><exdent spaces=" ">in exdented protected eol <spacecmd type="nl"/></exdent><para>following
</para><exdent spaces=" ">in exdented a &arobase;* &linebreak; and following</exdent>
<para>after exdented
</para></quotation>

<example endspaces=" ">
<pre xml:space="preserve">example
</pre><exdent spaces=" ">in exdented protected eol <spacecmd type="nl"/></exdent><pre xml:space="preserve">following
</pre><exdent spaces=" ">in exdented a &arobase;* &linebreak; and following</exdent>
<pre xml:space="preserve">after exdented
</pre></example>
';


$result_converted{'latex_text'}->{'exdent_and_commands'} = '\\begin{quote}
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
