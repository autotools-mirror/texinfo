use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'arg_body_expansion_order'} = '*document_root C1
 *before_node_section C3
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C6
   *normal_command@macro C3 l2
   |EXTRA
   |formal_args:A{}
   |macro_name:{othermacro}
    *arguments_line C1
     {macro_line: othermacro\\n}
    {raw:initial\\n}
    *normal_command@end C1 l4
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C7 l6
   |EXTRA
   |formal_args:A{arg}
   |macro_name:{redefineothermacro}
    *arguments_line C1
     {macro_line: redefineothermacro {arg}\\n}
    {raw:@unmacro othermacro\\n}
    {raw:@macro othermacro\\n}
    {raw:different\\n}
    {raw:@end macro\\n}
    {raw:\\arg\\\\n}
    *normal_command@end C1 l12
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:1>
    >*macro_call@redefineothermacro C1
     >*brace_arg C1
      >{macro_call_arg_text:@othermacro{}}
   *normal_command@unmacro C1
   |EXTRA
   |misc_args:A{othermacro}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:othermacro}
     {spaces_after_argument:\\n}
   *normal_command@macro C3 l14:@redefineothermacro
   |EXTRA
   |formal_args:A{}
   |macro_name:{othermacro}
    *arguments_line C1
     {macro_line: othermacro\\n}
    {raw:different\\n}
    *normal_command@end C1 l14:@redefineothermacro
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:different\\n}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@othermacro C1
     >*brace_arg
   >macro_expansion<end;2><p:9>
   >macro_expansion<end;1><p:9>
';


$result_texis{'arg_body_expansion_order'} = '
@macro othermacro
initial
@end macro

@macro redefineothermacro {arg}
@unmacro othermacro
@macro othermacro
different
@end macro
\\arg\\
@end macro

@unmacro othermacro
@macro othermacro
different
@end macro
different
';


$result_texts{'arg_body_expansion_order'} = '

different
';

$result_errors{'arg_body_expansion_order'} = '';

$result_nodes_list{'arg_body_expansion_order'} = '';

$result_sections_list{'arg_body_expansion_order'} = '';

$result_sectioning_root{'arg_body_expansion_order'} = '';

$result_headings_list{'arg_body_expansion_order'} = '';

1;
