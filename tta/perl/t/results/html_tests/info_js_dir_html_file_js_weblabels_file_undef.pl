use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'info_js_dir_html_file_js_weblabels_file_undef'} = '*document_root C5
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l5 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
';


$result_texis{'info_js_dir_html_file_js_weblabels_file_undef'} = '@node top
@top top

@node chap
@chapter Chapter
';


$result_texts{'info_js_dir_html_file_js_weblabels_file_undef'} = 'top
***

1 Chapter
*********
';

$result_errors{'info_js_dir_html_file_js_weblabels_file_undef'} = '';

$result_nodes_list{'info_js_dir_html_file_js_weblabels_file_undef'} = '1|top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->top
  up->top
';

$result_sections_list{'info_js_dir_html_file_js_weblabels_file_undef'} = '1|top
 associated_anchor_command: top
 associated_node: top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'info_js_dir_html_file_js_weblabels_file_undef'} = 'level: -1
list:
 1|top
';

$result_headings_list{'info_js_dir_html_file_js_weblabels_file_undef'} = '';

1;
