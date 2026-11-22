use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'space_macro_after_end_verbatim'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{spaces}
    *arguments_line C1
     {macro_line: spaces\\n}
    {raw:\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@verbatim C3 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:in verbatim\\n}
   *normal_command@end C1 l7
   |EXTRA
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument: }
     >SOURCEMARKS
     >macro_expansion<start;1><p:1>
      >*macro_call@spaces C1
       >*brace_arg
     >macro_expansion<end;1><p:1>
';


$result_texis{'space_macro_after_end_verbatim'} = '@macro spaces

@end macro

@verbatim
in verbatim
@end verbatim ';


$result_texts{'space_macro_after_end_verbatim'} = '
in verbatim
';

$result_errors{'space_macro_after_end_verbatim'} = '';

$result_nodes_list{'space_macro_after_end_verbatim'} = '';

$result_sections_list{'space_macro_after_end_verbatim'} = '';

$result_sectioning_root{'space_macro_after_end_verbatim'} = '';

$result_headings_list{'space_macro_after_end_verbatim'} = '';

1;
