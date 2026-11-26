use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_ifset_set'} = '*document_root C1
 *before_node_section C3
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C7
   *normal_command@set C1
   |misc_args:A{a|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:a}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l4
   |formal_args:A{}
   |macro_name:{truc}
    *arguments_line C1
     {macro_line: truc {}\\n}
    {raw:truc\\n}
    *normal_command@end C1 l6
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*normal_command@ifset C1 l8
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a}
       >{spaces_after_argument:\\n}
   *normal_command@unmacro C1
   |misc_args:A{truc}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:truc}
     {spaces_after_argument:\\n}
   *normal_command@macro C3 l10
   |formal_args:A{}
   |macro_name:{truc}
   >SOURCEMARKS
   >expanded_conditional_command<end;1>
    >*normal_command@end C1 l13
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
    *arguments_line C1
     {macro_line: truc{}\\n}
    {raw:in ifset\\n}
    *normal_command@end C1 l12
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:in ifset\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@truc C1
     >*brace_arg
   >macro_expansion<end;1><p:8>
';


$result_texis{'macro_in_ifset_set'} = '
@set a

@macro truc {}
truc
@end macro

@unmacro truc
@macro truc{}
in ifset
@end macro

in ifset
';


$result_texts{'macro_in_ifset_set'} = '


in ifset
';

$result_errors{'macro_in_ifset_set'} = '';

$result_nodes_list{'macro_in_ifset_set'} = '';

$result_sections_list{'macro_in_ifset_set'} = '';

$result_sectioning_root{'macro_in_ifset_set'} = '';

$result_headings_list{'macro_in_ifset_set'} = '';

1;
