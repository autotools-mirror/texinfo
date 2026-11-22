use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'contents_at_begin_chapter_without_node'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@contents C1 l1
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l4 {contents at document begin}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:contents at document begin}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C1 l6 {chap}
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


$result_texis{'contents_at_begin_chapter_without_node'} = '@contents

@node Top
@top contents at document begin

@chapter chap
';


$result_texts{'contents_at_begin_chapter_without_node'} = '
contents at document begin
**************************

1 chap
******
';

$result_errors{'contents_at_begin_chapter_without_node'} = '';

$result_nodes_list{'contents_at_begin_chapter_without_node'} = '1|Top
 associated_section: contents at document begin
 associated_title_command: contents at document begin
';

$result_sections_list{'contents_at_begin_chapter_without_node'} = '1|contents at document begin
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 section_directions:
  up->contents at document begin
 toplevel_directions:
  prev->contents at document begin
  up->contents at document begin
';

$result_sectioning_root{'contents_at_begin_chapter_without_node'} = 'level: -1
list:
 1|contents at document begin
';

$result_headings_list{'contents_at_begin_chapter_without_node'} = '';

1;
