use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_chapter'} = '*document_root C5
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
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l5 {Chapter @anchor{point} after anchor}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C6
    {spaces_before_argument: }
    {normal_text:Chapter }
    *normal_command@anchor C1 l5
    |identifier:{point}
    |is_target:{1}
     *brace_arg C1
      {normal_text:point}
    {spaces_after_close_brace: }
    {normal_text:after anchor}
    {spaces_after_argument:\\n}
';


$result_texis{'anchor_in_chapter'} = '@node Top
@top top

@node chap
@chapter Chapter @anchor{point} after anchor
';


$result_texts{'anchor_in_chapter'} = 'top
***

1 Chapter after anchor
**********************
';

$result_errors{'anchor_in_chapter'} = '* W l5|@anchor should not appear on @chapter line
 warning: @anchor should not appear on @chapter line

';

$result_nodes_list{'anchor_in_chapter'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter @anchor{point} after anchor
 associated_title_command: 1 Chapter @anchor{point} after anchor
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'anchor_in_chapter'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter @anchor{point} after anchor
 section_children:
  1|Chapter @anchor{point} after anchor
2|Chapter @anchor{point} after anchor
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'anchor_in_chapter'} = 'level: -1
list:
 1|top
';

$result_headings_list{'anchor_in_chapter'} = '';


$result_converted{'info'}->{'anchor_in_chapter'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)

top
***

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 Chapter after anchor
**********************


Tag Table:
Node: Top27
Node: chap102
Ref: point156

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
