use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comments_in_example'} = '*document_root C1
 *before_node_section C9
  *preamble_before_content
  *paragraph C1
   {normal_text:Example with comments 2 lines\\n}
  *@example C3 l2
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *preformatted C4
    {normal_text:line }
    *@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment}
      {spaces_after_argument:\\n}
    {normal_text:second line }
    *@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment}
      {spaces_after_argument:\\n}
   *@end C1 l5
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Example with comments 1 line\\n}
  *@example C3 l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    {normal_text:line }
    *@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment}
      {spaces_after_argument:\\n}
   *@end C1 l10
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Example with newline after comment\\n}
  *@example C3 l13
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C4
    {normal_text:line }
    *@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
    {normal_text:second line\\n}
   *@end C1 l17
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'comments_in_example'} = 'Example with comments 2 lines
@example 
line @c comment
second line @c comment
@end example

Example with comments 1 line
@example
line @c comment
@end example

Example with newline after comment
@example
line @c comment

second line
@end example
';


$result_texts{'comments_in_example'} = 'Example with comments 2 lines
line second line 
Example with comments 1 line
line 
Example with newline after comment
line 
second line
';

$result_errors{'comments_in_example'} = '';

$result_nodes_list{'comments_in_example'} = '';

$result_sections_list{'comments_in_example'} = '';

$result_sectioning_root{'comments_in_example'} = '';

$result_headings_list{'comments_in_example'} = '';


$result_converted{'plaintext'}->{'comments_in_example'} = 'Example with comments 2 lines
     line second line

   Example with comments 1 line
     line

   Example with newline after comment
     line
     second line
';


$result_converted{'html'}->{'comments_in_example'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
div.example {margin-left: 3.2em}
</style>


</head>

<body>
<p>Example with comments 2 lines
</p><div class="example">
<pre class="example-preformatted">line second line </pre></div>

<p>Example with comments 1 line
</p><div class="example">
<pre class="example-preformatted">line </pre></div>

<p>Example with newline after comment
</p><div class="example">
<pre class="example-preformatted">line 
second line
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'comments_in_example'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'comments_in_example'} = '<para>Example with comments 2 lines
</para><screen>line <!-- comment -->
second line <!-- comment -->
</screen>
<para>Example with comments 1 line
</para><screen>line <!-- comment -->
</screen>
<para>Example with newline after comment
</para><screen>line <!-- comment -->

second line
</screen>';


$result_converted{'xml'}->{'comments_in_example'} = '<para>Example with comments 2 lines
</para><example endspaces=" "> 
<pre xml:space="preserve">line <!-- c comment -->
second line <!-- c comment -->
</pre></example>

<para>Example with comments 1 line
</para><example endspaces=" ">
<pre xml:space="preserve">line <!-- c comment -->
</pre></example>

<para>Example with newline after comment
</para><example endspaces=" ">
<pre xml:space="preserve">line <!-- c comment -->

second line
</pre></example>
';


$result_converted{'latex_text'}->{'comments_in_example'} = '\\begin{document}
Example with comments 2 lines
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily line second line \\end{Texinfopreformatted}
\\end{Texinfoindented}

Example with comments 1 line
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily line \\end{Texinfopreformatted}
\\end{Texinfoindented}

Example with newline after comment
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily line 
second line
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
