use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ifclear_in_macro'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content C2
   *normal_command@macro C5 l1
   |formal_args:A{arg}
   |macro_name:{note}
    *arguments_line C1
     {macro_line: note {arg}\\n}
    {raw:@ifclear notes \\n}
    {raw:\\arg\\\\n}
    {raw:@end ifclear\\n}
    *normal_command@end C1 l5
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:1>
    >*macro_call@note C1
     >*brace_arg C2
      >{spaces_before_argument:\\n}
      >{macro_call_arg_text:arg\\n}
   >expanded_conditional_command<start;1><p:1>
    >*normal_command@ifclear C1 l9:@note
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:notes}
       >{spaces_after_argument: \\n}
  *paragraph C1
   {normal_text:arg\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<end;1><p:1>
   >*normal_command@end C1 l9:@note
   >|text_arg:{ifclear}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:ifclear}
     >>SOURCEMARKS
     >>macro_expansion<end;1><p:7>
     >{spaces_after_argument:\\n}
';


$result_texis{'ifclear_in_macro'} = '@macro note {arg}
@ifclear notes 
\\arg\\
@end ifclear
@end macro

arg

';


$result_texts{'ifclear_in_macro'} = '
arg

';

$result_errors{'ifclear_in_macro'} = '';

$result_nodes_list{'ifclear_in_macro'} = '';

$result_sections_list{'ifclear_in_macro'} = '';

$result_sectioning_root{'ifclear_in_macro'} = '';

$result_headings_list{'ifclear_in_macro'} = '';

1;
