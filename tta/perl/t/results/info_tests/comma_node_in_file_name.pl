use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comma_node_in_file_name'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@setfilename C1 l1
   |text_arg:{before_comma, Node: after_node.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:before_comma, Node: after_node.info}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l4 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l6
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{chap}
     {normal_text:chap}
   {normal_text:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l8 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l9 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Arrived in Chapter.\\n}
';


$result_texis{'comma_node_in_file_name'} = '@setfilename before_comma, Node: after_node.info

@node Top
@top top

@xref{chap}

@node chap
@chapter Chap

Arrived in Chapter.
';


$result_texts{'comma_node_in_file_name'} = '
top
***

chap

1 Chap
******

Arrived in Chapter.
';

$result_errors{'comma_node_in_file_name'} = '';

$result_nodes_list{'comma_node_in_file_name'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'comma_node_in_file_name'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'comma_node_in_file_name'} = 'level: -1
list:
 1|top
';

$result_headings_list{'comma_node_in_file_name'} = '';


$result_converted{'info'}->{'comma_node_in_file_name'} = Encode::encode('utf-8', 'This is before_comma, Node: after_node.info, produced from .


File: before_comma, Node: after_node.info,  Node: Top,  Next: chap,  Up: (dir)

top
***

*Note chap::

* Menu:

* chap::


File: before_comma, Node: after_node.info,  Node: chap,  Prev: Top,  Up: Top

1 Chap
******

Arrived in Chapter.


Tag Table:
Node: Top62
Node: chap188

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
