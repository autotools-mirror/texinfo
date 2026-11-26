use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'html_expanded'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C3
   {normal_text:Before\\n}
   *normal_command@html C3 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:html\\n}
    *normal_command@end C1 l4
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
   {normal_text:after.\\n}
';


$result_texis{'html_expanded'} = 'Before
@html
html
@end html
after.
';


$result_texts{'html_expanded'} = 'Before
html
after.
';

$result_errors{'html_expanded'} = '';

$result_nodes_list{'html_expanded'} = '';

$result_sections_list{'html_expanded'} = '';

$result_sectioning_root{'html_expanded'} = '';

$result_headings_list{'html_expanded'} = '';


$result_converted{'plaintext'}->{'html_expanded'} = 'Before html
after.
';

1;
