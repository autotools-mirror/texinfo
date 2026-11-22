use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'space_macro_after_end'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C3
   *normal_command@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{spaces}
    *arguments_line C1
     {macro_line: spaces\\n}
    {raw:  \\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@html C3 l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:in html\\n}
    *normal_command@end C1 l7
    |EXTRA
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:   }
      >SOURCEMARKS
      >macro_expansion<start;1><p:1>
       >*macro_call@spaces C1
        >*brace_arg
      >macro_expansion<end;1><p:3>
';


$result_texis{'space_macro_after_end'} = '@macro spaces
  
@end macro

@html
in html
@end html   ';


$result_texts{'space_macro_after_end'} = '
in html
';

$result_errors{'space_macro_after_end'} = '';

$result_nodes_list{'space_macro_after_end'} = '';

$result_sections_list{'space_macro_after_end'} = '';

$result_sectioning_root{'space_macro_after_end'} = '';

$result_headings_list{'space_macro_after_end'} = '';

1;
