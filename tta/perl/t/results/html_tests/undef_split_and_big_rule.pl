use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'undef_split_and_big_rule'} = '*document_root C6
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   {normal_text:node Top\\n}
 *normal_command@top C2 l2 {top}
 |identifier:{Top}
 |is_target:{1}
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
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l5 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {sec}
 |identifier:{sec}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec}
    {spaces_after_argument:\\n}
 *normal_command@section C1 l8 {Sec}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Sec}
    {spaces_after_argument:\\n}
';


$result_texis{'undef_split_and_big_rule'} = 'node Top
@top top

@node chap
@chapter Chapter

@node sec
@section Sec
';


$result_texts{'undef_split_and_big_rule'} = 'node Top
top
***

1 Chapter
*********

1.1 Sec
=======
';

$result_errors{'undef_split_and_big_rule'} = '';

$result_nodes_list{'undef_split_and_big_rule'} = '1|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
2|sec
 associated_section: 1.1 Sec
 associated_title_command: 1.1 Sec
 node_directions:
  up->chap
';

$result_sections_list{'undef_split_and_big_rule'} = '1|top
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
 section_children:
  1|Sec
3|Sec
 associated_anchor_command: sec
 associated_node: sec
 section_directions:
  up->Chapter
';

$result_sectioning_root{'undef_split_and_big_rule'} = 'level: -1
list:
 1|top
';

$result_headings_list{'undef_split_and_big_rule'} = '';

1;
