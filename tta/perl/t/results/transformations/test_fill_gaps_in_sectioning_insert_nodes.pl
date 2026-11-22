use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_fill_gaps_in_sectioning_insert_nodes'} = '*document_root C11
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
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
 *@top C2 l1 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l3 {Chap}
 |EXTRA
 |added:{1}
 |identifier:{Chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
 *@chapter C2 l3 {Chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l5 {Section}
 |EXTRA
 |added:{1}
 |identifier:{Section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
 *@section C2 l5 {Section}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 {@asis{} [+1+]}
 |EXTRA
 |added:{1}
 |identifier:{-_005b_002b1_002b_005d}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    *@asis C1
     *brace_container
    {normal_text: [+1+]}
    {spaces_after_argument:\\n}
 *@unnumberedsubsec C2 {@asis{}}
 |EXTRA
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *@asis C1
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l7 {There}
 |EXTRA
 |added:{1}
 |identifier:{There}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:There}
    {spaces_after_argument:\\n}
 *@subsubsection C1 l7 {There}
 |EXTRA
 |section_level:{4}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:There}
    {spaces_after_argument:\\n}
';


$result_texis{'test_fill_gaps_in_sectioning_insert_nodes'} = '@node Top
@top top

@node Chap
@chapter Chap

@node Section
@section Section

@node @asis{} [+1+]
@unnumberedsubsec @asis{}

@node There
@subsubsection There
';


$result_texts{'test_fill_gaps_in_sectioning_insert_nodes'} = 'top
***

1 Chap
******

1.1 Section
===========


There
.....
';

$result_errors{'test_fill_gaps_in_sectioning_insert_nodes'} = '';

$result_nodes_list{'test_fill_gaps_in_sectioning_insert_nodes'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chap
2|Chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
3|Section
 associated_section: 1.1 Section
 associated_title_command: 1.1 Section
 node_directions:
  up->Chap
4|@asis{} [+1+]
 associated_section: @asis{}
 associated_title_command: @asis{}
 node_directions:
  up->Section
5|There
 associated_section: There
 associated_title_command: There
 node_directions:
  up->@asis{} [+1+]
';

$result_sections_list{'test_fill_gaps_in_sectioning_insert_nodes'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: Chap
 associated_node: Chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|Section
3|Section
 associated_anchor_command: Section
 associated_node: Section
 section_directions:
  up->Chap
 section_children:
  1|@asis{}
4|@asis{}
 associated_anchor_command: @asis{} [+1+]
 associated_node: @asis{} [+1+]
 section_directions:
  up->Section
 section_children:
  1|There
5|There
 associated_anchor_command: There
 associated_node: There
 section_directions:
  up->@asis{}
';

$result_sectioning_root{'test_fill_gaps_in_sectioning_insert_nodes'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_fill_gaps_in_sectioning_insert_nodes'} = '';

1;
