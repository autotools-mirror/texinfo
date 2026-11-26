use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_expansion_end_in_ignored_nested_different_conditional'} = '*document_root C1
 *before_node_section C1
  *preamble C2
   *normal_command@macro C5 l1
   |formal_args:A{}
   |macro_name:{beginnestedcond}
    *arguments_line C1
     {macro_line: beginnestedcond\\n}
    {raw:@ifset a\\n}
    {raw:@ifclear b\\n}
    {raw:GG\\n}
    *normal_command@end C1 l5
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:1>
    >*macro_call@beginnestedcond C1
     >*brace_arg
   >ignored_conditional_block<1><p:1>
    >*normal_command@ifset C5 l7:@beginnestedcond
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a}
       >{spaces_after_argument:\\n}
     >{raw:@ifclear b\\n}
     >{raw:GG}
     >>SOURCEMARKS
     >>macro_expansion<end;1><p:2>
     >{raw:\\n}
     >*normal_command@end C1 l8
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
';


$result_texis{'macro_expansion_end_in_ignored_nested_different_conditional'} = '@macro beginnestedcond
@ifset a
@ifclear b
GG
@end macro

';


$result_texts{'macro_expansion_end_in_ignored_nested_different_conditional'} = '
';

$result_errors{'macro_expansion_end_in_ignored_nested_different_conditional'} = '* E l9|unmatched `@end ifclear\'
 unmatched `@end ifclear\'

';

$result_nodes_list{'macro_expansion_end_in_ignored_nested_different_conditional'} = '';

$result_sections_list{'macro_expansion_end_in_ignored_nested_different_conditional'} = '';

$result_sectioning_root{'macro_expansion_end_in_ignored_nested_different_conditional'} = '';

$result_headings_list{'macro_expansion_end_in_ignored_nested_different_conditional'} = '';

1;
