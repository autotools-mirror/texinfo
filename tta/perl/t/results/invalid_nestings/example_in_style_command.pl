use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'example_in_style_command'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *paragraph C1
   *normal_command@code C1 l1
    *brace_container C1
     {normal_text:\\n}
  *normal_command@example C3 l2
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:example\\n}
   *normal_command@end C1 l4
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'example_in_style_command'} = '@code{
}@example
example
@end example
';


$result_texts{'example_in_style_command'} = '
example
';

$result_errors{'example_in_style_command'} = '* E l1|@code missing closing brace
 @code missing closing brace

* E l5|misplaced }
 misplaced }

';

$result_nodes_list{'example_in_style_command'} = '';

$result_sections_list{'example_in_style_command'} = '';

$result_sectioning_root{'example_in_style_command'} = '';

$result_headings_list{'example_in_style_command'} = '';

1;
