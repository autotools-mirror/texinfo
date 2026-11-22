use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_copying'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@copying C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C3
     {normal_text:Cop. }
     *@anchor C1 l2
     |EXTRA
     |identifier:{a-in-copying}
     |is_target:{1}
      *brace_arg C1
      |EXTRA
      |element_region:{copying}
       {normal_text:a in copying}
     {normal_text:. Ying.\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l5 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 l6 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l8 {Chapter}
 |EXTRA
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *@chapter C3 l9 {Chap}
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
  *paragraph C2
   *@pxref C1 l11
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{a-in-copying}
     {normal_text:a in copying}
   {normal_text:\\n}
';


$result_texis{'anchor_in_copying'} = '@copying
Cop. @anchor{a in copying}. Ying.
@end copying

@node Top
@top top

@node Chapter
@chapter Chap

@pxref{a in copying}
';


$result_texts{'anchor_in_copying'} = '
top
***

1 Chap
******

a in copying
';

$result_errors{'anchor_in_copying'} = '';

$result_nodes_list{'anchor_in_copying'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chapter
2|Chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'anchor_in_copying'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: Chapter
 associated_node: Chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'anchor_in_copying'} = 'level: -1
list:
 1|top
';

$result_headings_list{'anchor_in_copying'} = '';


$result_converted{'latex_text'}->{'anchor_in_copying'} = '
\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:Chapter}%

see \\hyperref[anchor:a-in-copying]{[a in copying], page~\\pageref*{anchor:a-in-copying}}
';

1;
