use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'auto_with_part_up_explicit'} = '*document_root C6
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {sec top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@part C2 l4 {PRT}
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:PRT}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {chap}
 |added:{1}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l6 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
';


$result_texis{'auto_with_part_up_explicit'} = '@node Top
@top sec top

@part PRT

@node chap
@chapter chap
';


$result_texts{'auto_with_part_up_explicit'} = 'sec top
*******

PRT
***

1 chap
******
';

$result_errors{'auto_with_part_up_explicit'} = '* W l6|modifying node relations of `Top\' to reference `chap\'
 warning: modifying node relations of `Top\' to reference `chap\'

';

$result_nodes_list{'auto_with_part_up_explicit'} = '1|Top
 associated_section: sec top
 associated_title_command: sec top
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'auto_with_part_up_explicit'} = '1|sec top
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->PRT
 toplevel_directions:
  next->chap
2|PRT
 part_associated_section: 1 chap
 section_directions:
  prev->sec top
 section_children:
  1|chap
3|chap
 associated_anchor_command: chap
 associated_node: chap
 associated_part: PRT
 section_directions:
  up->PRT
 toplevel_directions:
  prev->sec top
  up->sec top
';

$result_sectioning_root{'auto_with_part_up_explicit'} = 'level: -1
list:
 1|sec top
 2|PRT
';

$result_headings_list{'auto_with_part_up_explicit'} = '';


$result_converted{'info'}->{'auto_with_part_up_explicit'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)

sec top
*******

* Menu:

Part: PRT

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 chap
******


Tag Table:
Node: Top27
Node: chap121

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
