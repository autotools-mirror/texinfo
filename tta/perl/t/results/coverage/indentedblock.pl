use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'indentedblock'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@indentedblock C6 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {spaces_before_paragraph:  }
   *paragraph C1
    {normal_text:indented block\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:Text\\n}
   *normal_command@end C1 l5
   |text_arg:{indentedblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:indentedblock}
     {spaces_after_argument:\\n}
';


$result_texis{'indentedblock'} = '@indentedblock
  indented block

Text
@end indentedblock
';


$result_texts{'indentedblock'} = 'indented block

Text
';

$result_errors{'indentedblock'} = '';

$result_nodes_list{'indentedblock'} = '';

$result_sections_list{'indentedblock'} = '';

$result_sectioning_root{'indentedblock'} = '';

$result_headings_list{'indentedblock'} = '';


$result_converted{'plaintext'}->{'indentedblock'} = '     indented block

     Text
';


$result_converted{'html_text'}->{'indentedblock'} = '<blockquote class="indentedblock">
<p>indented block
</p>
<p>Text
</p></blockquote>
';


$result_converted{'xml'}->{'indentedblock'} = '<indentedblock endspaces=" ">
  <para>indented block
</para>
<para>Text
</para></indentedblock>
';


$result_converted{'latex_text'}->{'indentedblock'} = '\\begin{document}
\\begin{Texinfoindented}
  indented block

Text
\\end{Texinfoindented}
';


$result_converted{'docbook'}->{'indentedblock'} = '<blockquote role="indentedblock"><para>indented block
</para>
<para>Text
</para></blockquote>';

1;
