use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C3
    {normal_text:example\\n}
    {empty_line:\\n}
    {normal_text:after empty line\\n}
   *@end C1 l5
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_line'} = '@example
example

after empty line
@end example
';


$result_texts{'empty_line'} = 'example

after empty line
';

$result_errors{'empty_line'} = '';

$result_nodes_list{'empty_line'} = '';

$result_sections_list{'empty_line'} = '';

$result_sectioning_root{'empty_line'} = '';

$result_headings_list{'empty_line'} = '';


$result_converted{'plaintext'}->{'empty_line'} = '     example

     after empty line
';


$result_converted{'html'}->{'empty_line'} = '<!DOCTYPE html>
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
<pre class="example-preformatted">example

after empty line
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'empty_line'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'empty_line'} = '<screen>example

after empty line
</screen>';


$result_converted{'xml'}->{'empty_line'} = '<example endspaces=" ">
<pre xml:space="preserve">example

after empty line
</pre></example>
';


$result_converted{'latex_text'}->{'empty_line'} = '\\begin{document}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily example

after empty line
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
