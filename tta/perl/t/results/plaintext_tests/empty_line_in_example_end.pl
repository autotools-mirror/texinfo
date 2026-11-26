use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_line_in_example_end'} = '*document_root C1
 *before_node_section C4
  *preamble
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    {normal_text:in example\\n}
    {empty_line:\\n}
   *normal_command@end C1 l4
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:After line\\n}
';


$result_texis{'empty_line_in_example_end'} = '@example
in example

@end example

After line
';


$result_texts{'empty_line_in_example_end'} = 'in example


After line
';

$result_errors{'empty_line_in_example_end'} = '';

$result_nodes_list{'empty_line_in_example_end'} = '';

$result_sections_list{'empty_line_in_example_end'} = '';

$result_sectioning_root{'empty_line_in_example_end'} = '';

$result_headings_list{'empty_line_in_example_end'} = '';


$result_converted{'plaintext'}->{'empty_line_in_example_end'} = '     in example

   After line
';

1;
