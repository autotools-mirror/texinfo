use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_bracketed_no_inter_space_prototype'} = '*document_root C1
 *before_node_section C3
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *normal_command@multitable C2 l2
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *bracketed_arg C1 l2
      {normal_text:a}
     *bracketed_arg C1 l2
      {normal_text:b}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l3
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable_bracketed_no_inter_space_prototype'} = '
@multitable {a}{b}
@end multitable
';


$result_texts{'multitable_bracketed_no_inter_space_prototype'} = '';

$result_errors{'multitable_bracketed_no_inter_space_prototype'} = '';

$result_nodes_list{'multitable_bracketed_no_inter_space_prototype'} = '';

$result_sections_list{'multitable_bracketed_no_inter_space_prototype'} = '';

$result_sectioning_root{'multitable_bracketed_no_inter_space_prototype'} = '';

$result_headings_list{'multitable_bracketed_no_inter_space_prototype'} = '';

1;
