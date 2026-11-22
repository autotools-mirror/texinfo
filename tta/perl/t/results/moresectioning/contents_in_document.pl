use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'contents_in_document'} = '*document_root C4
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
 *normal_command@top C4 l2 {contents in document}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:contents in document}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@contents C1 l4
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C1 l6 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
';


$result_texis{'contents_in_document'} = '@node Top
@top contents in document

@contents

@chapter chap
';


$result_texts{'contents_in_document'} = 'contents in document
********************


1 chap
******
';

$result_errors{'contents_in_document'} = '';

$result_nodes_list{'contents_in_document'} = '1|Top
 associated_section: contents in document
 associated_title_command: contents in document
';

$result_sections_list{'contents_in_document'} = '1|contents in document
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 section_directions:
  up->contents in document
 toplevel_directions:
  prev->contents in document
  up->contents in document
';

$result_sectioning_root{'contents_in_document'} = 'level: -1
list:
 1|contents in document
';

$result_headings_list{'contents_in_document'} = '';

1;
