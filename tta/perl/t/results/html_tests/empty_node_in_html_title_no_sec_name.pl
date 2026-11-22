use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_node_in_html_title_no_sec_name'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
 *@chapter C1 l5 {chap}
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


$result_texis{'empty_node_in_html_title_no_sec_name'} = '@node Top
@top top

@node
@chapter chap
';


$result_texts{'empty_node_in_html_title_no_sec_name'} = 'top
***

1 chap
******
';

$result_errors{'empty_node_in_html_title_no_sec_name'} = '* E l4|empty argument in @node
 empty argument in @node

';

$result_nodes_list{'empty_node_in_html_title_no_sec_name'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'empty_node_in_html_title_no_sec_name'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'empty_node_in_html_title_no_sec_name'} = 'level: -1
list:
 1|top
';

$result_headings_list{'empty_node_in_html_title_no_sec_name'} = '';

1;
