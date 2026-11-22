use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'raw_in_example'} = '*document_root C1
 *before_node_section C5
  *preamble_before_content
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    *normal_command@html C3 l2
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *rawpreformatted C1
      {normal_text:in html\\n}
     *normal_command@end C1 l4
     |text_arg:{html}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:html}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l5
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C5
    {empty_line:\\n}
    *normal_command@html C3 l9
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *rawpreformatted C3
      {empty_line:\\n}
      {normal_text:Some html <code>some code</code>.\\n}
      {empty_line:\\n}
     *normal_command@end C1 l13
     |text_arg:{html}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:html}
       {spaces_after_argument:\\n}
    {empty_line:\\n}
    *normal_command@tex C3 l15
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *rawpreformatted C7
      {empty_line:\\n}
      {normal_text:$$ \\n}
      {normal_text:\\chi^2 = \\sum_{i=1}^N\\n}
      {normal_text:\\left(y_i - (a + b x_i)\\n}
      {normal_text:\\over \\sigma_i\\right)^2 \\n}
      {normal_text:$$\\n}
      {empty_line:\\n}
     *normal_command@end C1 l23
     |text_arg:{tex}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:tex}
       {spaces_after_argument:\\n}
    {empty_line:\\n}
   *normal_command@end C1 l25
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'raw_in_example'} = '@example
@html
in html
@end html
@end example

@example

@html

Some html <code>some code</code>.

@end html

@tex

$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$

@end tex

@end example

';


$result_texts{'raw_in_example'} = 'in html



Some html <code>some code</code>.



$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$



';

$result_errors{'raw_in_example'} = '';

$result_nodes_list{'raw_in_example'} = '';

$result_sections_list{'raw_in_example'} = '';

$result_sectioning_root{'raw_in_example'} = '';

$result_headings_list{'raw_in_example'} = '';


$result_converted{'plaintext'}->{'raw_in_example'} = '


';


$result_converted{'xml'}->{'raw_in_example'} = '<example endspaces=" ">
<pre xml:space="preserve"><html endspaces=" ">
in html
</html>
</pre></example>

<example endspaces=" ">
<pre xml:space="preserve">
<html endspaces=" ">

Some html &lt;code&gt;some code&lt;/code&gt;.

</html>

<tex endspaces=" ">

$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$

</tex>

</pre></example>

';


$result_converted{'html_text'}->{'raw_in_example'} = '<div class="example">
<pre class="example-preformatted">in html
</pre></div>

<div class="example">
<pre class="example-preformatted">


Some html <code>some code</code>.



</pre></div>

';

1;
