use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'implicit_quoting_one_arg'} = '*document_root C1
 *before_node_section C3
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@macro C3 l2
   |formal_args:A{a}
   |macro_name:{FIXAME}
    *arguments_line C1
     {macro_line: FIXAME{a}\\n}
    {raw:@strong{FIXAME: \\a\\}\\n}
    *normal_command@end C1 l4
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:1>
    >*macro_call@FIXAME C1
     >*brace_arg C1
      >{macro_call_arg_text:Many arguments, separated by commas, are processed here}
  *paragraph C2
   *normal_command@strong C1 l6:@FIXAME
   >SOURCEMARKS
   >macro_expansion<end;1>
    *brace_container C1
     {normal_text:FIXAME: Many arguments, separated by commas, are processed here}
   {normal_text:\\n}
';


$result_texis{'implicit_quoting_one_arg'} = '
@macro FIXAME{a}
@strong{FIXAME: \\a\\}
@end macro

@strong{FIXAME: Many arguments, separated by commas, are processed here}
';


$result_texts{'implicit_quoting_one_arg'} = '
FIXAME: Many arguments, separated by commas, are processed here
';

$result_errors{'implicit_quoting_one_arg'} = '';

$result_nodes_list{'implicit_quoting_one_arg'} = '';

$result_sections_list{'implicit_quoting_one_arg'} = '';

$result_sectioning_root{'implicit_quoting_one_arg'} = '';

$result_headings_list{'implicit_quoting_one_arg'} = '';

1;
