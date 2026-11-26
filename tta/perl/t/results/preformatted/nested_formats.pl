use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_formats'} = '*document_root C1
 *before_node_section C4
  *preamble
  *normal_command@format C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@example C3 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C3
     {empty_line:\\n}
     {normal_text:in -- format/example\\n}
     {empty_line:\\n}
    *normal_command@end C1 l6
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l7
   |text_arg:{format}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:format}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@format C3 l10
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C3
     {empty_line:\\n}
     {normal_text:in -- example/format\\n}
     {empty_line:\\n}
    *normal_command@end C1 l14
    |text_arg:{format}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:format}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l15
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'nested_formats'} = '@format
@example

in -- format/example

@end example
@end format

@example
@format

in -- example/format

@end format
@end example
';


$result_texts{'nested_formats'} = '
in -- format/example



in -- example/format

';

$result_errors{'nested_formats'} = '';

$result_nodes_list{'nested_formats'} = '';

$result_sections_list{'nested_formats'} = '';

$result_sectioning_root{'nested_formats'} = '';

$result_headings_list{'nested_formats'} = '';


$result_converted{'plaintext'}->{'nested_formats'} = '
     in -- format/example


     in -- example/format

';


$result_converted{'html'}->{'nested_formats'} = '<!DOCTYPE html>
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
<div class="format">
<div class="example">
<pre class="example-preformatted">

in -- format/example

</pre></div>
</div>

<div class="example">
<div class="format">
<pre class="example-preformatted">

in -- example/format

</pre></div>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'nested_formats'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'nested_formats'} = '<screen>
in -- format/example

</screen>
<literallayout>
in -- example/format

</literallayout>';


$result_converted{'xml'}->{'nested_formats'} = '<format endspaces=" ">
<example endspaces=" ">
<pre xml:space="preserve">
in -- format/example

</pre></example>
</format>

<example endspaces=" ">
<format endspaces=" ">
<pre xml:space="preserve">
in -- example/format

</pre></format>
</example>
';


$result_converted{'latex_text'}->{'nested_formats'} = '\\begin{document}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily 
in {-}{-} format/example

\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%

in -- example/format

\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
