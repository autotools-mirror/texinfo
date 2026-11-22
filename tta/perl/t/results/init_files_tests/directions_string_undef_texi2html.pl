use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'directions_string_undef_texi2html'} = '*document_root C13
 *before_node_section C1
  *preamble_before_content
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
 *normal_command@chapter C2 l5 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {chap2}
 |identifier:{chap2}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap2}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l8 {Chap 2}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {sec1}
 |identifier:{sec1}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec1}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l11 {Sec 1}
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Sec 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l13 {sec2}
 |identifier:{sec2}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec2}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l14 {Sec 2}
 |section_heading_number:{2.2}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Sec 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l16 {sec3}
 |identifier:{sec3}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec3}
    {spaces_after_argument:\\n}
 *normal_command@section C1 l17 {Sec 3}
 |section_heading_number:{2.3}
 |section_level:{2}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Sec 3}
    {spaces_after_argument:\\n}
';


$result_texis{'directions_string_undef_texi2html'} = '@node Top
@top top

@node chap
@chapter Chap

@node chap2
@chapter Chap 2

@node sec1
@section Sec 1

@node sec2
@section Sec 2

@node sec3
@section Sec 3
';


$result_texts{'directions_string_undef_texi2html'} = 'top
***

1 Chap
******

2 Chap 2
********

2.1 Sec 1
=========

2.2 Sec 2
=========

2.3 Sec 3
=========
';

$result_errors{'directions_string_undef_texi2html'} = '';

$result_nodes_list{'directions_string_undef_texi2html'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  next->chap2
  prev->Top
  up->Top
3|chap2
 associated_section: 2 Chap 2
 associated_title_command: 2 Chap 2
 node_directions:
  prev->chap
  up->Top
4|sec1
 associated_section: 2.1 Sec 1
 associated_title_command: 2.1 Sec 1
 node_directions:
  next->sec2
  up->chap2
5|sec2
 associated_section: 2.2 Sec 2
 associated_title_command: 2.2 Sec 2
 node_directions:
  next->sec3
  prev->sec1
  up->chap2
6|sec3
 associated_section: 2.3 Sec 3
 associated_title_command: 2.3 Sec 3
 node_directions:
  prev->sec2
  up->chap2
';

$result_sections_list{'directions_string_undef_texi2html'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
  2|Chap 2
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  next->Chap 2
  up->top
 toplevel_directions:
  next->Chap 2
  prev->top
  up->top
3|Chap 2
 associated_anchor_command: chap2
 associated_node: chap2
 section_directions:
  prev->Chap
  up->top
 toplevel_directions:
  prev->Chap
  up->top
 section_children:
  1|Sec 1
  2|Sec 2
  3|Sec 3
4|Sec 1
 associated_anchor_command: sec1
 associated_node: sec1
 section_directions:
  next->Sec 2
  up->Chap 2
5|Sec 2
 associated_anchor_command: sec2
 associated_node: sec2
 section_directions:
  next->Sec 3
  prev->Sec 1
  up->Chap 2
6|Sec 3
 associated_anchor_command: sec3
 associated_node: sec3
 section_directions:
  prev->Sec 2
  up->Chap 2
';

$result_sectioning_root{'directions_string_undef_texi2html'} = 'level: -1
list:
 1|top
';

$result_headings_list{'directions_string_undef_texi2html'} = '';

1;
