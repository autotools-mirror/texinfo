use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_table'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@table C2 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l1
     {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_table'} = '@table @code
@end table
';


$result_texts{'empty_table'} = '';

$result_errors{'empty_table'} = '';

$result_nodes_list{'empty_table'} = '';

$result_sections_list{'empty_table'} = '';

$result_sectioning_root{'empty_table'} = '';

$result_headings_list{'empty_table'} = '';


$result_converted{'plaintext'}->{'empty_table'} = '';


$result_converted{'html_text'}->{'empty_table'} = '';


$result_converted{'xml'}->{'empty_table'} = '<table commandarg="code" endspaces=" ">
</table>
';


$result_converted{'docbook'}->{'empty_table'} = '<variablelist></variablelist>';

1;
