use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'spaces_in_call'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@linemacro C5 l1
   |EXTRA
   |formal_args:A{first|second|rest}
   |macro_name:{mylinecommand}
    *arguments_line C1
     {macro_line: mylinecommand {first, second, rest}\\n}
    {raw:@defblock\\n}
    {raw:@defline category \\first\\ A \\second\\ B \\rest\\\\n}
    {raw:@end defblock\\n}
    *normal_command@end C1 l5
    |EXTRA
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >linemacro_expansion<start;1><p:1>
    >*linemacro_call@mylinecommand C1
     >*linemacro_arg C1
      >{macro_call_arg_text:{a b}{c d}{rest}}
  *normal_command@defblock C3 l7:@mylinecommand
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@defline C1 l7:@mylinecommand
   |EXTRA
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:category}
     {spaces: }
     *def_name C1
      *def_line_arg C3
       *bracketed_arg C1 l7:@mylinecommand
        {normal_text:a b}
       *bracketed_arg C1 l7:@mylinecommand
        {normal_text:c d}
       *bracketed_arg C1 l7:@mylinecommand
        {normal_text:rest}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:A}
     {spaces:  }
     *def_arg C1
      *def_line_arg C1
       {normal_text:B}
     {spaces_after_argument: \\n}
   *normal_command@end C1 l7:@mylinecommand
   |EXTRA
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     >SOURCEMARKS
     >linemacro_expansion<end;1><p:8>
     {spaces_after_argument:\\n}
';


$result_texis{'spaces_in_call'} = '@linemacro mylinecommand {first, second, rest}
@defblock
@defline category \\first\\ A \\second\\ B \\rest\\
@end defblock
@end linemacro

@defblock
@defline category {a b}{c d}{rest} A  B 
@end defblock
';


$result_texts{'spaces_in_call'} = '
category: a bc drest A  B
';

$result_errors{'spaces_in_call'} = '';

$result_nodes_list{'spaces_in_call'} = '';

$result_sections_list{'spaces_in_call'} = '';

$result_sectioning_root{'spaces_in_call'} = '';

$result_headings_list{'spaces_in_call'} = '';

1;
