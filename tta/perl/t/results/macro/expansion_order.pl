use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'expansion_order'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content C4
   *@macro C3 l1
   |EXTRA
   |formal_args:A{arg}
   |macro_name:{bidule}
    *arguments_line C1
     {macro_line: bidule{arg}\\n}
    {raw:@machin{}\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@macro C4 l5
   |EXTRA
   |formal_args:A{}
   |macro_name:{machin}
    *arguments_line C1
     {macro_line: machin\\n}
    {raw:\\\\arg\\\\\\n}
    {raw:\\n}
    *@end C1 l8
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:\\arg\\\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@bidule C1
     >*brace_arg C1
      >{macro_call_arg_text:ab}
   >macro_expansion<start;2>
    >*macro_call@machin C1
     >*brace_arg
   >macro_expansion<end;2><p:6>
   >macro_expansion<end;1><p:6>
  {empty_line:\\n}
';


$result_texis{'expansion_order'} = '@macro bidule{arg}
@machin{}
@end macro

@macro machin
\\\\arg\\\\

@end macro

\\arg\\

';


$result_texts{'expansion_order'} = '

\\arg\\

';

$result_errors{'expansion_order'} = '';

$result_nodes_list{'expansion_order'} = '';

$result_sections_list{'expansion_order'} = '';

$result_sectioning_root{'expansion_order'} = '';

$result_headings_list{'expansion_order'} = '';

1;
