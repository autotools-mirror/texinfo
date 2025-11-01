use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comment_example_and_blank_lines'} = '*document_root C1
 *before_node_section C15
  *paragraph C1
   {Para.\\n}
  {empty_line:\\n}
  *@example C3 l3
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C2
    {comment, blank after }
    *@c C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {rawline_text:comment}
   *@end C1 l5
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
  {empty_line:\\n}
  *paragraph C1
   {Para.\\n}
  {empty_line:\\n}
  *@example C3 l9
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C2
    {comment, no blank after }
    *@c C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {rawline_text:comment}
   *@end C1 l11
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
  *paragraph C1
   {Para.\\n}
  {empty_line:\\n}
  *@example C3 l14
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C1
    {no comment, blank after\\n}
   *@end C1 l16
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
  {empty_line:\\n}
  *paragraph C1
   {Para.\\n}
  {empty_line:\\n}
  *@example C3 l20
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C1
    {no comment, no blank after\\n}
   *@end C1 l22
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
  *paragraph C1
   {Para.\\n}
';


$result_texis{'comment_example_and_blank_lines'} = 'Para.

@example
comment, blank after @c comment
@end example

Para.

@example
comment, no blank after @c comment
@end example
Para.

@example
no comment, blank after
@end example

Para.

@example
no comment, no blank after
@end example
Para.
';


$result_texts{'comment_example_and_blank_lines'} = 'Para.

comment, blank after 
Para.

comment, no blank after Para.

no comment, blank after

Para.

no comment, no blank after
Para.
';

$result_errors{'comment_example_and_blank_lines'} = '';

$result_nodes_list{'comment_example_and_blank_lines'} = '';

$result_sections_list{'comment_example_and_blank_lines'} = '';

$result_sectioning_root{'comment_example_and_blank_lines'} = '';

$result_headings_list{'comment_example_and_blank_lines'} = '';


$result_converted{'plaintext'}->{'comment_example_and_blank_lines'} = 'Para.

     comment, blank after

   Para.

     comment, no blank after
   Para.

     no comment, blank after

   Para.

     no comment, no blank after
   Para.
';


$result_converted{'html'}->{'comment_example_and_blank_lines'} = '<!DOCTYPE html>
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

<body lang="">
<p>Para.
</p>
<div class="example">
<pre class="example-preformatted">comment, blank after </pre></div>

<p>Para.
</p>
<div class="example">
<pre class="example-preformatted">comment, no blank after </pre></div>
<p>Para.
</p>
<div class="example">
<pre class="example-preformatted">no comment, blank after
</pre></div>

<p>Para.
</p>
<div class="example">
<pre class="example-preformatted">no comment, no blank after
</pre></div>
<p>Para.
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'comment_example_and_blank_lines'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'comment_example_and_blank_lines'} = '<para>Para.
</para>
<screen>comment, blank after <!-- comment -->
</screen>
<para>Para.
</para>
<screen>comment, no blank after <!-- comment -->
</screen><para>Para.
</para>
<screen>no comment, blank after
</screen>
<para>Para.
</para>
<screen>no comment, no blank after
</screen><para>Para.
</para>';


$result_converted{'xml'}->{'comment_example_and_blank_lines'} = '<para>Para.
</para>
<example endspaces=" ">
<pre xml:space="preserve">comment, blank after <!-- c comment -->
</pre></example>

<para>Para.
</para>
<example endspaces=" ">
<pre xml:space="preserve">comment, no blank after <!-- c comment -->
</pre></example>
<para>Para.
</para>
<example endspaces=" ">
<pre xml:space="preserve">no comment, blank after
</pre></example>

<para>Para.
</para>
<example endspaces=" ">
<pre xml:space="preserve">no comment, no blank after
</pre></example>
<para>Para.
</para>';


$result_converted{'latex_text'}->{'comment_example_and_blank_lines'} = 'Para.

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily comment,\\ blank after \\end{Texinfopreformatted}
\\end{Texinfoindented}

Para.

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily comment,\\ no blank after \\end{Texinfopreformatted}
\\end{Texinfoindented}
Para.

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily no comment,\\ blank after
\\end{Texinfopreformatted}
\\end{Texinfoindented}

Para.

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily no comment,\\ no blank after
\\end{Texinfopreformatted}
\\end{Texinfoindented}
Para.
';

1;
