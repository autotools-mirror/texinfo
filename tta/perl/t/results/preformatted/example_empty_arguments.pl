use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'example_empty_arguments'} = '*document_root C1
 *before_node_section C5
  *@example C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C7
    *block_line_arg
    *block_line_arg
    *block_line_arg
    *block_line_arg
    *block_line_arg
    *block_line_arg
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C1
    {example with empty args\\n}
   *@end C1 l3
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
  *@example C3 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C7
    *block_line_arg
    *block_line_arg
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    *block_line_arg
    *block_line_arg
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument:  }
    *block_line_arg
    *block_line_arg
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
   *preformatted C1
    {example with empty args with spaces\\n}
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
  *@example C3 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C7
    *block_line_arg
    *block_line_arg
    *block_line_arg
    *block_line_arg C1
     {nonempty}
    *block_line_arg
    *block_line_arg
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C1
    {example with empty and non empty args mix\\n}
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
';


$result_texis{'example_empty_arguments'} = '@example ,,,,,,
example with empty args
@end example

@example , ,,  ,,, 
example with empty args with spaces
@end example

@example ,,,nonempty,,,
example with empty and non empty args mix
@end example
';


$result_texts{'example_empty_arguments'} = 'example with empty args

example with empty args with spaces

example with empty and non empty args mix
';

$result_errors{'example_empty_arguments'} = '';

$result_nodes_list{'example_empty_arguments'} = '';

$result_sections_list{'example_empty_arguments'} = '';

$result_sectioning_root{'example_empty_arguments'} = '';

$result_headings_list{'example_empty_arguments'} = '';


$result_converted{'plaintext'}->{'example_empty_arguments'} = '     example with empty args

     example with empty args with spaces

     example with empty and non empty args mix
';


$result_converted{'html'}->{'example_empty_arguments'} = '<!DOCTYPE html>
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
<pre class="example-preformatted">example with empty args
</pre></div>

<div class="example">
<pre class="example-preformatted">example with empty args with spaces
</pre></div>

<div class="example user-nonempty">
<pre class="example-preformatted">example with empty and non empty args mix
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'example_empty_arguments'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'example_empty_arguments'} = '<screen>example with empty args
</screen>
<screen>example with empty args with spaces
</screen>
<screen>example with empty and non empty args mix
</screen>';


$result_converted{'xml'}->{'example_empty_arguments'} = '<example spaces=" " endspaces=" "><examplearg></examplearg><examplearg></examplearg><examplearg></examplearg><examplearg></examplearg><examplearg></examplearg><examplearg></examplearg>
<pre xml:space="preserve">example with empty args
</pre></example>

<example spaces=" " endspaces=" "><examplearg spaces=" "></examplearg><examplearg></examplearg><examplearg spaces="  "></examplearg><examplearg></examplearg><examplearg></examplearg><examplearg> </examplearg>
<pre xml:space="preserve">example with empty args with spaces
</pre></example>

<example spaces=" " endspaces=" "><examplearg></examplearg><examplearg></examplearg><examplearg>nonempty</examplearg><examplearg></examplearg><examplearg></examplearg><examplearg></examplearg>
<pre xml:space="preserve">example with empty and non empty args mix
</pre></example>
';


$result_converted{'latex_text'}->{'example_empty_arguments'} = '\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily example with empty args
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily example with empty args with spaces
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily example with empty and non empty args mix
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
