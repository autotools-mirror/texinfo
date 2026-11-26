use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'parenthesis_in_node_name_implicit_refs'} = '*document_root C7
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
 *normal_command@top C4 l2
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in top.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {One:}
 |identifier:{One_003a}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:One:}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l7 {One:}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:One:}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:AA.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l11 {@asis{(}Two)}
 |added:{1}
 |identifier:{_0028Two_0029}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    *normal_command@asis C1
     *brace_container C1
      {normal_text:(}
    {normal_text:Two)}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l11 {(Two)}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:(Two)}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:AA.\\n}
';


$result_texis{'parenthesis_in_node_name_implicit_refs'} = '@node Top
@top

in top.

@node One:
@chapter One:

AA.

@node @asis{(}Two)
@chapter (Two)

AA.
';


$result_texts{'parenthesis_in_node_name_implicit_refs'} = '
in top.

1 One:
******

AA.

2 (Two)
*******

AA.
';

$result_errors{'parenthesis_in_node_name_implicit_refs'} = '';

$result_nodes_list{'parenthesis_in_node_name_implicit_refs'} = '1|Top
 associated_section
 associated_title_command
 node_directions:
  next->One:
2|One:
 associated_section: 1 One:
 associated_title_command: 1 One:
 node_directions:
  next->@asis{(}Two)
  prev->Top
  up->Top
3|@asis{(}Two)
 associated_section: 2 (Two)
 associated_title_command: 2 (Two)
 node_directions:
  prev->One:
  up->Top
';

$result_sections_list{'parenthesis_in_node_name_implicit_refs'} = '1
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->One:
 section_children:
  1|One:
  2|(Two)
2|One:
 associated_anchor_command: One:
 associated_node: One:
 section_directions:
  next->(Two)
  up->
 toplevel_directions:
  next->(Two)
  prev->
  up->
3|(Two)
 associated_anchor_command: @asis{(}Two)
 associated_node: @asis{(}Two)
 section_directions:
  prev->One:
  up->
 toplevel_directions:
  prev->One:
  up->
';

$result_sectioning_root{'parenthesis_in_node_name_implicit_refs'} = 'level: -1
list:
 1|
';

$result_headings_list{'parenthesis_in_node_name_implicit_refs'} = '';


$result_converted{'info'}->{'parenthesis_in_node_name_implicit_refs'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: One:,  Up: (dir)

in top.

* Menu:

* One:::
* (Two)::


File: ,  Node: One:,  Next: (Two),  Prev: Top,  Up: Top

1 One:
******

AA.


File: ,  Node: (Two),  Prev: One:,  Up: Top

2 (Two)
*******

AA.


Tag Table:
Node: Top27
Node: One:116
Node: (Two)197

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'parenthesis_in_node_name_implicit_refs'} = '* W l6|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

';

1;
