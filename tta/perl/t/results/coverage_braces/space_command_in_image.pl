use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'space_command_in_image'} = '*document_root C1
 *before_node_section C4
  *preamble
  *normal_command@image C4 l1
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:f--ile}
   *brace_arg
   *brace_arg
   *brace_arg C1
    *normal_command@ 
  {normal_text: }
  *normal_command@image C4 l1
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:f--ile}
   *brace_arg
   *brace_arg
   *brace_arg C1
    *normal_command@:
';


$result_texis{'space_command_in_image'} = '@image{f--ile,,,@ } @image{f--ile,,,@:}';


$result_texts{'space_command_in_image'} = 'f--ile f--ile';

$result_errors{'space_command_in_image'} = '';

$result_nodes_list{'space_command_in_image'} = '';

$result_sections_list{'space_command_in_image'} = '';

$result_sectioning_root{'space_command_in_image'} = '';

$result_headings_list{'space_command_in_image'} = '';


$result_converted{'plaintext'}->{'space_command_in_image'} = 'Image description""\\. Image description""\\.
';


$result_converted{'html_text'}->{'space_command_in_image'} = '<img class="image" src="f--ile.png" alt="&nbsp;"> <img class="image" src="f--ile.png" alt="f--ile">';


$result_converted{'latex_text'}->{'space_command_in_image'} = '\\begin{document}
\\includegraphics{f--ile} \\includegraphics{f--ile}';


$result_converted{'docbook'}->{'space_command_in_image'} = '<informalfigure><mediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></mediaobject></informalfigure> <informalfigure><mediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></mediaobject></informalfigure>';

1;
