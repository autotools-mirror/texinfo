use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'form_feeds'} = '*document_root C1
 *before_node_section C8
  *preamble_before_content C4
   *@macro C3 l1
   |EXTRA
   |formal_args:A{a|b}
   |macro_name:{mymacro}
    *arguments_line C1
     {macro_line: mymacro{a, b}\\n}
    {raw:f \\a\\ n \\b\\\\n}
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
   |formal_args:A{c}
   |macro_name:{oneargmacro}
    *arguments_line C1
     {macro_line: oneargmacro{c}\\n}
    {raw:g \\c\\ v\\n}
    *@end C1 l7
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:f arg1}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mymacro C3
     >{spaces_after_cmd_before_arg:  \\f}
     >*brace_arg C2
      >{spaces_before_argument: \\f }
      >{macro_call_arg_text:arg1\\f}
     >*brace_arg C2
      >{spaces_before_argument:\\f }
      >{macro_call_arg_text:arg2}
  {empty_line:\\f}
  {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:n arg2\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:6>
  {empty_line:\\n}
  *paragraph C3
   {normal_text:g a}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call_line@oneargmacro C1
     >*line_arg C2
      >{spaces_before_argument: \\f \\f }
      >{normal_text:a@{rgline}
   *@{
   {normal_text:rgline v\\n}
   >SOURCEMARKS
   >macro_expansion<end;2><p:8>
  {empty_line:\\n}
';


$result_texis{'form_feeds'} = '@macro mymacro{a, b}
f \\a\\ n \\b\\
@end macro

@macro oneargmacro{c}
g \\c\\ v
@end macro

f arg1 n arg2

g a@{rgline v

';


$result_texts{'form_feeds'} = '

f arg1n arg2

g a{rgline v

';

$result_errors{'form_feeds'} = '';

$result_nodes_list{'form_feeds'} = '';

$result_sections_list{'form_feeds'} = '';

$result_sectioning_root{'form_feeds'} = '';

$result_headings_list{'form_feeds'} = '';

1;
