use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'form_feeds'} = '*document_root C1
 *before_node_section C11
  *@macro C3 l1
  |EXTRA
  |macro_name:{mymacro}
  |misc_args:A{a|b}
   *arguments_line C1
    {macro_line: mymacro{a, b}\\n}
   {raw:f \\a\\ n \\b\\\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *@macro C3 l5
  |EXTRA
  |macro_name:{oneargmacro}
  |misc_args:A{c}
   *arguments_line C1
    {macro_line: oneargmacro{c}\\n}
   {raw:g \\c\\ v\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *paragraph C1
   {f arg1}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mymacro C2
    >|INFO
    >|spaces_after_cmd_before_arg:
     >|{spaces_after_cmd_before_arg:  \\f}
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: \\f }
      >{macro_call_arg_text:arg1\\f}
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument:\\f }
      >{macro_call_arg_text:arg2}
  {empty_line:\\f}
  {spaces_before_paragraph: }
  *paragraph C1
   {n arg2\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:6>
  {empty_line:\\n}
  *paragraph C3
   {g a}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call_line@oneargmacro C1
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: \\f \\f }
     >*line_arg C1
      >{a@{rgline}
   *@{
   {rgline v\\n}
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
