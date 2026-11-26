use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'file_name_conflict_with_Top'} = '*document_root C5
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
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
 *normal_command@node C1 l4 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l5 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l7
  |identifier:{index}
  |is_target:{1}
   *brace_arg C1
    {normal_text:index}
  {spaces_after_close_brace:\\n}
';


$result_texis{'file_name_conflict_with_Top'} = '@node Top
@top top

@node Chapter
@chapter Chap

@anchor{index}
';


$result_texts{'file_name_conflict_with_Top'} = 'top
***

1 Chap
******

';

$result_errors{'file_name_conflict_with_Top'} = '';

$result_nodes_list{'file_name_conflict_with_Top'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chapter
2|Chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'file_name_conflict_with_Top'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: Chapter
 associated_node: Chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'file_name_conflict_with_Top'} = 'level: -1
list:
 1|top
';

$result_headings_list{'file_name_conflict_with_Top'} = '';

$result_converted_errors{'file_html'}->{'file_name_conflict_with_Top'} = '* W l7|@anchor `index\' file index.html for redirection exists
 warning: @anchor `index\' file index.html for redirection exists

* WC |conflict with Top file
 warning: conflict with Top file

';

1;
