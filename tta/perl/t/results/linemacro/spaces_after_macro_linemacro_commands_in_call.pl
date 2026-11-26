use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'spaces_after_macro_linemacro_commands_in_call'} = '*document_root C1
 *before_node_section C5
  *preamble C6
   *normal_command@linemacro C5 l1
   |formal_args:A{first|second|rest}
   |macro_name:{mylinecommand}
    *arguments_line C1
     {macro_line: mylinecommand {first, second, rest}\\n}
    {raw:@defblock\\n}
    {raw:@defline category {\\first\\} A \\second\\ B \\rest\\\\n}
    {raw:@end defblock\\n}
    *normal_command@end C1 l5
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l7
   |formal_args:A{arg1}
   |macro_name:{mymac}
    *arguments_line C1
     {macro_line: mymac {arg1}\\n}
    {raw:@samp{arg1}\\n}
    *normal_command@end C1 l9
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@linemacro C3 l11
   |formal_args:A{name|rest}
   |macro_name:{mylinemac}
    *arguments_line C1
     {macro_line: mylinemac {name, rest}\\n}
    {raw:{\\name\\} \\rest\\\\n}
    *normal_command@end C1 l13
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >linemacro_expansion<start;1><p:1>
    >*linemacro_call@mylinecommand C3
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:@mymac}
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{bracketed_linemacro_arg:aa}
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:@mymac {bb}}
  *normal_command@defblock C3 l15:@mylinecommand
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@defline C1 l15:@mylinecommand
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C4
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:category}
     {spaces: }
     *def_name C1
      *bracketed_arg C3 l15:@mylinecommand
       {spaces_before_argument:}
       >SOURCEMARKS
       >macro_expansion<start;1>
        >*macro_call_line@mymac C1
         >*line_arg C1
          >{normal_text:} A aa B @mymac {bb}}
       *normal_command@samp C1 l15:@mymac
       >SOURCEMARKS
       >macro_expansion<end;1>
        *brace_container C1
         {normal_text:arg1}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l15:@mylinecommand
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     >SOURCEMARKS
     >linemacro_expansion<end;1><p:8>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >linemacro_expansion<start;2><p:1>
   >*linemacro_call@mylinecommand C3
    >*linemacro_arg C2
     >{spaces_before_argument: }
     >{macro_call_arg_text:@mylinemac}
    >*linemacro_arg C2
     >{spaces_before_argument: }
     >{bracketed_linemacro_arg:Fun}
    >*linemacro_arg C2
     >{spaces_before_argument: }
     >{macro_call_arg_text:{other} and remaining}
  *normal_command@defblock C3 l17:@mylinecommand
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@defline C1 l17:@mylinecommand
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C17
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:category}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l17:@mylinecommand
       {spaces_before_argument:}
       >SOURCEMARKS
       >linemacro_expansion<start;3>
        >*linemacro_call@mylinemac C2
         >*linemacro_arg C1
          >{macro_call_arg_text:}}
         >*linemacro_arg C2
          >{spaces_before_argument: }
          >{macro_call_arg_text:A Fun B {other} and remaining}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:A}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:Fun}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:B}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l17:@mylinemac
       {normal_text:other}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:remaining}
       >SOURCEMARKS
       >linemacro_expansion<end;3><p:9>
     {spaces_after_argument:\\n}
   *normal_command@end C1 l17:@mylinecommand
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     >SOURCEMARKS
     >linemacro_expansion<end;2><p:8>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'spaces_after_macro_linemacro_commands_in_call'} = '@linemacro mylinecommand {first, second, rest}
@defblock
@defline category {\\first\\} A \\second\\ B \\rest\\
@end defblock
@end linemacro

@macro mymac {arg1}
@samp{arg1}
@end macro

@linemacro mylinemac {name, rest}
{\\name\\} \\rest\\
@end linemacro

@defblock
@defline category {@samp{arg1}
}@end defblock

@defblock
@defline category {} A Fun B {other} and remaining
@end defblock

';


$result_texts{'spaces_after_macro_linemacro_commands_in_call'} = '


category: arg1

category:  A Fun B other and remaining

';

$result_errors{'spaces_after_macro_linemacro_commands_in_call'} = '* E l15:@mylinecommand|misplaced {
 misplaced { (possibly involving @mylinecommand)

* E l17:@mylinemac|misplaced {
 misplaced { (possibly involving @mylinemac)

* E l17:@mylinemac|misplaced }
 misplaced } (possibly involving @mylinemac)

* W l17:@mylinecommand|missing name for @defline
 warning: missing name for @defline (possibly involving @mylinecommand)

';

$result_nodes_list{'spaces_after_macro_linemacro_commands_in_call'} = '';

$result_sections_list{'spaces_after_macro_linemacro_commands_in_call'} = '';

$result_sectioning_root{'spaces_after_macro_linemacro_commands_in_call'} = '';

$result_headings_list{'spaces_after_macro_linemacro_commands_in_call'} = '';

1;
