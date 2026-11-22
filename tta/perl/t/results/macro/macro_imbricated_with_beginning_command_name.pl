use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_imbricated_with_beginning_command_name'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@macro C5 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{foo}
    *arguments_line C1
     {macro_line: foo\\n}
    {raw:\\n}
    {raw:@macrototo\\n}
    {raw:in macrototo\\n}
    *normal_command@end C1 l5
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
';


$result_texis{'macro_imbricated_with_beginning_command_name'} = '@macro foo

@macrototo
in macrototo
@end macro

';


$result_texts{'macro_imbricated_with_beginning_command_name'} = '
';

$result_errors{'macro_imbricated_with_beginning_command_name'} = '* E l7|unmatched `@end macro\'
 unmatched `@end macro\'

';

$result_nodes_list{'macro_imbricated_with_beginning_command_name'} = '';

$result_sections_list{'macro_imbricated_with_beginning_command_name'} = '';

$result_sectioning_root{'macro_imbricated_with_beginning_command_name'} = '';

$result_headings_list{'macro_imbricated_with_beginning_command_name'} = '';

1;
