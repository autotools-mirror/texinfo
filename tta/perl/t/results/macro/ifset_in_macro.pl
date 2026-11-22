use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ifset_in_macro'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@macro C5 l1
   |EXTRA
   |formal_args:A{arg}
   |macro_name:{note}
    *arguments_line C1
     {macro_line: note {arg}\\n}
    {raw:@ifset notes \\n}
    {raw:\\arg\\\\n}
    {raw:@end ifset\\n}
    *normal_command@end C1 l5
    |EXTRA
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
   >ignored_conditional_block<1><p:1>
    >*normal_command@ifset C4 l9:@note
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:notes}
       >{spaces_after_argument: \\n}
     >{raw:arg\\n}
     >{raw:\\n}
     >*normal_command@end C1 l9:@note
     >|EXTRA
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >>SOURCEMARKS
       >>macro_expansion<end;1><p:5>
       >{spaces_after_argument:\\n}
';


$result_texis{'ifset_in_macro'} = '@macro note {arg}
@ifset notes 
\\arg\\
@end ifset
@end macro

';


$result_texts{'ifset_in_macro'} = '
';

$result_errors{'ifset_in_macro'} = '';

$result_nodes_list{'ifset_in_macro'} = '';

$result_sections_list{'ifset_in_macro'} = '';

$result_sectioning_root{'ifset_in_macro'} = '';

$result_headings_list{'ifset_in_macro'} = '';

1;
