use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_macro_no_arg'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C5
   *normal_command@macro C2 l1
   |formal_args:A{}
   |macro_name:{foo}
    *arguments_line C1
     {macro_line: foo\\n}
    *normal_command@end C1 l2
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@foo
   >macro_expansion<end;1>
   {empty_line:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@foo C1
     >*brace_arg
   >macro_expansion<end;2>
';


$result_texis{'empty_macro_no_arg'} = '@macro foo
@end macro




';


$result_texts{'empty_macro_no_arg'} = '



';

$result_errors{'empty_macro_no_arg'} = '';

$result_nodes_list{'empty_macro_no_arg'} = '';

$result_sections_list{'empty_macro_no_arg'} = '';

$result_sectioning_root{'empty_macro_no_arg'} = '';

$result_headings_list{'empty_macro_no_arg'} = '';

1;
