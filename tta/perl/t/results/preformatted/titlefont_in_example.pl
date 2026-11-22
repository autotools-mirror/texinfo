use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'titlefont_in_example'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@example C4 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@titlefont C1 l2
   |EXTRA
   |global_command_number:{1}
    *brace_container C1
     {normal_text:Title}
   *preformatted C2
    {normal_text:\\n}
    {normal_text:Text.\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'titlefont_in_example'} = '@example
@titlefont{Title}
Text.
@end example
';


$result_texts{'titlefont_in_example'} = 'Title
Text.
';

$result_errors{'titlefont_in_example'} = '';

$result_nodes_list{'titlefont_in_example'} = '';

$result_sections_list{'titlefont_in_example'} = '';

$result_sectioning_root{'titlefont_in_example'} = '';

$result_headings_list{'titlefont_in_example'} = '';


$result_converted{'plaintext'}->{'titlefont_in_example'} = '     Title
     *****
     Text.
';


$result_converted{'html'}->{'titlefont_in_example'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Title</title>

<meta name="description" content="Title">
<meta name="keywords" content="Title">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
div.example {margin-left: 3.2em}
</style>


</head>

<body>
<div class="example">
<h1 class="titlefont">Title</h1><pre class="example-preformatted">

Text.
</pre></div>



</body>
</html>
';


$result_converted{'docbook'}->{'titlefont_in_example'} = 'Title<screen>
Text.
</screen>';


$result_converted{'xml'}->{'titlefont_in_example'} = '<example endspaces=" ">
<titlefont>Title</titlefont><pre xml:space="preserve">
Text.
</pre></example>
';


$result_converted{'latex_text'}->{'titlefont_in_example'} = '\\begin{document}
\\begin{Texinfoindented}
{\\huge \\bfseries Title}\\begin{Texinfopreformatted}%
\\ttfamily 
Text.
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
