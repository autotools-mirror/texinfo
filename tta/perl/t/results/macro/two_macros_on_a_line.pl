use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'two_macros_on_a_line'} = '*document_root C1
 *before_node_section C10
  *preamble_before_content C5
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{mymacro}
    *arguments_line C1
     {macro_line: mymacro\\n}
    {raw:in mymacro\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C5 l5
   |formal_args:A{arg}
   |macro_name:{mymacrowithargs}
    *arguments_line C1
     {macro_line: mymacrowithargs{arg}\\n}
    {raw:in with args\\n}
    {raw:now the arg \\arg\\\\n}
    {raw:after\\n}
    *normal_command@end C1 l9
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
  *paragraph C11
   *normal_command@@
   {normal_text:mymacro}
   *normal_command@{
   *normal_command@}
   {normal_text: }
   *normal_command@@
   {normal_text:mymacro}
   *normal_command@{
   *normal_command@}
   {normal_text:\\n}
   {normal_text:in mymacro in mymacro\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mymacro C1
     >*brace_arg
   >macro_expansion<end;1><p:10>
   >macro_expansion<start;2><p:11>
    >*macro_call@mymacro C1
     >*brace_arg
   >macro_expansion<end;2><p:21>
  {empty_line:\\n}
  *paragraph C8
   *normal_command@@
   {normal_text:mymacro }
   *normal_command@@
   {normal_text:mymacro}
   *normal_command@{
   *normal_command@}
   {normal_text:\\n}
   {normal_text:in mymacro in mymacro\\n}
   >SOURCEMARKS
   >macro_expansion<start;3>
    >*macro_call@mymacro
   >macro_expansion<end;3><p:10>
   >macro_expansion<start;4><p:11>
    >*macro_call@mymacro C1
     >*brace_arg
   >macro_expansion<end;4><p:21>
  {empty_line:\\n}
  *paragraph C8
   *normal_command@@
   {normal_text:mymacro}
   *normal_command@{
   *normal_command@}
   {normal_text: }
   *normal_command@@
   {normal_text:mymacro\\n}
   {normal_text:in mymacro in mymacro\\n}
   >SOURCEMARKS
   >macro_expansion<start;5>
    >*macro_call@mymacro C1
     >*brace_arg
   >macro_expansion<end;5><p:10>
   >macro_expansion<start;6><p:11>
    >*macro_call@mymacro
   >macro_expansion<end;6><p:21>
  {empty_line:\\n}
  *paragraph C4
   {normal_text:with args\\n}
   {normal_text:in with args\\n}
   >SOURCEMARKS
   >macro_expansion<start;7>
    >*macro_call@mymacrowithargs C2
     >{spaces_after_cmd_before_arg: }
     >*brace_arg C1
      >{macro_call_arg_text:an\\narg\\n\\nin macro}
   {normal_text:now the arg an\\n}
   {normal_text:arg\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:in macro\\n}
   {normal_text:after in mymacro\\n}
   >SOURCEMARKS
   >macro_expansion<end;7><p:5>
   >macro_expansion<start;8><p:6>
    >*macro_call@mymacro C1
     >*brace_arg
   >macro_expansion<end;8><p:16>
';


$result_texis{'two_macros_on_a_line'} = '@macro mymacro
in mymacro
@end macro

@macro mymacrowithargs{arg}
in with args
now the arg \\arg\\
after
@end macro


@@mymacro@{@} @@mymacro@{@}
in mymacro in mymacro

@@mymacro @@mymacro@{@}
in mymacro in mymacro

@@mymacro@{@} @@mymacro
in mymacro in mymacro

with args
in with args
now the arg an
arg

in macro
after in mymacro
';


$result_texts{'two_macros_on_a_line'} = '


@mymacro{} @mymacro{}
in mymacro in mymacro

@mymacro @mymacro{}
in mymacro in mymacro

@mymacro{} @mymacro
in mymacro in mymacro

with args
in with args
now the arg an
arg

in macro
after in mymacro
';

$result_errors{'two_macros_on_a_line'} = '';

$result_nodes_list{'two_macros_on_a_line'} = '';

$result_sections_list{'two_macros_on_a_line'} = '';

$result_sectioning_root{'two_macros_on_a_line'} = '';

$result_headings_list{'two_macros_on_a_line'} = '';

1;
