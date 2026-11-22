use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'call_macro_in_linemacro_call'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *normal_command@linemacro C4 l1
   |formal_args:A{a|b}
   |macro_name:{lm}
    *arguments_line C1
     {macro_line: lm {a, b}\\n}
    {raw:@quotation \\a\\\\n}
    {raw:now second arg: \\b\\\\n}
    *normal_command@end C1 l4
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C5 l6
   |formal_args:A{c|d}
   |macro_name:{mymacro}
    *arguments_line C1
     {macro_line: mymacro {c, d}\\n}
    {raw:@table \\c\\\\n}
    {raw:@item \\d\\\\n}
    {raw:@end table\\n}
    *normal_command@end C1 l10
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >linemacro_expansion<start;1><p:1>
    >*linemacro_call@lm C2
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{bracketed_linemacro_arg:aa\\n  @mymacro{@emph ,\\n   ggg} }
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:jj @var{T}}
  *normal_command@quotation C7 l14:@lm
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:aa}
     {spaces_after_argument:\\n}
   {spaces_before_paragraph:  }
   >SOURCEMARKS
   >macro_expansion<start;1><p:2>
    >*macro_call@mymacro C2
     >*brace_arg C1
      >{macro_call_arg_text:@emph }
     >*brace_arg C2
      >{spaces_before_argument:\\n}
      >{macro_call_arg_text:   ggg}
   *normal_command@table C3 l14:@mymacro
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *normal_command@emph l14:@mymacro
      {spaces_after_argument: \\n}
    *table_entry C1
     *table_term C1
      *normal_command@item C1 l14:@mymacro
       *line_arg C3
        {spaces_before_argument:    }
        {normal_text:ggg}
        {spaces_after_argument:\\n}
    *normal_command@end C1 l14:@mymacro
    |text_arg:{table}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:table}
      >SOURCEMARKS
      >macro_expansion<end;1><p:5>
      {spaces_after_argument: \\n}
   *paragraph C3
    {normal_text:now second arg: jj }
    *normal_command@var C1 l14:@lm
    >SOURCEMARKS
    >linemacro_expansion<end;1>
     *brace_container C1
      {normal_text:T}
    {normal_text:\\n}
   {empty_line: \\n}
   {empty_line:\\n}
   *normal_command@end C1 l17
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'call_macro_in_linemacro_call'} = '@linemacro lm {a, b}
@quotation \\a\\
now second arg: \\b\\
@end linemacro

@macro mymacro {c, d}
@table \\c\\
@item \\d\\
@end table
@end macro

@quotation aa
  @table @emph 
@item    ggg
@end table 
now second arg: jj @var{T}
 

@end quotation
';


$result_texts{'call_macro_in_linemacro_call'} = '

aa
ggg
now second arg: jj T
 

';

$result_errors{'call_macro_in_linemacro_call'} = '';

$result_nodes_list{'call_macro_in_linemacro_call'} = '';

$result_sections_list{'call_macro_in_linemacro_call'} = '';

$result_sectioning_root{'call_macro_in_linemacro_call'} = '';

$result_headings_list{'call_macro_in_linemacro_call'} = '';

1;
