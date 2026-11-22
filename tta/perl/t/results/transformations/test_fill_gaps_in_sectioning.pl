use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_fill_gaps_in_sectioning'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content
 *normal_command@top C2 l1 {top}
 |identifier:{Top}
 |is_target:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 l3 {Chap}
 |identifier:{Chap}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C2 l5 {Section}
 |identifier:{Section}
 |is_target:{1}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@unnumberedsubsec C2 {@asis{}}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@asis C1
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@subsubsection C1 l7 {There}
 |identifier:{There}
 |is_target:{1}
 |section_level:{4}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:There}
    {spaces_after_argument:\\n}
';


$result_texis{'test_fill_gaps_in_sectioning'} = '@top top

@chapter Chap

@section Section

@unnumberedsubsec @asis{}

@subsubsection There
';


$result_texts{'test_fill_gaps_in_sectioning'} = 'top
***

1 Chap
******

1.1 Section
===========


There
.....
';

$result_errors{'test_fill_gaps_in_sectioning'} = '';

$result_nodes_list{'test_fill_gaps_in_sectioning'} = '';

$result_sections_list{'test_fill_gaps_in_sectioning'} = '1|top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|Section
3|Section
 section_directions:
  up->Chap
 section_children:
  1|@asis{}
4|@asis{}
 section_directions:
  up->Section
 section_children:
  1|There
5|There
 section_directions:
  up->@asis{}
';

$result_sectioning_root{'test_fill_gaps_in_sectioning'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_fill_gaps_in_sectioning'} = '';

1;
