use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_expansion_end_in_conditional_end'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *normal_command@macro C5 l1
   |formal_args:A{}
   |macro_name:{beginendcond}
    *arguments_line C1
     {macro_line: beginendcond\\n}
    {raw:@ifset flag\\n}
    {raw:Defined\\n}
    {raw:@end if\\n}
    *normal_command@end C1 l5
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@set C1
   |misc_args:A{flag|1}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:flag 1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:1>
    >*macro_call@beginendcond C1
     >*brace_arg
   >expanded_conditional_command<start;1><p:1>
    >*normal_command@ifset C1 l9:@beginendcond
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:flag}
       >{spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Defined\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:8>
    >*normal_command@end C1 l9:@beginendcond
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >>SOURCEMARKS
      >>macro_expansion<end;1><p:2>
      >{spaces_after_argument:\\n}
';


$result_texis{'macro_expansion_end_in_conditional_end'} = '@macro beginendcond
@ifset flag
Defined
@end if
@end macro

@set flag 1

Defined
';


$result_texts{'macro_expansion_end_in_conditional_end'} = '

Defined
';

$result_errors{'macro_expansion_end_in_conditional_end'} = '';

$result_nodes_list{'macro_expansion_end_in_conditional_end'} = '';

$result_sections_list{'macro_expansion_end_in_conditional_end'} = '';

$result_sectioning_root{'macro_expansion_end_in_conditional_end'} = '';

$result_headings_list{'macro_expansion_end_in_conditional_end'} = '';

1;
