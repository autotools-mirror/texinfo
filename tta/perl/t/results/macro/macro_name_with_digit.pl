use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_name_with_digit'} = '*document_root C1
 *before_node_section C2
  *preamble C4
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{macro1}
    *arguments_line C1
     {macro_line: macro1\\n}
    {raw:macro1\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l5
   |formal_args:A{arg}
   |macro_name:{macro11}
    *arguments_line C1
     {macro_line: macro11 {arg}\\n}
    {raw:expand \\arg\\\\n}
    *normal_command@end C1 l7
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:expand some thing macro1\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call_line@macro11 C1
     >*line_arg C2
      >{spaces_before_argument: }
      >{normal_text:some thing @macro1{}}
   >macro_expansion<start;2><p:18>
    >*macro_call@macro1 C1
     >*brace_arg
   >macro_expansion<end;2><p:24>
   >macro_expansion<end;1><p:24>
';


$result_texis{'macro_name_with_digit'} = '@macro macro1
macro1
@end macro

@macro macro11 {arg}
expand \\arg\\
@end macro

expand some thing macro1
';


$result_texts{'macro_name_with_digit'} = '

expand some thing macro1
';

$result_errors{'macro_name_with_digit'} = '';

$result_nodes_list{'macro_name_with_digit'} = '';

$result_sections_list{'macro_name_with_digit'} = '';

$result_sectioning_root{'macro_name_with_digit'} = '';

$result_headings_list{'macro_name_with_digit'} = '';

1;
