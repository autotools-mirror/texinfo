use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'last_argument_with_braces'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@linemacro C4 l1
   |EXTRA
   |formal_args:A{symbol|rest}
   |macro_name:{defbuiltin}
    *arguments_line C1
     {macro_line: defbuiltin {symbol, rest}\\n}
    {raw:@defline \\symbol\\ f r\\n}
    {raw:@defline expand Builtin and \\rest\\\\n}
    *normal_command@end C1 l4
    |EXTRA
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@defblock C10 l6
   *arguments_line C1
    *block_line_arg C1
    >SOURCEMARKS
    >linemacro_expansion<start;1>
     >*linemacro_call@defbuiltin C2
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{bracketed_linemacro_arg:my foo}
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{macro_call_arg_text:a last {} arg{ument}}
     {spaces_before_argument:\\n}
   *normal_command@defline C1 l7:@defbuiltin
   |EXTRA
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:my}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foo}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:f}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r}
     {spaces_after_argument:\\n}
   *normal_command@defline C1 l7:@defbuiltin
   |EXTRA
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C16
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:expand}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:Builtin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:last}
     {spaces: }
     *def_arg C1
      *bracketed_arg l7:@defbuiltin
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:arg}
     *def_arg C1
      *bracketed_arg C1 l7:@defbuiltin
      >SOURCEMARKS
      >linemacro_expansion<end;1>
       {normal_text:ument}
     {spaces_after_argument:\\n}
   *def_item C1
    {empty_line:\\n}
    >SOURCEMARKS
    >linemacro_expansion<start;2><p:1>
     >*linemacro_call@defbuiltin C2
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{bracketed_linemacro_arg:my foo}
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{macro_call_arg_text:{} {}}
   *normal_command@defline C1 l9:@defbuiltin
   |EXTRA
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:my}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foo}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:f}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r}
     {spaces_after_argument:\\n}
   *normal_command@defline C1 l9:@defbuiltin
   |EXTRA
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:expand}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:Builtin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces: }
     *def_arg C1
      *bracketed_arg l9:@defbuiltin
     {spaces: }
     *def_arg C1
      *bracketed_arg l9:@defbuiltin
      >SOURCEMARKS
      >linemacro_expansion<end;2>
     {spaces_after_argument:\\n}
   *def_item C1
    {empty_line:\\n}
    >SOURCEMARKS
    >linemacro_expansion<start;3><p:1>
     >*linemacro_call@defbuiltin C2
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{bracketed_linemacro_arg:my foo}
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{macro_call_arg_text:{second arg} remaining on {line}}
   *normal_command@defline C1 l11:@defbuiltin
   |EXTRA
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:my}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foo}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:f}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r}
     {spaces_after_argument:\\n}
   *normal_command@defline C1 l11:@defbuiltin
   |EXTRA
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C15
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:expand}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:Builtin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l11:@defbuiltin
       {normal_text:second arg}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:remaining}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:on}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l11:@defbuiltin
      >SOURCEMARKS
      >linemacro_expansion<end;3>
       {normal_text:line}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l12
   |EXTRA
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
';


$result_texis{'last_argument_with_braces'} = '@linemacro defbuiltin {symbol, rest}
@defline \\symbol\\ f r
@defline expand Builtin and \\rest\\
@end linemacro

@defblock
@defline my foo f r
@defline expand Builtin and a last {} arg{ument}

@defline my foo f r
@defline expand Builtin and {} {}

@defline my foo f r
@defline expand Builtin and {second arg} remaining on {line}
@end defblock
';


$result_texts{'last_argument_with_braces'} = '
my: foo f r
expand: Builtin and a last  argument

my: foo f r
expand: Builtin and  

my: foo f r
expand: Builtin and second arg remaining on line
';

$result_errors{'last_argument_with_braces'} = '';

$result_nodes_list{'last_argument_with_braces'} = '';

$result_sections_list{'last_argument_with_braces'} = '';

$result_sectioning_root{'last_argument_with_braces'} = '';

$result_headings_list{'last_argument_with_braces'} = '';

1;
