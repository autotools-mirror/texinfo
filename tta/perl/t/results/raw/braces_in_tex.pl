use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'braces_in_tex'} = '*document_root C1
 *before_node_section C4
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C3
   *normal_command@tex C3 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C5
     {normal_text:$$ \\n}
     {normal_text:\\chi^2 = \\sum_{i=1}^N\\n}
     {normal_text:\\left(y_i - (a + b x_i)\\n}
     {normal_text:\\over \\sigma_i\\right)^2 \\n}
     {normal_text:$$\\n}
    *normal_command@end C1 l8
    |text_arg:{tex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
  *normal_command@example C3 l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    *normal_command@tex C3 l12
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *rawpreformatted C5
      {normal_text:$$ \\n}
      {normal_text:\\chi^2 = \\sum_{i=1}^N\\n}
      {normal_text:\\left(y_i - (a + b x_i)\\n}
      {normal_text:\\over \\sigma_i\\right)^2 \\n}
      {normal_text:$$\\n}
     *normal_command@end C1 l18
     |text_arg:{tex}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:tex}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l19
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'braces_in_tex'} = '
@tex
$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$
@end tex


@example
@tex
$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$
@end tex
@end example

';


$result_texts{'braces_in_tex'} = '$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$


$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$

';

$result_errors{'braces_in_tex'} = '';

$result_nodes_list{'braces_in_tex'} = '';

$result_sections_list{'braces_in_tex'} = '';

$result_sectioning_root{'braces_in_tex'} = '';

$result_headings_list{'braces_in_tex'} = '';


$result_converted{'plaintext'}->{'braces_in_tex'} = '';


$result_converted{'xml'}->{'braces_in_tex'} = '<preamblebeforebeginning>
</preamblebeforebeginning><tex endspaces=" ">
$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$
</tex>


<example endspaces=" ">
<pre xml:space="preserve"><tex endspaces=" ">
$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$
</tex>
</pre></example>

';

1;
