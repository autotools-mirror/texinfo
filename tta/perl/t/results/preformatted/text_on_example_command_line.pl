use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text_on_example_command_line'} = '*document_root C1
 *before_node_section C8
  *preamble
  *normal_command@example C2 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:text on line}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l4
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:text on line followed by text}
     {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:normal text\\n}
   *normal_command@end C1 l6
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:in example\\n}
   *normal_command@end C1 l10
   |text_arg:{example text after end}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example text after end}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l12
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@example C2 l13
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@end C1 l14
    |text_arg:{example text after end example nested in example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example text after end example nested in example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l15
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'text_on_example_command_line'} = '@example text on line
@end example

@example text on line followed by text
normal text
@end example

@example
in example
@end example text after end

@example
@example
@end example text after end example nested in example
@end example
';


$result_texts{'text_on_example_command_line'} = '
normal text

in example

';

$result_errors{'text_on_example_command_line'} = '* E l10|bad argument to @end: example text after end
 bad argument to @end: example text after end

* E l14|bad argument to @end: example text after end example nested in example
 bad argument to @end: example text after end example nested in example

';

$result_nodes_list{'text_on_example_command_line'} = '';

$result_sections_list{'text_on_example_command_line'} = '';

$result_sectioning_root{'text_on_example_command_line'} = '';

$result_headings_list{'text_on_example_command_line'} = '';


$result_converted{'plaintext'}->{'text_on_example_command_line'} = '     normal text

     in example

';


$result_converted{'html'}->{'text_on_example_command_line'} = '<!DOCTYPE html>
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

<div class="example user-text-on-line-followed-by-text">
<pre class="example-preformatted">normal text
</pre></div>

<div class="example">
<pre class="example-preformatted">in example
</pre></div>




</body>
</html>
';

$result_converted_errors{'html'}->{'text_on_example_command_line'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'text_on_example_command_line'} = '
<screen>normal text
</screen>
<screen>in example
</screen>
';


$result_converted{'xml'}->{'text_on_example_command_line'} = '<example endspaces=" "><examplelanguage> text on line</examplelanguage>
</example>

<example endspaces=" "><examplelanguage> text on line followed by text</examplelanguage>
<pre xml:space="preserve">normal text
</pre></example>

<example endspaces=" ">
<pre xml:space="preserve">in example
</pre></example>

<example endspaces=" ">
<example endspaces=" ">
</example>
</example>
';


$result_converted{'latex_text'}->{'text_on_example_command_line'} = '\\begin{document}
\\begin{Texinfoindented}
\\end{Texinfoindented}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily normal text
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in example
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{Texinfoindented}
\\begin{Texinfoindented}
\\end{Texinfoindented}
\\end{Texinfoindented}
';

1;
