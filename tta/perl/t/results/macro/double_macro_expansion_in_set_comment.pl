use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_macro_expansion_in_set_comment'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C5
   *normal_command@macro C3 l1
   |formal_args:A{a}
   |macro_name:{mymac}
    *arguments_line C1
     {macro_line: mymac {a}\\n}
    {raw:@set flag \\a\\ @comment in \\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l5
   |formal_args:A{b}
   |macro_name:{callmymac}
    *arguments_line C1
     {macro_line: callmymac {b}\\n}
    {raw:@mymac{\\b\\} here\\n}
    *normal_command@end C1 l7
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:1>
    >*macro_call@callmymac C1
     >*brace_arg C1
      >{macro_call_arg_text:vv}
   >macro_expansion<start;2><p:1>
    >*macro_call@mymac C1
     >*brace_arg C1
      >{macro_call_arg_text:vv}
   *normal_command@set C1
   |misc_args:A{flag|vv}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:flag vv }
     *normal_command@comment C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:in  here after }
       >SOURCEMARKS
       >macro_expansion<end;2><p:3>
       >macro_expansion<end;1><p:8>
       {spaces_after_argument:\\n}
';


$result_texis{'double_macro_expansion_in_set_comment'} = '@macro mymac {a}
@set flag \\a\\ @comment in 
@end macro

@macro callmymac {b}
@mymac{\\b\\} here
@end macro

@set flag vv @comment in  here after 
';


$result_texts{'double_macro_expansion_in_set_comment'} = '

';

$result_errors{'double_macro_expansion_in_set_comment'} = '';

$result_nodes_list{'double_macro_expansion_in_set_comment'} = '';

$result_sections_list{'double_macro_expansion_in_set_comment'} = '';

$result_sectioning_root{'double_macro_expansion_in_set_comment'} = '';

$result_headings_list{'double_macro_expansion_in_set_comment'} = '';

1;
