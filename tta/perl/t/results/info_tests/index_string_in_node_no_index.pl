use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'index_string_in_node_no_index'} = '*document_root C5
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
 *normal_command@top C2 l2 {t}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:t}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chap indeXaa}
 |identifier:{chap-indeXaa}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap indeXaa}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l5 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'index_string_in_node_no_index'} = '@node Top
@top t

@node chap indeXaa
@chapter chap

';


$result_texts{'index_string_in_node_no_index'} = 't
*

1 chap
******

';

$result_errors{'index_string_in_node_no_index'} = '';

$result_nodes_list{'index_string_in_node_no_index'} = '1|Top
 associated_section: t
 associated_title_command: t
 node_directions:
  next->chap indeXaa
2|chap indeXaa
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'index_string_in_node_no_index'} = '1|t
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap indeXaa
 associated_node: chap indeXaa
 section_directions:
  up->t
 toplevel_directions:
  prev->t
  up->t
';

$result_sectioning_root{'index_string_in_node_no_index'} = 'level: -1
list:
 1|t
';

$result_headings_list{'index_string_in_node_no_index'} = '';


$result_converted{'info'}->{'index_string_in_node_no_index'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap indeXaa,  Up: (dir)

t
*

* Menu:

* chap indeXaa::


File: ,  Node: chap indeXaa,  Prev: Top,  Up: Top

1 chap
******


Tag Table:
Ref: Index: _0
Node: Top27
Node: chap indeXaa114

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
