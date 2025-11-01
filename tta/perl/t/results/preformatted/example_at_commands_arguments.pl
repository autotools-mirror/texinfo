use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'example_at_commands_arguments'} = '*document_root C1
 *before_node_section C1
  *@example C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C3
    *block_line_arg C13
     {some  thing }
     *@^ C1 l1
      *following_arg C1
       {e}
     { }
     *@TeX C1 l1
      *brace_container
     { }
     *@exclamdown C1 l1
      *brace_container
     { }
     *@code C1 l1
      *brace_container C1
       {---}
     { }
     *@enddots C1 l1
      *brace_container
     { !_- _---_ < " & }
     *@ 
     *@comma C1 l1
      *brace_container
    *block_line_arg C1
     *@@
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {0}
   *preformatted C3
    {example with }
    *@@
    {-commands and other special characters\\n}
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
';


$result_texis{'example_at_commands_arguments'} = '@example some  thing @^e @TeX{} @exclamdown{} @code{---} @enddots{} !_- _---_ < " & @ @comma{},@@,0
example with @@-commands and other special characters
@end example
';


$result_texts{'example_at_commands_arguments'} = 'example with @-commands and other special characters
';

$result_errors{'example_at_commands_arguments'} = '';

$result_nodes_list{'example_at_commands_arguments'} = '';

$result_sections_list{'example_at_commands_arguments'} = '';

$result_sectioning_root{'example_at_commands_arguments'} = '';

$result_headings_list{'example_at_commands_arguments'} = '';


$result_converted{'plaintext'}->{'example_at_commands_arguments'} = '     example with @-commands and other special characters
';


$result_converted{'html'}->{'example_at_commands_arguments'} = '<!DOCTYPE html>
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
<div class="example user-some-thing-ê-TeX-¡-----...-!_--_---_-&lt;-&quot;-&amp;--, user-@ user-0">
<pre class="example-preformatted">example with @-commands and other special characters
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'example_at_commands_arguments'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'docbook'}->{'example_at_commands_arguments'} = '<screen>example with @-commands and other special characters
</screen>';


$result_converted{'xml'}->{'example_at_commands_arguments'} = '<example spaces=" " endspaces=" "><examplelanguage>some  thing <accent type="circ" bracketed="off">e</accent> &tex; &iexcl; <code>---</code> &enddots; !_- _&textmdash;_ &lt; &quot; &amp; <spacecmd type="spc"/>&comma;</examplelanguage><examplearg>&arobase;</examplearg><examplearg>0</examplearg>
<pre xml:space="preserve">example with &arobase;-commands and other special characters
</pre></example>
';


$result_converted{'latex_text'}->{'example_at_commands_arguments'} = '\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily example with @-commands and other special characters
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
