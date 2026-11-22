use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_node_with_section_split'} = '*document_root C7
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
 *@top C2 l2 {aa}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:aa}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {one}
 |EXTRA
 |added:{1}
 |identifier:{one}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:one}
    {spaces_after_argument:\\n}
 *@chapter C2 l4 {one}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:one}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l6 {two}
 |EXTRA
 |added:{1}
 |identifier:{two}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:two}
    {spaces_after_argument:\\n}
 *@chapter C1 l6 {two}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:two}
    {spaces_after_argument:\\n}
';


$result_texis{'no_node_with_section_split'} = '@node Top
@top aa

@node one
@chapter one

@node two
@chapter two
';


$result_texts{'no_node_with_section_split'} = 'aa
**

1 one
*****

2 two
*****
';

$result_errors{'no_node_with_section_split'} = '';

$result_nodes_list{'no_node_with_section_split'} = '1|Top
 associated_section: aa
 associated_title_command: aa
 node_directions:
  next->one
2|one
 associated_section: 1 one
 associated_title_command: 1 one
 node_directions:
  next->two
  prev->Top
  up->Top
3|two
 associated_section: 2 two
 associated_title_command: 2 two
 node_directions:
  prev->one
  up->Top
';

$result_sections_list{'no_node_with_section_split'} = '1|aa
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->one
 section_children:
  1|one
  2|two
2|one
 associated_anchor_command: one
 associated_node: one
 section_directions:
  next->two
  up->aa
 toplevel_directions:
  next->two
  prev->aa
  up->aa
3|two
 associated_anchor_command: two
 associated_node: two
 section_directions:
  prev->one
  up->aa
 toplevel_directions:
  prev->one
  up->aa
';

$result_sectioning_root{'no_node_with_section_split'} = 'level: -1
list:
 1|aa
';

$result_headings_list{'no_node_with_section_split'} = '';

1;
