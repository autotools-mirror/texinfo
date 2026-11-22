use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_macro_call'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *normal_command@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{machin}
    *arguments_line C1
     {macro_line: machin{}\\n}
    {raw:(machin)\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C4 l5
   |EXTRA
   |formal_args:A{}
   |macro_name:{truc}
    *arguments_line C1
     {macro_line: truc{}\\n}
    {raw:@machin{}\\n}
    {raw:\\n}
    *normal_command@end C1 l8
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   {normal_text:Before (machin)\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:7>
    >*macro_call@truc C1
     >*brace_arg
   >macro_expansion<start;2><p:7>
    >*macro_call@machin C1
     >*brace_arg
   >macro_expansion<end;2><p:15>
   >macro_expansion<end;1><p:16>
   {normal_text: after truc.\\n}
';


$result_texis{'nested_macro_call'} = '@macro machin{}
(machin)
@end macro

@macro truc{}
@machin{}

@end macro

Before (machin)
 after truc.
';


$result_texts{'nested_macro_call'} = '

Before (machin)
 after truc.
';

$result_errors{'nested_macro_call'} = '';

$result_nodes_list{'nested_macro_call'} = '';

$result_sections_list{'nested_macro_call'} = '';

$result_sectioning_root{'nested_macro_call'} = '';

$result_headings_list{'nested_macro_call'} = '';

1;
