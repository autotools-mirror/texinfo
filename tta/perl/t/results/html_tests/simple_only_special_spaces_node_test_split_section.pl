use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'simple_only_special_spaces_node_test_split_section'} = 'U0 unit{S:top}{n:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section C1
  *preamble_before_content
 *@node C1 simple_only_special_spaces_node.texi:l1 {Top}
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
 *@top C2 simple_only_special_spaces_node.texi:l2 {top}
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
U1 unit{S:1 EN QUAD| |}{n:  }
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U2]
FastBack: [U0]
Next: [U2]
Up: [U0]
NodePrev: [U0]
NodeUp: [U0]
NodeBack: [U0]
 *@node C1 simple_only_special_spaces_node.texi:l4 {  }
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{_2002_2003}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {  }
 *@chapter C2 simple_only_special_spaces_node.texi:l5 {EN QUAD| |}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {EN QUAD| |}
  {empty_line:\\n}
 *@node C1 simple_only_special_spaces_node.texi:l7
  *arguments_line C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: '."\r".'\\n}
U2 unit{S:2 CARRIAGE RETURN|'."\r".'|}
unit_directions:D[next->[U3]|prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Forward: [U3]
Back: [U1]
FastForward: [U3]
FastBack: [U1]
Next: [U3]
Prev: [U1]
Up: [U0]
 *@chapter C2 simple_only_special_spaces_node.texi:l8 {CARRIAGE RETURN|'."\r".'|}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {CARRIAGE RETURN|'."\r".'|}
  {empty_line:\\n}
U3 unit{S:3 THREE-PER-EM SPACE}{n:  }
unit_directions:D[prev->[U2]]
UNIT_DIRECTIONS
This: [U3]
Back: [U2]
FastBack: [U2]
Prev: [U2]
Up: [U0]
NodeUp: [U0]
 *@node C1 simple_only_special_spaces_node.texi:l10 {  }
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{_2004_2005}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {  }
 *@chapter C2 simple_only_special_spaces_node.texi:l11 {THREE-PER-EM SPACE}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {THREE-PER-EM SPACE}
  {empty_line:\\n}
';


$result_texis{'simple_only_special_spaces_node_test_split_section'} = '@node Top
@top top

@node   
@chapter EN QUAD| |

@node '."\r".'
@chapter CARRIAGE RETURN|'."\r".'|

@node   
@chapter THREE-PER-EM SPACE

';


$result_texts{'simple_only_special_spaces_node_test_split_section'} = 'top
***

1 EN QUAD| |
************

2 CARRIAGE RETURN|'."\r".'|
*******************

3 THREE-PER-EM SPACE
********************

';

$result_errors{'simple_only_special_spaces_node_test_split_section'} = '* E simple_only_special_spaces_node.texi:l7|empty argument in @node
 empty argument in @node

';

$result_nodes_list{'simple_only_special_spaces_node_test_split_section'} = '1|Top
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

$result_sections_list{'simple_only_special_spaces_node_test_split_section'} = '1|top
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

$result_sectioning_root{'simple_only_special_spaces_node_test_split_section'} = 'level: -1
list:
 1|top
';

$result_headings_list{'simple_only_special_spaces_node_test_split_section'} = '';

1;
