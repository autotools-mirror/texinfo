use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'nested_example_and_comment'} = '*document_root C1
 *before_node_section C5
  *@example C5 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C2
    {First line 0 }
    *@c C1
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {rawline_text:}
   *@example C3 l3
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *preformatted C1
     {Nested example\\n}
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
   *preformatted C1
    {In first one\\n}
   *@end C1 l7
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
  *@example C5 l9
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C2
    {First line 1 }
    *@c C1
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {rawline_text:}
   *@example C3 l11
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *preformatted C2
     {Nested example }
     *@c C1
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:}
    *@end C1 l13
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
   *preformatted C1
    {In first one\\n}
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
  {empty_line:\\n}
  *@example C5 l17
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C2
    {First line 2 }
    *@c C1
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {rawline_text:}
   *@example C3 l19
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *preformatted C2
     {Nested example }
     *@c C1
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:}
    *@end C1 l21
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
   *preformatted C2
    {In first one }
    *@c C1
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {rawline_text:}
   *@end C1 l23
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


$result_texis{'nested_example_and_comment'} = '@example
First line 0 @c
@example
Nested example
@end example
In first one
@end example

@example
First line 1 @c
@example
Nested example @c
@end example
In first one
@end example

@example
First line 2 @c
@example
Nested example @c
@end example
In first one @c
@end example
';


$result_texts{'nested_example_and_comment'} = 'First line 0 Nested example
In first one

First line 1 Nested example In first one

First line 2 Nested example In first one ';

$result_errors{'nested_example_and_comment'} = '';

$result_nodes_list{'nested_example_and_comment'} = '';

$result_sections_list{'nested_example_and_comment'} = '';

$result_sectioning_root{'nested_example_and_comment'} = '';

$result_headings_list{'nested_example_and_comment'} = '';


$result_converted{'plaintext'}->{'nested_example_and_comment'} = '     First line 0
          Nested example
     In first one

     First line 1
          Nested example
     In first one

     First line 2
          Nested example
     In first one
';


$result_converted{'html'}->{'nested_example_and_comment'} = '<!DOCTYPE html>
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
<div class="example">
<pre class="example-preformatted">First line 0 </pre><div class="example">
<pre class="example-preformatted">Nested example
</pre></div>
<pre class="example-preformatted">In first one
</pre></div>

<div class="example">
<pre class="example-preformatted">First line 1 </pre><div class="example">
<pre class="example-preformatted">Nested example </pre></div>
<pre class="example-preformatted">In first one
</pre></div>

<div class="example">
<pre class="example-preformatted">First line 2 </pre><div class="example">
<pre class="example-preformatted">Nested example </pre></div>
<pre class="example-preformatted">In first one </pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'nested_example_and_comment'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'docbook'}->{'nested_example_and_comment'} = '<screen>First line 0 <!-- -->
</screen><screen>Nested example
</screen><screen>In first one
</screen>
<screen>First line 1 <!-- -->
</screen><screen>Nested example <!-- -->
</screen><screen>In first one
</screen>
<screen>First line 2 <!-- -->
</screen><screen>Nested example <!-- -->
</screen><screen>In first one <!-- -->
</screen>';


$result_converted{'xml'}->{'nested_example_and_comment'} = '<example endspaces=" ">
<pre xml:space="preserve">First line 0 <!-- c -->
</pre><example endspaces=" ">
<pre xml:space="preserve">Nested example
</pre></example>
<pre xml:space="preserve">In first one
</pre></example>

<example endspaces=" ">
<pre xml:space="preserve">First line 1 <!-- c -->
</pre><example endspaces=" ">
<pre xml:space="preserve">Nested example <!-- c -->
</pre></example>
<pre xml:space="preserve">In first one
</pre></example>

<example endspaces=" ">
<pre xml:space="preserve">First line 2 <!-- c -->
</pre><example endspaces=" ">
<pre xml:space="preserve">Nested example <!-- c -->
</pre></example>
<pre xml:space="preserve">In first one <!-- c -->
</pre></example>
';


$result_converted{'latex_text'}->{'nested_example_and_comment'} = '\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily First line 0 \\end{Texinfopreformatted}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily Nested example
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily In first one
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily First line 1 \\end{Texinfopreformatted}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily Nested example \\end{Texinfopreformatted}
\\end{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily In first one
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily First line 2 \\end{Texinfopreformatted}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily Nested example \\end{Texinfopreformatted}
\\end{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily In first one \\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
