use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'caption_in_example'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@float C4 l1
  |EXTRA
  |float_type:{float}
  |global_command_number:{1}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@example C6 l3
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C2
     {normal_text:in example \\n}
     {empty_line:\\n}
    *normal_command@caption C1 l6
     *brace_command_context C1
      *paragraph C1
       {normal_text:caption}
    {spaces_after_close_brace:}
    *preformatted C3
     {normal_text:\\n}
     {empty_line:\\n}
     {normal_text:After caption\\n}
    *normal_command@end C1 l9
    |EXTRA
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l10
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
';


$result_texis{'caption_in_example'} = '@float float

@example
in example 

@caption{caption}

After caption
@end example
@end float
';


$result_texts{'caption_in_example'} = 'float

in example 



After caption
';

$result_errors{'caption_in_example'} = '* W l6|@caption should be right below `@float\'
 warning: @caption should be right below `@float\'

';

$result_floats{'caption_in_example'} = 'float: 1
 F
';

$result_nodes_list{'caption_in_example'} = '';

$result_sections_list{'caption_in_example'} = '';

$result_sectioning_root{'caption_in_example'} = '';

$result_headings_list{'caption_in_example'} = '';


$result_converted{'plaintext'}->{'caption_in_example'} = '     in example



     After caption

float
';


$result_converted{'html'}->{'caption_in_example'} = '<!DOCTYPE html>
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
<div class="float">

<div class="example">
<pre class="example-preformatted">in example 

</pre><pre class="example-preformatted">


After caption
</pre></div>
<div class="type-number-float"><p><strong class="strong">float</strong></p></div></div>


</body>
</html>
';

$result_converted_errors{'html'}->{'caption_in_example'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'caption_in_example'} = '
<screen>in example 

</screen><screen>

After caption
</screen>';


$result_converted{'xml'}->{'caption_in_example'} = '<float type="float" endspaces=" "><floattype> float</floattype>

<example endspaces=" ">
<pre xml:space="preserve">in example 

</pre><caption><para>caption</para></caption><pre xml:space="preserve">

After caption
</pre></example>
</float>
';


$result_converted{'latex_text'}->{'caption_in_example'} = '\\begin{document}
\\begin{TexinfoFloatfloat}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in example 

\\end{Texinfopreformatted}
\\begin{Texinfopreformatted}%
\\ttfamily 

After caption
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{TexinfoFloatfloat}
';

1;
