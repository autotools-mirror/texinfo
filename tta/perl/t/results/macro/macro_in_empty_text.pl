use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_empty_text'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{emptystring}
    *arguments_line C1
     {macro_line: emptystring\\n}
    {raw:\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *@indentedblock C3 l5
   *arguments_line C1
    *block_line_arg C1
    >SOURCEMARKS
    >macro_expansion<start;1>
     >*macro_call@emptystring C1
      >*brace_arg
    >macro_expansion<end;1>
     {spaces_before_argument:\\n}
   *paragraph C2
    *@@
    {normal_text:.\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{indentedblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:indentedblock}
     {spaces_after_argument:\\n}
';


$result_texis{'macro_in_empty_text'} = '@macro emptystring

@end macro

@indentedblock
@@.
@end indentedblock
';


$result_texts{'macro_in_empty_text'} = '
@.
';

$result_errors{'macro_in_empty_text'} = '';

$result_nodes_list{'macro_in_empty_text'} = '';

$result_sections_list{'macro_in_empty_text'} = '';

$result_sectioning_root{'macro_in_empty_text'} = '';

$result_headings_list{'macro_in_empty_text'} = '';

1;
