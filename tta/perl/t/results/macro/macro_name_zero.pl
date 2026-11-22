use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_name_zero'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{0}
    *arguments_line C1
     {macro_line: 0\\n}
    {raw:in macro\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:in macro:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@0
   >macro_expansion<end;1><p:8>
';


$result_texis{'macro_name_zero'} = '@macro 0
in macro
@end macro

in macro:
';


$result_texts{'macro_name_zero'} = '
in macro:
';

$result_errors{'macro_name_zero'} = '';

$result_nodes_list{'macro_name_zero'} = '';

$result_sections_list{'macro_name_zero'} = '';

$result_sectioning_root{'macro_name_zero'} = '';

$result_headings_list{'macro_name_zero'} = '';

1;
