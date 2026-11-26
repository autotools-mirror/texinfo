use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'begin_conditional_in_linemacro'} = '*document_root C1
 *before_node_section C4
  *preamble C2
   *normal_command@linemacro C3 l1
   |formal_args:A{a}
   |macro_name:{lm}
    *arguments_line C1
     {macro_line: lm {a}\\n}
    {raw:b \\a\\ a\\n}
    *normal_command@end C1 l3
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:b \\n}
   >SOURCEMARKS
   >linemacro_expansion<start;1>
    >*linemacro_call@lm C1
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{bracketed_linemacro_arg:\\n@ifset}
   >ignored_conditional_block<1><p:3>
    >*normal_command@ifset C3 l6:@lm
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a}
       >>SOURCEMARKS
       >>linemacro_expansion<end;1><p:1>
       >{spaces_after_argument:\\n}
     >{raw:in ifset\\n}
     >*normal_command@end C1 l8
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:b \\n}
   >SOURCEMARKS
   >linemacro_expansion<start;2>
    >*linemacro_call@lm C1
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{bracketed_linemacro_arg:\\n@ifclear}
   >expanded_conditional_command<start;1><p:3>
    >*normal_command@ifclear C1 l11:@lm
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a}
       >>SOURCEMARKS
       >>linemacro_expansion<end;2><p:1>
       >{spaces_after_argument:\\n}
   {normal_text:in ifclear\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:11>
    >*normal_command@end C1 l13
    >|text_arg:{ifclear}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifclear}
      >{spaces_after_argument:\\n}
';


$result_texis{'begin_conditional_in_linemacro'} = '@linemacro lm {a}
b \\a\\ a
@end linemacro

b 

b 
in ifclear
';


$result_texts{'begin_conditional_in_linemacro'} = '
b 

b 
in ifclear
';

$result_errors{'begin_conditional_in_linemacro'} = '';

$result_nodes_list{'begin_conditional_in_linemacro'} = '';

$result_sections_list{'begin_conditional_in_linemacro'} = '';

$result_sectioning_root{'begin_conditional_in_linemacro'} = '';

$result_headings_list{'begin_conditional_in_linemacro'} = '';

1;
