use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'two_macros_on_a_line'} = '*document_root C1
 *before_node_section C14
  *@macro C3 l1
  |EXTRA
  |macro_name:{mymacro}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: mymacro\\n}
   {raw:in mymacro\\n}
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
  *@macro C5 l5
  |EXTRA
  |macro_name:{mymacrowithargs}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: mymacrowithargs{arg}\\n}
   {raw:in with args\\n}
   {raw:now the arg \\arg\\\\n}
   {raw:after\\n}
   *@end C1 l9
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
  {empty_line:\\n}
  *paragraph C11
   *@@
   {mymacro}
   *@{
   *@}
   { }
   *@@
   {mymacro}
   *@{
   *@}
   {\\n}
   {in mymacro in mymacro\\n}
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
   *@@
   {mymacro }
   *@@
   {mymacro}
   *@{
   *@}
   {\\n}
   {in mymacro in mymacro\\n}
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
   *@@
   {mymacro}
   *@{
   *@}
   { }
   *@@
   {mymacro\\n}
   {in mymacro in mymacro\\n}
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
   {with args\\n}
   {in with args\\n}
   >SOURCEMARKS
   >macro_expansion<start;7>
    >*macro_call@mymacrowithargs C1
    >|INFO
    >|spaces_after_cmd_before_arg:
     >|{spaces_after_cmd_before_arg: }
     >*brace_arg C1
      >{macro_call_arg_text:an\\narg\\n\\nin macro}
   {now the arg an\\n}
   {arg\\n}
  {empty_line:\\n}
  *paragraph C2
   {in macro\\n}
   {after in mymacro\\n}
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
