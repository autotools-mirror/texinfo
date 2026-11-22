use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_macro_expansion_in_set_arg_comment'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C5
   *@macro C3 l1
   |EXTRA
   |formal_args:A{a}
   |macro_name:{mymac}
    *arguments_line C1
     {macro_line: mymac {a}\\n}
    {raw:@set \\a\\ value\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@macro C3 l5
   |EXTRA
   |formal_args:A{b}
   |macro_name:{callmymac}
    *arguments_line C1
     {macro_line: callmymac {b}\\n}
    {raw:@mymac{\\b\\} alsov @comment in\\n}
    *@end C1 l7
    |EXTRA
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
      >{macro_call_arg_text:flag}
   >macro_expansion<start;2><p:1>
    >*macro_call@mymac C1
     >*brace_arg C1
      >{macro_call_arg_text:flag}
   *@set C1
   |EXTRA
   |misc_args:A{flag|value alsov}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:flag value alsov }
     >SOURCEMARKS
     >macro_expansion<end;2><p:10>
     *@comment C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:in after}
       >SOURCEMARKS
       >macro_expansion<end;1><p:2>
       {spaces_after_argument:\\n}
';


$result_texis{'double_macro_expansion_in_set_arg_comment'} = '@macro mymac {a}
@set \\a\\ value
@end macro

@macro callmymac {b}
@mymac{\\b\\} alsov @comment in
@end macro

@set flag value alsov @comment in after
';


$result_texts{'double_macro_expansion_in_set_arg_comment'} = '

';

$result_errors{'double_macro_expansion_in_set_arg_comment'} = '';

$result_nodes_list{'double_macro_expansion_in_set_arg_comment'} = '';

$result_sections_list{'double_macro_expansion_in_set_arg_comment'} = '';

$result_sectioning_root{'double_macro_expansion_in_set_arg_comment'} = '';

$result_headings_list{'double_macro_expansion_in_set_arg_comment'} = '';

1;
