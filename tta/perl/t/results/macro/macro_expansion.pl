use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_expansion'} = '*document_root C1
 *before_node_section C21
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@macro C6 l2
   |formal_args:A{arg1|arg2}
   |macro_name:{macroone}
    *arguments_line C1
     {macro_line: macroone {arg1, arg2 }\\n}
    {raw:result of a macro with \\arg1\\ and \\n}
    {raw:@verbatim\\n}
    {raw:\\arg2\\\\n}
    {raw:@end verbatim\\n}
    *normal_command@end C1 l7
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:2 simple args. result of a macro with first arg and \\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:15>
    >*macro_call@macroone C3
     >{spaces_after_cmd_before_arg: }
     >*brace_arg C1
      >{macro_call_arg_text:first arg}
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:second arg}
  *normal_command@verbatim C3 l9:@macroone
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:second arg\\n}
   *normal_command@end C1 l9:@macroone
   |text_arg:{verbatim.}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim.}
     >SOURCEMARKS
     >macro_expansion<end;1><p:8>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:comma in command. result of a macro with aaa }
   >SOURCEMARKS
   >macro_expansion<start;2><p:18>
    >*macro_call@macroone C1
     >*brace_arg C1
      >{macro_call_arg_text:aaa @samp{a macro , } bbb}
   *normal_command@samp C1 l11:@macroone
    *brace_container C1
     {normal_text:a macro , }
   {normal_text: bbb and \\n}
  *normal_command@verbatim C3 l11:@macroone
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:\\n}
   *normal_command@end C1 l11:@macroone
   |text_arg:{verbatim.}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim.}
     >SOURCEMARKS
     >macro_expansion<end;2><p:8>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:call on the line. result of a macro with  and \\n}
   >SOURCEMARKS
   >macro_expansion<start;3><p:18>
    >*macro_call@macroone
  *normal_command@verbatim C3 l13:@macroone
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:\\n}
   *normal_command@end C1 l13:@macroone
   |text_arg:{verbatim my arg.}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim my arg.}
     >SOURCEMARKS
     >macro_expansion<end;3><p:8>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:recursive call. result of a macro with first arg and \\n}
   >SOURCEMARKS
   >macro_expansion<start;4><p:16>
    >*macro_call@macroone C2
     >*brace_arg C1
      >{macro_call_arg_text:first arg}
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:@macroone{nested second arg}}
  *normal_command@verbatim C3 l15:@macroone
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:@macroone{nested second arg}\\n}
   *normal_command@end C1 l15:@macroone
   |text_arg:{verbatim.}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim.}
     >SOURCEMARKS
     >macro_expansion<end;4><p:8>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:protect stuff. result of a macro with first , arg and \\n}
   >SOURCEMARKS
   >macro_expansion<start;5><p:15>
    >*macro_call@macroone C2
     >*brace_arg C1
      >{macro_call_arg_text:first , arg}
      >>SOURCEMARKS
      >>macro_arg_escape_backslash<1><p:6>
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:{} \\ }
      >>SOURCEMARKS
      >>macro_arg_escape_backslash<2>
      >>macro_arg_escape_backslash<3><p:1>
      >>macro_arg_escape_backslash<4><p:3>
  *normal_command@verbatim C3 l17:@macroone
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:{} \\ \\n}
   *normal_command@end C1 l17:@macroone
   |text_arg:{verbatim.}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim.}
     >SOURCEMARKS
     >macro_expansion<end;5><p:8>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:multi-line arg. result of a macro with arg 1\\n}
   >SOURCEMARKS
   >macro_expansion<start;6><p:16>
    >*macro_call@macroone C2
     >*brace_arg C1
      >{macro_call_arg_text:arg 1\\n\\nnow}
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:arg3\\n\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:now and \\n}
  *normal_command@verbatim C5 l23:@macroone
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:arg3\\n}
   {raw:\\n}
   {raw:\\n}
   *normal_command@end C1 l23:@macroone
   |text_arg:{verbatim.}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:verbatim.}
     >SOURCEMARKS
     >macro_expansion<end;6><p:8>
';


$result_texis{'macro_expansion'} = '
@macro macroone {arg1, arg2 }
result of a macro with \\arg1\\ and 
@verbatim
\\arg2\\
@end verbatim
@end macro

2 simple args. result of a macro with first arg and 
@verbatim
second arg
@end verbatim.

comma in command. result of a macro with aaa @samp{a macro , } bbb and 
@verbatim

@end verbatim.

call on the line. result of a macro with  and 
@verbatim

@end verbatim my arg.

recursive call. result of a macro with first arg and 
@verbatim
@macroone{nested second arg}
@end verbatim.

protect stuff. result of a macro with first , arg and 
@verbatim
{} \\ 
@end verbatim.

multi-line arg. result of a macro with arg 1

now and 
@verbatim
arg3


@end verbatim.';


$result_texts{'macro_expansion'} = '
2 simple args. result of a macro with first arg and 
second arg

comma in command. result of a macro with aaa a macro ,  bbb and 


call on the line. result of a macro with  and 


recursive call. result of a macro with first arg and 
@macroone{nested second arg}

protect stuff. result of a macro with first , arg and 
{} \\ 

multi-line arg. result of a macro with arg 1

now and 
arg3


';

$result_errors{'macro_expansion'} = '* E l9:@macroone|bad argument to @end: verbatim.
 bad argument to @end: verbatim. (possibly involving @macroone)

* E l11:@macroone|bad argument to @end: verbatim.
 bad argument to @end: verbatim. (possibly involving @macroone)

* W l13|@macroone defined with zero or more than one argument should be invoked with {}
 warning: @macroone defined with zero or more than one argument should be invoked with {}

* E l13:@macroone|bad argument to @end: verbatim my arg.
 bad argument to @end: verbatim my arg. (possibly involving @macroone)

* E l15:@macroone|bad argument to @end: verbatim.
 bad argument to @end: verbatim. (possibly involving @macroone)

* W l17|use @comma{} instead of \\, in macro arg
 warning: use @comma{} instead of \\, in macro arg

* E l17:@macroone|bad argument to @end: verbatim.
 bad argument to @end: verbatim. (possibly involving @macroone)

* E l23:@macroone|bad argument to @end: verbatim.
 bad argument to @end: verbatim. (possibly involving @macroone)

';

$result_nodes_list{'macro_expansion'} = '';

$result_sections_list{'macro_expansion'} = '';

$result_sectioning_root{'macro_expansion'} = '';

$result_headings_list{'macro_expansion'} = '';

1;
