use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'two_lines'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   {normal_text:text l 1\\n}
   {normal_text:text l 2\\n}
';


$result_texis{'two_lines'} = 'text l 1
text l 2
';


$result_texts{'two_lines'} = 'text l 1
text l 2
';

$result_errors{'two_lines'} = '';

$result_nodes_list{'two_lines'} = '';

$result_sections_list{'two_lines'} = '';

$result_sectioning_root{'two_lines'} = '';

$result_headings_list{'two_lines'} = '';


$result_converted{'plaintext'}->{'two_lines'} = 'text l 1 text l 2
';


$result_converted{'html_text'}->{'two_lines'} = '<p>text l 1
text l 2
</p>';

1;
