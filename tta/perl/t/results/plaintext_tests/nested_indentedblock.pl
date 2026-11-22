use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_indentedblock'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *normal_command@example C4 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:in example\\n}
   *normal_command@indentedblock C3 l3
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:   f  f  f``g\\n}
    *normal_command@end C1 l5
    |text_arg:{indentedblock}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:indentedblock}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l6
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@indentedblock C5 l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {spaces_before_paragraph:   }
   *paragraph C1
    {normal_text:v  v  v``a\\n}
   *normal_command@example C3 l10
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:in example\\n}
    *normal_command@end C1 l12
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l13
   |text_arg:{indentedblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:indentedblock}
     {spaces_after_argument:\\n}
';


$result_texis{'nested_indentedblock'} = '@example
in example
@indentedblock
   f  f  f``g
@end indentedblock
@end example

@indentedblock
   v  v  v``a
@example
in example
@end example
@end indentedblock
';


$result_texts{'nested_indentedblock'} = 'in example
   f  f  f``g

v  v  v"a
in example
';

$result_errors{'nested_indentedblock'} = '';

$result_nodes_list{'nested_indentedblock'} = '';

$result_sections_list{'nested_indentedblock'} = '';

$result_sectioning_root{'nested_indentedblock'} = '';

$result_headings_list{'nested_indentedblock'} = '';


$result_converted{'plaintext'}->{'nested_indentedblock'} = '     in example
             f  f  f``g

     v v v"a
          in example
';

1;
