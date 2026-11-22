use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_without_node_texi2html_no_use_nodes'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content
 *normal_command@top C3 l1 {top section}
 |EXTRA
 |identifier:{top-section}
 |is_target:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Top section\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {second}
 |EXTRA
 |identifier:{second}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:second}
   *line_arg
   *line_arg
   *line_arg C4
   |EXTRA
   |manual_content:A{1|1}
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l5 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Text of chapter\\n}
';


$result_texis{'top_without_node_texi2html_no_use_nodes'} = '@top top section
Top section

@node second,,,(dir)
@chapter Chapter

Text of chapter
';


$result_texts{'top_without_node_texi2html_no_use_nodes'} = 'top section
***********
Top section

1 Chapter
*********

Text of chapter
';

$result_errors{'top_without_node_texi2html_no_use_nodes'} = '';

$result_nodes_list{'top_without_node_texi2html_no_use_nodes'} = '1|second
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  up->(dir)

';

$result_sections_list{'top_without_node_texi2html_no_use_nodes'} = '1|top section
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: second
 associated_node: second
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'top_without_node_texi2html_no_use_nodes'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'top_without_node_texi2html_no_use_nodes'} = '';

1;
