use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_macro_arg'} = '*document_root C1
 *before_node_section C3
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C6
   *@macro C3 l2
   |EXTRA
   |formal_args:A{}
   |macro_name:{macroone}
    *arguments_line C1
     {macro_line: macroone\\n}
    {raw:a, @macrotwo\\n}
    *@end C1 l4
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@macro C3 l6
   |EXTRA
   |formal_args:A{arg}
   |macro_name:{macrotwo}
    *arguments_line C1
     {macro_line: macrotwo{arg}\\n}
    {raw:hello \\arg\\ after arg\\n}
    *@end C1 l8
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@macro C4 l10
   |EXTRA
   |formal_args:A{text|arg}
   |macro_name:{macrothree}
    *arguments_line C1
     {macro_line: macrothree{text, arg}\\n}
    {raw:\\text\\\\n}
    {raw:&&&& \\arg\\\\n}
    *@end C1 l13
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   {normal_text:a, hello text for macro2 after arg\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@macrothree C1
     >*brace_arg C1
      >{macro_call_arg_text:@macroone{}text for macro2}
   >macro_expansion<start;2>
    >*macro_call@macroone C1
     >*brace_arg
   >macro_expansion<start;3><p:3>
    >*macro_call_line@macrotwo C1
     >*line_arg C1
      >{normal_text:text for macro2}
      >>SOURCEMARKS
      >>macro_expansion<end;2>
   >macro_expansion<end;3><p:34>
   {normal_text:&&&& \\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:5>
';


$result_texis{'macro_in_macro_arg'} = '
@macro macroone
a, @macrotwo
@end macro

@macro macrotwo{arg}
hello \\arg\\ after arg
@end macro

@macro macrothree{text, arg}
\\text\\
&&&& \\arg\\
@end macro

a, hello text for macro2 after arg
&&&& 
';


$result_texts{'macro_in_macro_arg'} = '


a, hello text for macro2 after arg
&&&& 
';

$result_errors{'macro_in_macro_arg'} = '';

$result_nodes_list{'macro_in_macro_arg'} = '';

$result_sections_list{'macro_in_macro_arg'} = '';

$result_sectioning_root{'macro_in_macro_arg'} = '';

$result_headings_list{'macro_in_macro_arg'} = '';

1;
