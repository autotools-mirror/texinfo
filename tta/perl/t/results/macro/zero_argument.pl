use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'zero_argument'} = '*document_root C1
 *before_node_section C1
  *preamble C3
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{foo}
    *arguments_line C1
     {macro_line: foo {}\\n}
    {raw:in foo\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l5
   |formal_args:A{}
   |macro_name:{abar}
    *arguments_line C1
     {macro_line: abar\\n}
    {raw:in bar\\n}
    *normal_command@end C1 l7
    |text_arg:{macro}
     *line_arg C2
      {spaces_before_argument: }
      {normal_text:macro}
';


$result_texis{'zero_argument'} = '@macro foo {}
in foo
@end macro

@macro abar
in bar
@end macro';


$result_texts{'zero_argument'} = '
';

$result_errors{'zero_argument'} = '';

$result_nodes_list{'zero_argument'} = '';

$result_sections_list{'zero_argument'} = '';

$result_sectioning_root{'zero_argument'} = '';

$result_headings_list{'zero_argument'} = '';

1;
