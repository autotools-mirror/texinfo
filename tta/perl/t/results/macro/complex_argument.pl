use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'complex_argument'} = '*document_root C1
 *before_node_section C16
  *@macro C3 l1
  |EXTRA
  |macro_name:{macrotwo}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: macrotwo{arg}\\n}
   {raw:coucou \\arg\\ after arg\\n}
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
  *@macro C6 l5
  |EXTRA
  |macro_name:{macrofour}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: macrofour {}\\n}
   {raw:1\\n}
   {raw:2\\n}
   {raw:3\\n}
   {raw:4\\n}
   *@end C1 l10
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
  *@macro C4 l12
  |EXTRA
  |macro_name:{macrothree}
  |misc_args:A{text|arg}
   *arguments_line C1
    {macro_line: macrothree{text, arg}\\n}
   {raw:\\text\\\\n}
   {raw:&&&& \\arg\\\\n}
   *@end C1 l15
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
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@macrothree C1
    >*brace_arg C1
     >{macro_call_arg_text:@verb{% @macrotwo %}\\n@c @macrofour\\n@pagesizes 4 @macrofour{}\\n@headings doubleafter @macrofour{}\\n@verbatim\\n@macrotwo\\n@end verbatim\\n@ignore\\n@macrofour\\n@end ignore\\n@macro macroseven {truc}\\n@emph{\\truc\\}\\n@end macro\\nmacroseven defined\\n@ifinfo\\n@macrofour\\n@end ifinfo\\n@iftex\\n@macrotwo{aa,bb}\\n@end iftex\\n@macrofour{}\\n}
     >>SOURCEMARKS
     >>macro_arg_escape_backslash<1><p:192>
     >>macro_arg_escape_backslash<2><p:197>
     >>macro_arg_escape_backslash<3><p:280>
  *paragraph C11
   *@verb C1 l38:@macrothree
   |INFO
   |delimiter:{%}
    *brace_container C1
     {raw: @macrotwo }
   {\\n}
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:@macrofour}
   *@pagesizes C1 l38:@macrothree
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {4 1}
     >SOURCEMARKS
     >macro_expansion<start;2><p:2>
      >*macro_call@macrofour C1
       >*brace_arg
   {2\\n}
   {3\\n}
   {4\\n}
   >SOURCEMARKS
   >macro_expansion<end;2><p:1>
   *@headings C1 l38:@macrothree
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {doubleafter 1}
     >SOURCEMARKS
     >macro_expansion<start;3><p:12>
      >*macro_call@macrofour C1
       >*brace_arg
   {2\\n}
   {3\\n}
   {4\\n}
   >SOURCEMARKS
   >macro_expansion<end;3><p:1>
  *@verbatim C3 l38:@macrothree
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {raw:@macrotwo\\n}
   *@end C1 l38:@macrothree
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{verbatim}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {verbatim}
  *@ignore C3 l38:@macrothree
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {raw:@macrofour\\n}
   *@end C1 l38:@macrothree
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{ignore}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ignore}
  *@macro C3 l38:@macrothree
  |EXTRA
  |macro_name:{macroseven}
  |misc_args:A{truc}
   *arguments_line C1
    {macro_line: macroseven {truc}\\n}
   {raw:@emph{\\truc\\}\\n}
   *@end C1 l38:@macrothree
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
  *paragraph C5
   {macroseven defined\\n}
   >SOURCEMARKS
   >ignored_conditional_block<1><p:19>
    >*@ifinfo C3 l38:@macrothree
     >*arguments_line C1
      >*block_line_arg
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
     >{raw:@macrofour\\n}
     >*@end C1 l38:@macrothree
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
     >|EXTRA
     >|text_arg:{ifinfo}
      >*line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{ifinfo}
   >ignored_conditional_block<2><p:19>
    >*@iftex C3 l38:@macrothree
     >*arguments_line C1
      >*block_line_arg
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
     >{raw:@macrotwo{aa,bb}\\n}
     >*@end C1 l38:@macrothree
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
     >|EXTRA
     >|text_arg:{iftex}
      >*line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{iftex}
   {1\\n}
   >SOURCEMARKS
   >macro_expansion<start;4>
    >*macro_call@macrofour C1
     >*brace_arg
   {2\\n}
   {3\\n}
   {4\\n}
   >SOURCEMARKS
   >macro_expansion<end;4><p:1>
  {empty_line:\\n}
  *paragraph C1
   {&&&& \\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:5>
  {empty_line:\\n}
  *paragraph C3
   {Call macroseven\\n}
   >SOURCEMARKS
   >macro_expansion<start;5><p:16>
    >*macro_call@macroseven C1
     >*brace_arg C1
      >{macro_call_arg_text:aaa}
   *@emph C1 l41:@macroseven
   >SOURCEMARKS
   >macro_expansion<end;5>
    *brace_container C1
     {aaa}
   {\\n}
  {empty_line:\\n}
';


$result_texis{'complex_argument'} = '@macro macrotwo{arg}
coucou \\arg\\ after arg
@end macro

@macro macrofour {}
1
2
3
4
@end macro

@macro macrothree{text, arg}
\\text\\
&&&& \\arg\\
@end macro

@verb{% @macrotwo %}
@c @macrofour
@pagesizes 4 1
2
3
4
@headings doubleafter 1
2
3
4
@verbatim
@macrotwo
@end verbatim
@ignore
@macrofour
@end ignore
@macro macroseven {truc}
@emph{\\truc\\}
@end macro
macroseven defined
1
2
3
4

&&&& 

Call macroseven
@emph{aaa}

';


$result_texts{'complex_argument'} = '


 @macrotwo 
2
3
4
2
3
4
@macrotwo
macroseven defined
1
2
3
4

&&&& 

Call macroseven
aaa

';

$result_errors{'complex_argument'} = '* W l35|use @comma{} instead of \\, in macro arg
 warning: use @comma{} instead of \\, in macro arg

* E l38:@macrofour|bad argument to @headings: doubleafter 1
 bad argument to @headings: doubleafter 1 (possibly involving @macrofour)

';

$result_nodes_list{'complex_argument'} = '';

$result_sections_list{'complex_argument'} = '';

$result_sectioning_root{'complex_argument'} = '';

$result_headings_list{'complex_argument'} = '';

1;
