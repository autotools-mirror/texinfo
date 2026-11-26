use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'end_conditional_in_linemacro'} = '*document_root C1
 *before_node_section C4
  *preamble C2
   *normal_command@linemacro C3 l1
   |formal_args:A{a}
   |macro_name:{lm}
    *arguments_line C1
     {macro_line: lm {a}\\n}
    {raw:\\a\\\\n}
    *normal_command@end C1 l3
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*normal_command@ifclear C1 l5
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:aa}
       >{spaces_after_argument:\\n}
  *paragraph C2
   {normal_text:text\\n}
   >SOURCEMARKS
   >linemacro_expansion<start;1>
    >*linemacro_call@lm C1
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{bracketed_linemacro_arg:text\\n  @end ifclear}
   {normal_text:  }
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:2>
    >*normal_command@end C1 l7:@lm
    >|text_arg:{ifclear}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifclear}
      >>SOURCEMARKS
      >>linemacro_expansion<end;1><p:7>
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*normal_command@ifset C3 l9
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:b}
      >{spaces_after_argument:\\n}
    >{raw:@lm {text\\n}
    >*normal_command@end C1 l11
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'end_conditional_in_linemacro'} = '@linemacro lm {a}
\\a\\
@end linemacro

text
  

';


$result_texts{'end_conditional_in_linemacro'} = '
text
  

';

$result_errors{'end_conditional_in_linemacro'} = '* E l11|misplaced }
 misplaced }

';

$result_nodes_list{'end_conditional_in_linemacro'} = '';

$result_sections_list{'end_conditional_in_linemacro'} = '';

$result_sectioning_root{'end_conditional_in_linemacro'} = '';

$result_headings_list{'end_conditional_in_linemacro'} = '';

1;
