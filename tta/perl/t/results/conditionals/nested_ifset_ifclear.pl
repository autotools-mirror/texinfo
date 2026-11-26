use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_ifset_ifclear'} = '*document_root C1
 *before_node_section C13
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C4
   *normal_command@macro C10 l2
   |formal_args:A{}
   |macro_name:{conditionals}
    *arguments_line C1
     {macro_line: conditionals{}\\n}
    {raw:@ifset somevar\\n}
    {raw:@ifset anothervar\\n}
    {raw:Both somevar and anothervar are set.\\n}
    {raw:@end ifset\\n}
    {raw:@ifclear anothervar\\n}
    {raw:Somevar is set, anothervar is not.\\n}
    {raw:@end ifclear\\n}
    {raw:@end ifset\\n}
    *normal_command@end C1 l11
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@set C1
   |misc_args:A{somevar|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:somevar}
     {spaces_after_argument:\\n}
   *normal_command@set C1
   |misc_args:A{anothervar|}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@conditionals C1
     >*brace_arg
   >expanded_conditional_command<start;1>
    >*normal_command@ifset C1 l15:@conditionals
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:somevar}
       >{spaces_after_argument:\\n}
   >expanded_conditional_command<start;2>
    >*normal_command@ifset C1 l15:@conditionals
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:anothervar}
       >{spaces_after_argument:\\n}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:anothervar}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Both somevar and anothervar are set.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:37>
    >*normal_command@end C1 l15:@conditionals
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
   >ignored_conditional_block<1><p:37>
    >*normal_command@ifclear C3 l15:@conditionals
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:anothervar}
       >{spaces_after_argument:\\n}
     >{raw:Somevar is set, anothervar is not.\\n}
     >*normal_command@end C1 l15:@conditionals
     >|text_arg:{ifclear}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifclear}
       >{spaces_after_argument:\\n}
   >expanded_conditional_command<end;1><p:37>
    >*normal_command@end C1 l15:@conditionals
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >>SOURCEMARKS
      >>macro_expansion<end;1><p:5>
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@set C1
  |misc_args:A{somevar|}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:somevar}
    {spaces_after_argument:\\n}
  *normal_command@clear C1
  |misc_args:A{anothervar}
  >SOURCEMARKS
  >macro_expansion<start;2>
   >*macro_call@conditionals C1
    >*brace_arg
  >expanded_conditional_command<start;3>
   >*normal_command@ifset C1 l19:@conditionals
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:somevar}
      >{spaces_after_argument:\\n}
  >ignored_conditional_block<2>
   >*normal_command@ifset C3 l19:@conditionals
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:anothervar}
      >{spaces_after_argument:\\n}
    >{raw:Both somevar and anothervar are set.\\n}
    >*normal_command@end C1 l19:@conditionals
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  >expanded_conditional_command<start;4>
   >*normal_command@ifclear C1 l19:@conditionals
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:anothervar}
      >{spaces_after_argument:\\n}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:anothervar}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Somevar is set, anothervar is not.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;4><p:35>
    >*normal_command@end C1 l19:@conditionals
    >|text_arg:{ifclear}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifclear}
      >{spaces_after_argument:\\n}
   >expanded_conditional_command<end;3><p:35>
    >*normal_command@end C1 l19:@conditionals
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >>SOURCEMARKS
      >>macro_expansion<end;2><p:5>
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@clear C1
  |misc_args:A{somevar}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:somevar}
    {spaces_after_argument:\\n}
  *normal_command@set C1
  |misc_args:A{anothervar|}
  >SOURCEMARKS
  >macro_expansion<start;3>
   >*macro_call@conditionals C1
    >*brace_arg
  >ignored_conditional_block<3>
   >*normal_command@ifset C8 l23:@conditionals
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:somevar}
      >{spaces_after_argument:\\n}
    >{raw:@ifset anothervar\\n}
    >{raw:Both somevar and anothervar are set.\\n}
    >{raw:@end ifset\\n}
    >{raw:@ifclear anothervar\\n}
    >{raw:Somevar is set, anothervar is not.\\n}
    >{raw:@end ifclear\\n}
    >*normal_command@end C1 l23:@conditionals
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >>SOURCEMARKS
      >>macro_expansion<end;3><p:5>
      >{spaces_after_argument:\\n}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:anothervar}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@clear C1
  |misc_args:A{somevar}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:somevar}
    {spaces_after_argument:\\n}
  *normal_command@clear C1
  |misc_args:A{anothervar}
  >SOURCEMARKS
  >macro_expansion<start;4>
   >*macro_call@conditionals C1
    >*brace_arg
  >ignored_conditional_block<4>
   >*normal_command@ifset C8 l27:@conditionals
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:somevar}
      >{spaces_after_argument:\\n}
    >{raw:@ifset anothervar\\n}
    >{raw:Both somevar and anothervar are set.\\n}
    >{raw:@end ifset\\n}
    >{raw:@ifclear anothervar\\n}
    >{raw:Somevar is set, anothervar is not.\\n}
    >{raw:@end ifclear\\n}
    >*normal_command@end C1 l27:@conditionals
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >>SOURCEMARKS
      >>macro_expansion<end;4><p:5>
      >{spaces_after_argument:\\n}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:anothervar}
    {spaces_after_argument:\\n}
';


$result_texis{'nested_ifset_ifclear'} = '
@macro conditionals{}
@ifset somevar
@ifset anothervar
Both somevar and anothervar are set.
@end ifset
@ifclear anothervar
Somevar is set, anothervar is not.
@end ifclear
@end ifset
@end macro

@set somevar
@set anothervar
Both somevar and anothervar are set.

@set somevar
@clear anothervar
Somevar is set, anothervar is not.

@clear somevar
@set anothervar

@clear somevar
@clear anothervar
';


$result_texts{'nested_ifset_ifclear'} = '
Both somevar and anothervar are set.

Somevar is set, anothervar is not.


';

$result_errors{'nested_ifset_ifclear'} = '';

$result_nodes_list{'nested_ifset_ifclear'} = '';

$result_sections_list{'nested_ifset_ifclear'} = '';

$result_sectioning_root{'nested_ifset_ifclear'} = '';

$result_headings_list{'nested_ifset_ifclear'} = '';

1;
