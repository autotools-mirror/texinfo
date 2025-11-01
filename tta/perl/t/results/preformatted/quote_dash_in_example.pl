use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'quote_dash_in_example'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *@example C3 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C2
    {and now -- yes---now and ``so\'\'.\\n}
    {empty_line:\\n}
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
';


$result_texis{'quote_dash_in_example'} = '
@example
and now -- yes---now and ``so\'\'.

@end example
';


$result_texts{'quote_dash_in_example'} = '
and now -- yes---now and ``so\'\'.

';

$result_errors{'quote_dash_in_example'} = '';

$result_nodes_list{'quote_dash_in_example'} = '';

$result_sections_list{'quote_dash_in_example'} = '';

$result_sectioning_root{'quote_dash_in_example'} = '';

$result_headings_list{'quote_dash_in_example'} = '';


$result_converted{'plaintext'}->{'quote_dash_in_example'} = '     and now -- yes---now and ``so\'\'.

';


$result_converted{'html'}->{'quote_dash_in_example'} = '<!DOCTYPE html>
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
<pre class="example-preformatted">and now -- yes---now and ``so\'\'.

</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'quote_dash_in_example'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'quote_dash_in_example'} = '
<screen>and now -- yes---now and ``so\'\'.

</screen>';


$result_converted{'xml'}->{'quote_dash_in_example'} = '
<example endspaces=" ">
<pre xml:space="preserve">and now -- yes---now and ``so\'\'.

</pre></example>
';


$result_converted{'latex_text'}->{'quote_dash_in_example'} = '
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily and now {-}{-} yes{-}{-}{-}now and {`}{`}so{\'}{\'}.

\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
