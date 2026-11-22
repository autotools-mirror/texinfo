use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'exampleindent_zero'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content C2
   *normal_command@exampleindent C1 l1
   |global_command_number:{1}
   |misc_args:A{asis}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:asis}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@example C3 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:EXAMPLE INDENT asis\\n}
   *normal_command@end C1 l5
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@exampleindent C1 l7
  |global_command_number:{2}
  |misc_args:A{0}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:0}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:EXAMPLE INDENT 0\\n}
   *normal_command@end C1 l11
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'exampleindent_zero'} = '@exampleindent asis

@example
EXAMPLE INDENT asis
@end example

@exampleindent 0

@example
EXAMPLE INDENT 0
@end example
';


$result_texts{'exampleindent_zero'} = '
EXAMPLE INDENT asis


EXAMPLE INDENT 0
';

$result_errors{'exampleindent_zero'} = '';

$result_nodes_list{'exampleindent_zero'} = '';

$result_sections_list{'exampleindent_zero'} = '';

$result_sectioning_root{'exampleindent_zero'} = '';

$result_headings_list{'exampleindent_zero'} = '';


$result_converted{'plaintext'}->{'exampleindent_zero'} = 'EXAMPLE INDENT asis

EXAMPLE INDENT 0
';


$result_converted{'html'}->{'exampleindent_zero'} = '<!DOCTYPE html>
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

<div class="example">
<pre class="example-preformatted">EXAMPLE INDENT asis
</pre></div>


<div class="example">
<pre class="example-preformatted">EXAMPLE INDENT 0
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'exampleindent_zero'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'exampleindent_zero'} = '
<screen>EXAMPLE INDENT asis
</screen>

<screen>EXAMPLE INDENT 0
</screen>';


$result_converted{'xml'}->{'exampleindent_zero'} = '<exampleindent value="asis" line=" asis"></exampleindent>

<example endspaces=" ">
<pre xml:space="preserve">EXAMPLE INDENT asis
</pre></example>

<exampleindent value="0" line=" 0"></exampleindent>

<example endspaces=" ">
<pre xml:space="preserve">EXAMPLE INDENT 0
</pre></example>
';


$result_converted{'latex_text'}->{'exampleindent_zero'} = '
\\begin{document}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily EXAMPLE INDENT asis
\\end{Texinfopreformatted}
\\end{Texinfoindented}


\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily EXAMPLE INDENT 0
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
