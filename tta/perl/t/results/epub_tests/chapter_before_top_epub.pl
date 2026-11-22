use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'chapter_before_top_epub'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content
 *@node C2 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l3 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *@chapter C2 l4 {chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@part C2 l6 {part}
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@top C1 l8 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
';


$result_texis{'chapter_before_top_epub'} = '@node Top

@node chapter
@chapter chapter

@part part

@top top
';


$result_texts{'chapter_before_top_epub'} = '
1 chapter
*********

part
****

top
***
';

$result_errors{'chapter_before_top_epub'} = '* W l6|@part should not be associated with @top
 warning: @part should not be associated with @top

';

$result_nodes_list{'chapter_before_top_epub'} = '1|Top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->Top
';

$result_sections_list{'chapter_before_top_epub'} = '1|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 toplevel_directions:
  next->top
2|part
 part_associated_section: top
 section_directions:
  next->top
3|top
 associated_part: part
 section_directions:
  prev->part
 toplevel_directions:
  prev->chapter
';

$result_sectioning_root{'chapter_before_top_epub'} = 'level: -1
list:
 1|chapter
 2|part
 3|top
';

$result_headings_list{'chapter_before_top_epub'} = '';

1;
