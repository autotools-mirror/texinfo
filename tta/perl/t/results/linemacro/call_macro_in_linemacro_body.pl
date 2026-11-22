use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'call_macro_in_linemacro_body'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *normal_command@linemacro C5 l1
   |EXTRA
   |formal_args:A{a|b}
   |macro_name:{lm}
    *arguments_line C1
     {macro_line: lm {a, b}\\n}
    {raw:@mymacro{@code{}\\n}
    {raw:@var{\\a\\}\\n}
    {raw:now second arg: \\b\\}\\n}
    *normal_command@end C1 l5
    |EXTRA
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C5 l7
   |EXTRA
   |formal_args:A{c|d}
   |macro_name:{mymacro}
    *arguments_line C1
     {macro_line: mymacro {c, d}\\n}
    {raw:@table \\c\\\\n}
    {raw:@item \\d\\\\n}
    {raw:@end table\\n}
    *normal_command@end C1 l11
    |EXTRA
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
      >{bracketed_linemacro_arg:something}
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{bracketed_linemacro_arg:gg , yy \\n  zz}
   >macro_expansion<start;1><p:1>
    >*macro_call@mymacro C2
     >*brace_arg C1
      >{macro_call_arg_text:@code{}\\n@var{something}\\nnow second arg: gg }
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:yy \\n  zz}
  *normal_command@table C4 l14:@mymacro
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code C1 l14:@mymacro
      *brace_container
     {spaces_after_argument:\\n}
   *before_item C1
    *paragraph C3
     *normal_command@var C1 l14:@mymacro
      *brace_container C1
       {normal_text:something}
     {normal_text:\\n}
     {normal_text:now second arg: gg \\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l14:@mymacro
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:yy}
       {spaces_after_argument: \\n}
    *table_definition C2
     {spaces_before_paragraph:  }
     *paragraph C1
      {normal_text:zz\\n}
   *normal_command@end C1 l14:@mymacro
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     >SOURCEMARKS
     >macro_expansion<end;1><p:5>
     >linemacro_expansion<end;1><p:5>
     {spaces_after_argument:\\n}
';


$result_texis{'call_macro_in_linemacro_body'} = '@linemacro lm {a, b}
@mymacro{@code{}
@var{\\a\\}
now second arg: \\b\\}
@end linemacro

@macro mymacro {c, d}
@table \\c\\
@item \\d\\
@end table
@end macro

@table @code{}
@var{something}
now second arg: gg 
@item yy 
  zz
@end table
';


$result_texts{'call_macro_in_linemacro_body'} = '

something
now second arg: gg 
yy
zz
';

$result_errors{'call_macro_in_linemacro_body'} = '';

$result_nodes_list{'call_macro_in_linemacro_body'} = '';

$result_sections_list{'call_macro_in_linemacro_body'} = '';

$result_sectioning_root{'call_macro_in_linemacro_body'} = '';

$result_headings_list{'call_macro_in_linemacro_body'} = '';

1;
