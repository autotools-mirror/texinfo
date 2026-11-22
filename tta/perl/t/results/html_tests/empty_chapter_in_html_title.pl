use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_chapter_in_html_title'} = '*document_root C5
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
 *@node C1 l4 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *@chapter C1 l5
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'empty_chapter_in_html_title'} = '@node Top
@top top

@node chap
@chapter
';


$result_texts{'empty_chapter_in_html_title'} = 'top
***

1 
**
';

$result_errors{'empty_chapter_in_html_title'} = '* W l5|@chapter missing argument
 warning: @chapter missing argument

';

$result_nodes_list{'empty_chapter_in_html_title'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1
 associated_title_command: 1
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'empty_chapter_in_html_title'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->
 section_children:
  1|
2
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'empty_chapter_in_html_title'} = 'level: -1
list:
 1|top
';

$result_headings_list{'empty_chapter_in_html_title'} = '';

1;
