use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comma_in_added_node_for_sectioning_command'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
 |added:{1}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l1 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l3 {Titles (headers@comma{} footers)}
 |EXTRA
 |added:{1}
 |identifier:{Titles-_0028headers_002c-footers_0029}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:Titles (headers}
    *normal_command@comma C1
     *brace_container
    {normal_text: footers)}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l3 {Titles (headers, footers)}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Titles (headers, footers)}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'comma_in_added_node_for_sectioning_command'} = '@node Top
@top top

@node Titles (headers@comma{} footers)
@chapter Titles (headers, footers)

';


$result_texts{'comma_in_added_node_for_sectioning_command'} = 'top
***

1 Titles (headers, footers)
***************************

';

$result_errors{'comma_in_added_node_for_sectioning_command'} = '';

$result_nodes_list{'comma_in_added_node_for_sectioning_command'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Titles (headers@comma{} footers)
2|Titles (headers@comma{} footers)
 associated_section: 1 Titles (headers, footers)
 associated_title_command: 1 Titles (headers, footers)
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'comma_in_added_node_for_sectioning_command'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Titles (headers, footers)
 section_children:
  1|Titles (headers, footers)
2|Titles (headers, footers)
 associated_anchor_command: Titles (headers@comma{} footers)
 associated_node: Titles (headers@comma{} footers)
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'comma_in_added_node_for_sectioning_command'} = 'level: -1
list:
 1|top
';

$result_headings_list{'comma_in_added_node_for_sectioning_command'} = '';


$result_converted{'info'}->{'comma_in_added_node_for_sectioning_command'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: Titles (headers, footers),  Up: (dir)

top
***

* Menu:

* Titles (headers, footers)::


File: ,  Node: Titles (headers, footers),  Prev: Top,  Up: Top

1 Titles (headers, footers)
***************************


Tag Table:
Node: Top27
Node: Titles (headers, footers)146

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'comma_in_added_node_for_sectioning_command'} = '* W l3|node name should not contain `,\': Titles (headers, footers)
 warning: node name should not contain `,\': Titles (headers, footers)

';

1;
