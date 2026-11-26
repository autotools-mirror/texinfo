use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'exampleindent_set'} = '*document_root C1
 *before_node_section C2
  *preamble C2
   *normal_command@exampleindent C1 l1
   |global_command_number:{1}
   |misc_args:A{2}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:2}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@example C3 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:EXAMPLE INDENT\\n}
   *normal_command@end C1 l5
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'exampleindent_set'} = '@exampleindent 2

@example
EXAMPLE INDENT
@end example
';


$result_texts{'exampleindent_set'} = '
EXAMPLE INDENT
';

$result_errors{'exampleindent_set'} = '';

$result_nodes_list{'exampleindent_set'} = '';

$result_sections_list{'exampleindent_set'} = '';

$result_sectioning_root{'exampleindent_set'} = '';

$result_headings_list{'exampleindent_set'} = '';


$result_converted{'plaintext'}->{'exampleindent_set'} = '  EXAMPLE INDENT
';


$result_converted{'html'}->{'exampleindent_set'} = '<!DOCTYPE html>
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
<pre class="example-preformatted">EXAMPLE INDENT
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'exampleindent_set'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'exampleindent_set'} = '
<screen>EXAMPLE INDENT
</screen>';


$result_converted{'xml'}->{'exampleindent_set'} = '<exampleindent value="2" line=" 2"></exampleindent>

<example endspaces=" ">
<pre xml:space="preserve">EXAMPLE INDENT
</pre></example>
';


$result_converted{'latex_text'}->{'exampleindent_set'} = '
\\begin{document}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily EXAMPLE INDENT
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
