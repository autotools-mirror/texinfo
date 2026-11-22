use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'css_in_node_redirection_page'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@documentlanguage C1 l1
   |EXTRA
   |global_command_number:{1}
   |text_arg:{en}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:en}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C3 l4 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *normal_command@sansserif C1 l6
    *brace_container C1
     {normal_text:SANS}
   {normal_text:.\\n}
   *normal_command@anchor C1 l7
   |EXTRA
   |identifier:{spot}
   |is_target:{1}
    *brace_arg C1
     {normal_text:spot}
   {spaces_after_close_brace:\\n}
';


$result_texis{'css_in_node_redirection_page'} = '@documentlanguage en

@node Top
@top top

@sansserif{SANS}.
@anchor{spot}
';


$result_texts{'css_in_node_redirection_page'} = '
top
***

SANS.
';

$result_errors{'css_in_node_redirection_page'} = '';

$result_nodes_list{'css_in_node_redirection_page'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'css_in_node_redirection_page'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'css_in_node_redirection_page'} = 'level: -1
list:
 1|top
';

$result_headings_list{'css_in_node_redirection_page'} = '';

1;
