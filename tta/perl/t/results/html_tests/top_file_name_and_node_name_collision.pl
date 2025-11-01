use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'top_file_name_and_node_name_collision'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {my node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{my-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {my node}
 *@chapter C2 l2 {chap my node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap my node}
  {empty_line:\\n}
 *@node C1 l4 {other node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{other-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {other node}
 *@chapter C2 l5 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
  {empty_line:\\n}
 *@top C2 l7 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
';


$result_texis{'top_file_name_and_node_name_collision'} = '@node my node
@chapter chap my node

@node other node
@chapter chapter

@top top

';


$result_texts{'top_file_name_and_node_name_collision'} = '1 chap my node
**************

2 chapter
*********

top
***

';

$result_errors{'top_file_name_and_node_name_collision'} = '* W l7|lowering the section level of @top appearing after a lower element
 warning: lowering the section level of @top appearing after a lower element

';

$result_nodes_list{'top_file_name_and_node_name_collision'} = '1|my node
 associated_section: 1 chap my node
 associated_title_command: 1 chap my node
 node_directions:
  next->other node
2|other node
 associated_section: 2 chapter
 associated_title_command: 2 chapter
 node_directions:
  prev->my node
';

$result_sections_list{'top_file_name_and_node_name_collision'} = '1|chap my node
 associated_anchor_command: my node
 associated_node: my node
 section_directions:
  next->chapter
 toplevel_directions:
  next->chapter
2|chapter
 associated_anchor_command: other node
 associated_node: other node
 section_directions:
  next->top
  prev->chap my node
 toplevel_directions:
  next->top
  prev->chap my node
3|top
 section_directions:
  prev->chapter
 toplevel_directions:
  prev->chapter
';

$result_sectioning_root{'top_file_name_and_node_name_collision'} = 'level: 0
list:
 1|chap my node
 2|chapter
 3|top
';

$result_headings_list{'top_file_name_and_node_name_collision'} = '';

1;
