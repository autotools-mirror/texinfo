use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'itemize_in_example'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@example C11 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@itemize C3 l2
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *@bullet l2
      {spaces_after_argument:\\n}
    *@item C1 l3
    |EXTRA
    |item_number:{1}
     *preformatted C4
      {ignorable_spaces_after_command: }
      {normal_text:first\\n}
      {empty_line:\\n}
      {normal_text:more.\\n}
    *@end C1 l6
    |EXTRA
    |text_arg:{itemize}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:itemize}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *@itemize C3 l8
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *@asis l8
      {spaces_after_argument:\\n}
    *@item C1 l9
    |EXTRA
    |item_number:{1}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:as is\\n}
    *@end C1 l10
    |EXTRA
    |text_arg:{itemize}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:itemize}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *@itemize C3 l12
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      {normal_text:+}
      {spaces_after_argument:\\n}
    *@item C1 l13
    |EXTRA
    |item_number:{1}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:item +\\n}
    *@end C1 l14
    |EXTRA
    |text_arg:{itemize}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:itemize}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *@itemize C3 l16
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      {normal_text:m--n}
      {spaces_after_argument:\\n}
    *@item C1 l17
    |EXTRA
    |item_number:{1}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:with m--n\\n}
    *@end C1 l18
    |EXTRA
    |text_arg:{itemize}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:itemize}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *@itemize C3 l20
    *arguments_line C1
     *block_line_arg C4
      {spaces_before_argument: }
      *@bullet C1 l20
       *brace_container
      {normal_text: a--n itemize line}
      {spaces_after_argument:\\n}
    *@item C1 l21
    |EXTRA
    |item_number:{1}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:in an itemize line\\n}
    *@end C1 l22
    |EXTRA
    |text_arg:{itemize}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:itemize}
      {spaces_after_argument:\\n}
   *@end C1 l23
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'itemize_in_example'} = '@example
@itemize @bullet
@item first

more.
@end itemize

@itemize @asis
@item as is
@end itemize

@itemize +
@item item +
@end itemize

@itemize m--n
@item with m--n
@end itemize

@itemize @bullet{} a--n itemize line
@item in an itemize line
@end itemize
@end example
';


$result_texts{'itemize_in_example'} = 'first

more.

as is

item +

with m--n

in an itemize line
';

$result_errors{'itemize_in_example'} = '* W l8|@asis expected braces
 warning: @asis expected braces

';

$result_nodes_list{'itemize_in_example'} = '';

$result_sections_list{'itemize_in_example'} = '';

$result_sectioning_root{'itemize_in_example'} = '';

$result_headings_list{'itemize_in_example'} = '';


$result_converted{'plaintext'}->{'itemize_in_example'} = '        • first

          more.

          as is

        + item +

        m-n with m--n

        • a-n itemize line in an itemize line
';


$result_converted{'html_text'}->{'itemize_in_example'} = '<div class="example">
<ul class="itemize mark-bullet">
<li><pre class="example-preformatted">first

more.
</pre></li></ul>
<pre class="example-preformatted">

</pre><ul class="itemize">
<li><pre class="example-preformatted">as is
</pre></li></ul>
<pre class="example-preformatted">

</pre><ul class="itemize" style="list-style-type: \'+\'">
<li><pre class="example-preformatted">item +
</pre></li></ul>
<pre class="example-preformatted">

</pre><ul class="itemize" style="list-style-type: \'m\\2013 n\'">
<li><pre class="example-preformatted">with m--n
</pre></li></ul>
<pre class="example-preformatted">

</pre><ul class="itemize" style="list-style-type: \'\\2022  a\\2013 n itemize line\'">
<li><pre class="example-preformatted">in an itemize line
</pre></li></ul>
</div>
';


$result_converted{'xml'}->{'itemize_in_example'} = '<example endspaces=" ">
<itemize commandarg="bullet" endspaces=" "><itemprepend> <formattingcommand command="bullet"/></itemprepend>
<listitem><prepend>&bullet;</prepend><pre xml:space="preserve"> first

more.
</pre></listitem></itemize>
<pre xml:space="preserve">
</pre><itemize commandarg="asis" endspaces=" "><itemprepend> </itemprepend>
<listitem><prepend></prepend><pre xml:space="preserve"> as is
</pre></listitem></itemize>
<pre xml:space="preserve">
</pre><itemize endspaces=" "><itemprepend> +</itemprepend>
<listitem><prepend>+</prepend><pre xml:space="preserve"> item +
</pre></listitem></itemize>
<pre xml:space="preserve">
</pre><itemize endspaces=" "><itemprepend> m--n</itemprepend>
<listitem><prepend>m--n</prepend><pre xml:space="preserve"> with m--n
</pre></listitem></itemize>
<pre xml:space="preserve">
</pre><itemize endspaces=" "><itemprepend> &bullet; a--n itemize line</itemprepend>
<listitem><prepend>&bullet; a--n itemize line</prepend><pre xml:space="preserve"> in an itemize line
</pre></listitem></itemize>
</example>
';


$result_converted{'latex_text'}->{'itemize_in_example'} = '\\begin{document}
\\begin{Texinfoindented}
\\begin{itemize}[label=\\textbullet{}]
\\item \\begin{Texinfopreformatted}%
\\ttfamily first

more.
\\end{Texinfopreformatted}
\\end{itemize}
\\begin{Texinfopreformatted}%
\\ttfamily 
\\end{Texinfopreformatted}
\\begin{itemize}
\\item \\begin{Texinfopreformatted}%
\\ttfamily as is
\\end{Texinfopreformatted}
\\end{itemize}
\\begin{Texinfopreformatted}%
\\ttfamily 
\\end{Texinfopreformatted}
\\begin{itemize}[label=+]
\\item \\begin{Texinfopreformatted}%
\\ttfamily item +
\\end{Texinfopreformatted}
\\end{itemize}
\\begin{Texinfopreformatted}%
\\ttfamily 
\\end{Texinfopreformatted}
\\begin{itemize}[label=m--n]
\\item \\begin{Texinfopreformatted}%
\\ttfamily with m{-}{-}n
\\end{Texinfopreformatted}
\\end{itemize}
\\begin{Texinfopreformatted}%
\\ttfamily 
\\end{Texinfopreformatted}
\\begin{itemize}[label=\\textbullet{} a--n itemize line]
\\item \\begin{Texinfopreformatted}%
\\ttfamily in an itemize line
\\end{Texinfopreformatted}
\\end{itemize}
\\end{Texinfoindented}
';

1;
