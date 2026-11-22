use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'simple_imbricated_macro'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content C2
   *normal_command@macro C6 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{truc}
    *arguments_line C1
     {macro_line: truc {}\\n}
    {raw:truc.\\n}
    {raw:@macro bidule {}\\n}
    {raw:bidule.\\n}
    {raw:@end macro\\n}
    *normal_command@end C1 l6
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   {normal_text:truc.\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@truc C1
     >*brace_arg
   *normal_command@macro C3 l8:@truc
   |EXTRA
   |formal_args:A{}
   |macro_name:{bidule}
    *arguments_line C1
     {macro_line: bidule {}\\n}
    {raw:bidule.\\n}
    *normal_command@end C1 l8:@truc
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      >SOURCEMARKS
      >macro_expansion<end;1><p:5>
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:bidule.\\n}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@bidule C1
     >*brace_arg
   >macro_expansion<end;2><p:7>
';


$result_texis{'simple_imbricated_macro'} = '@macro truc {}
truc.
@macro bidule {}
bidule.
@end macro
@end macro

truc.
@macro bidule {}
bidule.
@end macro

bidule.
';


$result_texts{'simple_imbricated_macro'} = '
truc.

bidule.
';

$result_errors{'simple_imbricated_macro'} = '';

$result_nodes_list{'simple_imbricated_macro'} = '';

$result_sections_list{'simple_imbricated_macro'} = '';

$result_sectioning_root{'simple_imbricated_macro'} = '';

$result_headings_list{'simple_imbricated_macro'} = '';

1;
