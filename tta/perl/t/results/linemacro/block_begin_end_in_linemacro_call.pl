use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'block_begin_end_in_linemacro_call'} = '*document_root C1
 *before_node_section C18
  *preamble_before_content C2
   *@linemacro C3 l1
   |EXTRA
   |formal_args:A{a}
   |macro_name:{lm}
    *arguments_line C1
     {macro_line: lm {a}\\n}
    {raw:b \\a\\ a\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:b \\n}
   >SOURCEMARKS
   >linemacro_expansion<start;1>
    >*linemacro_call@lm C1
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{bracketed_linemacro_arg:\\n@quotation aa\\nin quotation\\n}
  *@quotation C3 l8:@lm
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:aa}
     {spaces_after_argument:\\n}
   *paragraph C2
    {normal_text:in quotation\\n}
    {normal_text: a\\n}
    >SOURCEMARKS
    >linemacro_expansion<end;1><p:2>
   *@end C1 l9
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C3 l11
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:hh}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:b \\n}
    >SOURCEMARKS
    >linemacro_expansion<start;2>
     >*linemacro_call@lm C1
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{bracketed_linemacro_arg:\\n@end quotation\\n\\n}
   *@end C1 l15:@lm
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:a\\n}
   >SOURCEMARKS
   >linemacro_expansion<end;2><p:1>
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b \\n}
   >SOURCEMARKS
   >linemacro_expansion<start;3>
    >*linemacro_call@lm C1
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{bracketed_linemacro_arg:\\n@quotation}
  *@quotation C5 l18:@lm
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:a}
     >SOURCEMARKS
     >linemacro_expansion<end;3><p:1>
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:in quotation\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:aa.\\n}
   *@end C1 l22
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:b \\n}
   >SOURCEMARKS
   >linemacro_expansion<start;4>
    >*linemacro_call@lm C1
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{bracketed_linemacro_arg:\\n@ignore\\nignored }
   *@ignore C5 l26:@lm
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {raw:ignored  a}
    >SOURCEMARKS
    >linemacro_expansion<end;4><p:10>
    {raw:\\n}
    {raw:still ignored\\n}
    *@end C1 l28
    |EXTRA
    |text_arg:{ignore}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:ignore}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:b \\n}
   >SOURCEMARKS
   >linemacro_expansion<start;5>
    >*linemacro_call@lm C1
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{bracketed_linemacro_arg:\\n@macro mymac {e, f}\\nargs \\e\\|\\f\\|\\n@defline @lm {\\e\\} {\\f\\}\\n}
   *@macro C6 l34:@lm
   |EXTRA
   |formal_args:A{e|f}
   |macro_name:{mymac}
    *arguments_line C1
     {macro_line: mymac {e, f}\\n}
    {raw:args \\e\\|\\f\\|\\n}
    {raw:@defline @lm {\\e\\} {\\f\\}\\n}
    {raw: a}
    >SOURCEMARKS
    >linemacro_expansion<end;5><p:2>
    {raw:\\n}
    *@end C1 l35
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defblock C5 l37
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_defline C1
    *paragraph C1
     {normal_text:args arg1|arg2|\\n}
     >SOURCEMARKS
     >macro_expansion<start;1>
      >*macro_call@mymac C2
       >*brace_arg C1
        >{macro_call_arg_text:arg1}
       >*brace_arg C2
        >{spaces_before_argument: }
        >{macro_call_arg_text:arg2}
   *@defline C1 l38:@mymac
   |EXTRA
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C9
     {spaces_before_argument: }
     >SOURCEMARKS
     >linemacro_expansion<start;6><p:1>
      >*linemacro_call@lm C1
       >*linemacro_arg C2
        >{spaces_before_argument: }
        >{macro_call_arg_text:{arg1} {arg2}}
     *def_category C1
      *def_line_arg C1
       {normal_text:b}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l38:@lm
       {normal_text:arg1}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l38:@lm
       {normal_text:arg2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a}
       >SOURCEMARKS
       >linemacro_expansion<end;6><p:1>
     {spaces_after_argument:\\n}
   *def_item C2
    {spaces_before_paragraph: }
    *paragraph C1
     {normal_text:a\\n}
     >SOURCEMARKS
     >macro_expansion<end;1><p:1>
   *@end C1 l39
   |EXTRA
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'block_begin_end_in_linemacro_call'} = '@linemacro lm {a}
b \\a\\ a
@end linemacro

b 
@quotation aa
in quotation
 a
@end quotation

@quotation hh
b 
@end quotation

 a

b 
@quotation a
in quotation

aa.
@end quotation

b 
@ignore
ignored  a
still ignored
@end ignore

b 
@macro mymac {e, f}
args \\e\\|\\f\\|
@defline @lm {\\e\\} {\\f\\}
 a
@end macro

@defblock
args arg1|arg2|
@defline b {arg1} {arg2} a
 a
@end defblock

';


$result_texts{'block_begin_end_in_linemacro_call'} = '
b 
aa
in quotation
 a

hh
b 

a

b 
a
in quotation

aa.

b 

b 

args arg1|arg2|
b: arg1 arg2 a
a

';

$result_errors{'block_begin_end_in_linemacro_call'} = '';

$result_nodes_list{'block_begin_end_in_linemacro_call'} = '';

$result_sections_list{'block_begin_end_in_linemacro_call'} = '';

$result_sectioning_root{'block_begin_end_in_linemacro_call'} = '';

$result_headings_list{'block_begin_end_in_linemacro_call'} = '';

1;
