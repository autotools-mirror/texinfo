use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_chapter_in_html_title_no_node_no_use_nodes'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C2 l2 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
 *@chapter C1 l4
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
';


$result_texis{'empty_chapter_in_html_title_no_node_no_use_nodes'} = '@node Top
@top top

@chapter
';


$result_texts{'empty_chapter_in_html_title_no_node_no_use_nodes'} = 'top
***

1 
**
';

$result_errors{'empty_chapter_in_html_title_no_node_no_use_nodes'} = '* W l4|@chapter missing argument
 warning: @chapter missing argument

';

$result_nodes_list{'empty_chapter_in_html_title_no_node_no_use_nodes'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'empty_chapter_in_html_title_no_node_no_use_nodes'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->
 section_children:
  1|
2
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'empty_chapter_in_html_title_no_node_no_use_nodes'} = 'level: -1
list:
 1|top
';

$result_headings_list{'empty_chapter_in_html_title_no_node_no_use_nodes'} = '';

1;
