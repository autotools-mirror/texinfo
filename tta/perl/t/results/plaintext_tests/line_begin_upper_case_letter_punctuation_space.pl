use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'line_begin_upper_case_letter_punctuation_space'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   {normal_text:it read and process the user configuration file and connects to to the\\n}
   {normal_text: MTA. Of course, the client is not able to.\\n}
';


$result_texis{'line_begin_upper_case_letter_punctuation_space'} = 'it read and process the user configuration file and connects to to the
 MTA. Of course, the client is not able to.
';


$result_texts{'line_begin_upper_case_letter_punctuation_space'} = 'it read and process the user configuration file and connects to to the
 MTA. Of course, the client is not able to.
';

$result_errors{'line_begin_upper_case_letter_punctuation_space'} = '';

$result_nodes_list{'line_begin_upper_case_letter_punctuation_space'} = '';

$result_sections_list{'line_begin_upper_case_letter_punctuation_space'} = '';

$result_sectioning_root{'line_begin_upper_case_letter_punctuation_space'} = '';

$result_headings_list{'line_begin_upper_case_letter_punctuation_space'} = '';


$result_converted{'plaintext'}->{'line_begin_upper_case_letter_punctuation_space'} = 'it read and process the user configuration file and connects to to the
MTA. Of course, the client is not able to.
';

1;
