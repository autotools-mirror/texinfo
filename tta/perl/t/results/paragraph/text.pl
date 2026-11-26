use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C1
   {normal_text:text}
';


$result_texis{'text'} = 'text';


$result_texts{'text'} = 'text';

$result_errors{'text'} = '';

$result_nodes_list{'text'} = '';

$result_sections_list{'text'} = '';

$result_sectioning_root{'text'} = '';

$result_headings_list{'text'} = '';


$result_converted{'plaintext'}->{'text'} = 'text
';


$result_converted{'html_text'}->{'text'} = '<p>text</p>';

1;
