use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'float_in_style_command'} = '*document_root C1
 *before_node_section C3
  *preamble
  *paragraph C1
   *normal_command@code C1 l1
    *brace_container C1
     {normal_text:\\n}
  *normal_command@float C5 l2
  |float_number:{1}
  |float_type:{A}
  |global_command_number:{1}
  |identifier:{B}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:A}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:B}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:in float\\n}
   *normal_command@caption C1 l4
    *brace_command_context C1
     *paragraph C1
      {normal_text:Caption}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l5
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
';


$result_texis{'float_in_style_command'} = '@code{
}@float A, B
in float
@caption{Caption}
@end float
';


$result_texts{'float_in_style_command'} = '
A, B
in float
';

$result_errors{'float_in_style_command'} = '* E l1|@code missing closing brace
 @code missing closing brace

* E l6|misplaced }
 misplaced }

';

$result_floats{'float_in_style_command'} = 'A: 1
 F1: {B}
  C: Caption
';

$result_nodes_list{'float_in_style_command'} = '';

$result_sections_list{'float_in_style_command'} = '';

$result_sectioning_root{'float_in_style_command'} = '';

$result_headings_list{'float_in_style_command'} = '';

1;
