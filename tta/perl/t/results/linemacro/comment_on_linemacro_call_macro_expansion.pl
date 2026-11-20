use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comment_on_linemacro_call_macro_expansion'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *@linemacro C4 l1
   |EXTRA
   |formal_args:A{a|b}
   |macro_name:{lm}
    *arguments_line C1
     {macro_line: lm {a, b}\\n}
    {raw:first |\\a\\|\\n}
    {raw:second |\\b\\|\\n}
    *@end C1 l4
    |EXTRA
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@macro C4 l6
   |EXTRA
   |formal_args:A{a}
   |macro_name:{mymacro}
    *arguments_line C1
     {macro_line: mymacro {a}\\n}
    {raw:macro \\a\\ text\\n}
    {raw:after arg\\n}
    *@end C1 l9
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C4
   {macro first |a|\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mymacro C2
     >{spaces_after_cmd_before_arg: }
     >*brace_arg C2
      >{spaces_before_argument:\\n}
      >{macro_call_arg_text:@lm {a} @c in comment}
   >linemacro_expansion<start;1><p:6>
    >*linemacro_call@lm C2
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{bracketed_linemacro_arg:a}
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:}
   {second ||}
   >SOURCEMARKS
   >linemacro_expansion<end;1><p:9>
   *@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:in comment text}
     {spaces_after_argument:\\n}
   {after arg\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:9>
';


$result_texis{'comment_on_linemacro_call_macro_expansion'} = '@linemacro lm {a, b}
first |\\a\\|
second |\\b\\|
@end linemacro

@macro mymacro {a}
macro \\a\\ text
after arg
@end macro

macro first |a|
second ||@c in comment text
after arg
';


$result_texts{'comment_on_linemacro_call_macro_expansion'} = '

macro first |a|
second ||after arg
';

$result_errors{'comment_on_linemacro_call_macro_expansion'} = '';

$result_nodes_list{'comment_on_linemacro_call_macro_expansion'} = '';

$result_sections_list{'comment_on_linemacro_call_macro_expansion'} = '';

$result_sectioning_root{'comment_on_linemacro_call_macro_expansion'} = '';

$result_headings_list{'comment_on_linemacro_call_macro_expansion'} = '';

1;
