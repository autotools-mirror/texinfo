use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'end_sentence_upper_case_in_ref'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C6 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l4
  |EXTRA
  |identifier:{LINKS}
  |is_target:{1}
   *brace_arg C1
    {normal_text:LINKS}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Some text known to work correctly, define function is available cut }
   *normal_command@ref C1 l6
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{LINKS}
     {normal_text:LINKS}
   {normal_text:.  Something more.\\n}
';


$result_texis{'end_sentence_upper_case_in_ref'} = '@node Top
@top top

@anchor{LINKS}

Some text known to work correctly, define function is available cut @ref{LINKS}.  Something more.
';


$result_texts{'end_sentence_upper_case_in_ref'} = 'top
***


Some text known to work correctly, define function is available cut LINKS.  Something more.
';

$result_errors{'end_sentence_upper_case_in_ref'} = '';

$result_nodes_list{'end_sentence_upper_case_in_ref'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'end_sentence_upper_case_in_ref'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'end_sentence_upper_case_in_ref'} = 'level: -1
list:
 1|top
';

$result_headings_list{'end_sentence_upper_case_in_ref'} = '';


$result_converted{'plaintext'}->{'end_sentence_upper_case_in_ref'} = 'top
***

Some text known to work correctly, define function is available cut
LINKS. Something more.
';

1;
