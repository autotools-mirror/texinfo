use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'heading_between'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C1
   *@settitle C1 l1
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:heading between}
     {spaces_after_argument:\\n}
 *@node C1 l2 {Chapter}
 |EXTRA
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *@chapter C4 l3 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@subsubheading C1 l5
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Topic}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l7 {Section}
 |EXTRA
 |identifier:{Section}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
 *@section C2 l8 {Section}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'heading_between'} = '@settitle heading between
@node Chapter
@chapter Chapter

@subsubheading Topic

@node Section
@section Section

';


$result_texts{'heading_between'} = '1 Chapter
*********

Topic
.....

1.1 Section
===========

';

$result_errors{'heading_between'} = '';

$result_nodes_list{'heading_between'} = '1|Chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
2|Section
 associated_section: 1.1 Section
 associated_title_command: 1.1 Section
 node_directions:
  up->Chapter
';

$result_sections_list{'heading_between'} = '1|Chapter
 associated_anchor_command: Chapter
 associated_node: Chapter
 section_children:
  1|Section
2|Section
 associated_anchor_command: Section
 associated_node: Section
 section_directions:
  up->Chapter
';

$result_sectioning_root{'heading_between'} = 'level: 0
list:
 1|Chapter
';

$result_headings_list{'heading_between'} = '1|Topic
';

1;
