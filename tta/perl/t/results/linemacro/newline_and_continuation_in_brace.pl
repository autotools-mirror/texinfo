use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'newline_and_continuation_in_brace'} = '*document_root C1
 *before_node_section C3
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content C2
   *normal_command@linemacro C3 l2
   |formal_args:A{first|second|rest}
   |macro_name:{mylinecommand}
    *arguments_line C1
     {macro_line: mylinecommand {first, second, rest}\\n}
    {raw:@defline category \\first\\ \\second\\ \\rest\\\\n}
    *normal_command@end C1 l4
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@defblock C3 l6
   *arguments_line C1
    *block_line_arg C1
    >SOURCEMARKS
    >linemacro_expansion<start;1>
     >*linemacro_call@mylinecommand C3
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{macro_call_arg_text:a@code{b c}d}
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{bracketed_linemacro_arg:some arg @\\n   b}
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{macro_call_arg_text:{next @\\n   last} line}
     {spaces_before_argument:\\n}
   *normal_command@defline C1 l9:@mylinecommand
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C15
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:category}
     {spaces: }
     *def_name C1
      *def_line_arg C3
       {normal_text:a}
       *normal_command@code C1 l9:@mylinecommand
        *brace_container C1
         {normal_text:b c}
       {normal_text:d}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:some}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:arg}
     {spaces:    }
     >SOURCEMARKS
     >defline_continuation<1><p:1>
     *def_arg C1
      *def_line_arg C1
       {normal_text:b}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l9:@mylinecommand
       {normal_text:next    last}
       >SOURCEMARKS
       >defline_continuation<2><p:5>
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:line}
       >SOURCEMARKS
       >linemacro_expansion<end;1><p:4>
     {spaces_after_argument:\\n}
   *normal_command@end C1 l10
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
';


$result_texis{'newline_and_continuation_in_brace'} = '
@linemacro mylinecommand {first, second, rest}
@defline category \\first\\ \\second\\ \\rest\\
@end linemacro

@defblock
@defline category a@code{b c}d some arg    b {next    last} line
@end defblock
';


$result_texts{'newline_and_continuation_in_brace'} = '
category: ab cd some arg    b next    last line
';

$result_errors{'newline_and_continuation_in_brace'} = '';

$result_nodes_list{'newline_and_continuation_in_brace'} = '';

$result_sections_list{'newline_and_continuation_in_brace'} = '';

$result_sectioning_root{'newline_and_continuation_in_brace'} = '';

$result_headings_list{'newline_and_continuation_in_brace'} = '';

1;
