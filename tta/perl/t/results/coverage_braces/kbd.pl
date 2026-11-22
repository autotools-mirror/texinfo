use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'kbd'} = '*document_root C1
 *before_node_section C14
  *preamble_before_content
  *paragraph C3
   {normal_text:kbd: }
   *normal_command@code C1 l1
    *brace_container C1
     {normal_text:in kbd}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:kbd in code: }
   *normal_command@code C1 l3
    *brace_container C2
     {normal_text:in first }
     *normal_command@kbd C1 l3
      *brace_container C1
       {normal_text:in nested kbd}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:kbd in kbd: }
   *normal_command@kbd C1 l5
    *brace_container C2
     {normal_text:in top kbd }
     *normal_command@kbd C1 l5
      *brace_container C1
       {normal_text:in nested kbd}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:kbd in }
   *normal_command@@
   {normal_text:example:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *preformatted C3
    {normal_text:in example\\n}
    *normal_command@code C1 l11
     *brace_container C1
      {normal_text:in example in kbd}
    {normal_text:.\\n}
   *normal_command@end C1 l12
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:kbd in }
   *normal_command@@
   {normal_text:format:\\n}
  {empty_line:\\n}
  *normal_command@format C3 l16
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *preformatted C3
    {normal_text:in format\\n}
    *normal_command@code C1 l18
     *brace_container C1
      {normal_text:in format in kbd}
    {normal_text:.\\n}
   *normal_command@end C1 l19
   |EXTRA
   |text_arg:{format}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:format}
     {spaces_after_argument:\\n}
';


$result_texis{'kbd'} = 'kbd: @code{in kbd}.

kbd in code: @code{in first @kbd{in nested kbd}}.

kbd in kbd: @kbd{in top kbd @kbd{in nested kbd}}.

kbd in @@example:

@example 
in example
@code{in example in kbd}.
@end example

kbd in @@format:

@format 
in format
@code{in format in kbd}.
@end format
';


$result_texts{'kbd'} = 'kbd: in kbd.

kbd in code: in first in nested kbd.

kbd in kbd: in top kbd in nested kbd.

kbd in @example:

in example
in example in kbd.

kbd in @format:

in format
in format in kbd.
';

$result_errors{'kbd'} = '';

$result_nodes_list{'kbd'} = '';

$result_sections_list{'kbd'} = '';

$result_sectioning_root{'kbd'} = '';

$result_headings_list{'kbd'} = '';


$result_converted{'plaintext'}->{'kbd'} = 'kbd: ‘in kbd’.

   kbd in code: ‘in first in nested kbd’.

   kbd in kbd: ‘in top kbd in nested kbd’.

   kbd in @example:

     in example
     in example in kbd.

   kbd in @format:

in format
‘in format in kbd’.
';


$result_converted{'html_text'}->{'kbd'} = '<p>kbd: <code class="code">in kbd</code>.
</p>
<p>kbd in code: <code class="code">in first <kbd class="kbd">in nested kbd</kbd></code>.
</p>
<p>kbd in kbd: <kbd class="kbd">in top kbd <kbd class="kbd">in nested kbd</kbd></kbd>.
</p>
<p>kbd in @example:
</p>
<div class="example">
<pre class="example-preformatted">in example
<code class="code">in example in kbd</code>.
</pre></div>

<p>kbd in @format:
</p>
<div class="format">
<pre class="format-preformatted">in format
<code class="code">in format in kbd</code>.
</pre></div>
';


$result_converted{'latex_text'}->{'kbd'} = '\\begin{document}
kbd: \\texttt{in kbd}.

kbd in code: \\texttt{in first \\Texinfocommandstyletextkbd{in nested kbd}}.

kbd in kbd: \\Texinfocommandstyletextkbd{in top kbd \\Texinfocommandstyletextkbd{in nested kbd}}.

kbd in @example:

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in example
\\texttt{in example in kbd}.
\\end{Texinfopreformatted}
\\end{Texinfoindented}

kbd in @format:

\\begin{Texinfopreformatted}%
in format
\\texttt{in format in kbd}.
\\end{Texinfopreformatted}
';


$result_converted{'docbook'}->{'kbd'} = '<para>kbd: <literal>in kbd</literal>.
</para>
<para>kbd in code: <literal>in first <userinput>in nested kbd</userinput></literal>.
</para>
<para>kbd in kbd: <userinput>in top kbd <userinput>in nested kbd</userinput></userinput>.
</para>
<para>kbd in @example:
</para>
<screen>in example
<literal>in example in kbd</literal>.
</screen>
<para>kbd in @format:
</para>
<literallayout>in format
<literal>in format in kbd</literal>.
</literallayout>';

1;
