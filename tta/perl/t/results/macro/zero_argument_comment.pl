use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'zero_argument_comment'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C3
   *@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{foo}
    *arguments_line C1
     {macro_line: foo {}@c foo c\\n}
    {raw:in foo\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@macro C3 l5
   |EXTRA
   |formal_args:A{}
   |macro_name:{abar}
    *arguments_line C1
     {macro_line: abar@comment bar comment\\n}
    {raw:in bar\\n}
    *@end C1 l7
    |EXTRA
    |text_arg:{macro}
     *line_arg C2
      {spaces_before_argument: }
      {normal_text:macro}
';


$result_texis{'zero_argument_comment'} = '@macro foo {}@c foo c
in foo
@end macro

@macro abar@comment bar comment
in bar
@end macro';


$result_texts{'zero_argument_comment'} = '
';

$result_errors{'zero_argument_comment'} = '';

$result_nodes_list{'zero_argument_comment'} = '';

$result_sections_list{'zero_argument_comment'} = '';

$result_sectioning_root{'zero_argument_comment'} = '';

$result_headings_list{'zero_argument_comment'} = '';

1;
