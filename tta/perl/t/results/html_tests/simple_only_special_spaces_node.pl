use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'simple_only_special_spaces_node'} = '*document_root C9
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 simple_only_special_spaces_node.texi:l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 simple_only_special_spaces_node.texi:l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 simple_only_special_spaces_node.texi:l4 {  }
 |EXTRA
 |identifier:{_2002_2003}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:  }
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 simple_only_special_spaces_node.texi:l5 {EN QUAD| |}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:EN QUAD| |}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 simple_only_special_spaces_node.texi:l7
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument: '."\r".'\\n}
 *normal_command@chapter C2 simple_only_special_spaces_node.texi:l8 {CARRIAGE RETURN|'."\r".'|}
 |EXTRA
 |identifier:{CARRIAGE-RETURN_007c-_007c}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:CARRIAGE RETURN|'."\r".'|}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 simple_only_special_spaces_node.texi:l10 {  }
 |EXTRA
 |identifier:{_2004_2005}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:  }
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 simple_only_special_spaces_node.texi:l11 {THREE-PER-EM SPACE}
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:THREE-PER-EM SPACE}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'simple_only_special_spaces_node'} = '@node Top
@top top

@node   
@chapter EN QUAD| |

@node '."\r".'
@chapter CARRIAGE RETURN|'."\r".'|

@node   
@chapter THREE-PER-EM SPACE

';


$result_texts{'simple_only_special_spaces_node'} = 'top
***

1 EN QUAD| |
************

2 CARRIAGE RETURN|'."\r".'|
*******************

3 THREE-PER-EM SPACE
********************

';

$result_errors{'simple_only_special_spaces_node'} = '* E simple_only_special_spaces_node.texi:l7|empty argument in @node
 empty argument in @node

';

$result_nodes_list{'simple_only_special_spaces_node'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->  
2|  
 associated_section: 1 EN QUAD| |
 associated_title_command: 1 EN QUAD| |
 node_directions:
  prev->Top
  up->Top
3|  
 associated_section: 3 THREE-PER-EM SPACE
 associated_title_command: 3 THREE-PER-EM SPACE
 node_directions:
  up->Top
';

$result_sections_list{'simple_only_special_spaces_node'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->EN QUAD| |
 section_children:
  1|EN QUAD| |
  2|CARRIAGE RETURN|'."\r".'|
  3|THREE-PER-EM SPACE
2|EN QUAD| |
 associated_anchor_command:   
 associated_node:   
 section_directions:
  next->CARRIAGE RETURN|'."\r".'|
  up->top
 toplevel_directions:
  next->CARRIAGE RETURN|'."\r".'|
  prev->top
  up->top
3|CARRIAGE RETURN|'."\r".'|
 section_directions:
  next->THREE-PER-EM SPACE
  prev->EN QUAD| |
  up->top
 toplevel_directions:
  next->THREE-PER-EM SPACE
  prev->EN QUAD| |
  up->top
4|THREE-PER-EM SPACE
 associated_anchor_command:   
 associated_node:   
 section_directions:
  prev->CARRIAGE RETURN|'."\r".'|
  up->top
 toplevel_directions:
  prev->CARRIAGE RETURN|'."\r".'|
  up->top
';

$result_sectioning_root{'simple_only_special_spaces_node'} = 'level: -1
list:
 1|top
';

$result_headings_list{'simple_only_special_spaces_node'} = '';

1;
