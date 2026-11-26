use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'punctuation_and_upper_case'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C2
   {normal_text:Question?  GAAA.\\n}
   {normal_text:BBB. b\\n}
';


$result_texis{'punctuation_and_upper_case'} = 'Question?  GAAA.
BBB. b
';


$result_texts{'punctuation_and_upper_case'} = 'Question?  GAAA.
BBB. b
';

$result_errors{'punctuation_and_upper_case'} = '';

$result_nodes_list{'punctuation_and_upper_case'} = '';

$result_sections_list{'punctuation_and_upper_case'} = '';

$result_sectioning_root{'punctuation_and_upper_case'} = '';

$result_headings_list{'punctuation_and_upper_case'} = '';


$result_converted{'plaintext'}->{'punctuation_and_upper_case'} = 'Question?  GAAA. BBB. b
';

1;
