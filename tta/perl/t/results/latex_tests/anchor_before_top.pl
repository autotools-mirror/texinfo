use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_before_top'} = '*document_root C5
 *before_node_section C5
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *normal_command@anchor C1 l2
  |EXTRA
  |identifier:{a-before-Top}
  |is_target:{1}
   *brace_arg C1
    {normal_text:a before Top}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l5 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {Chapter}
 |EXTRA
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l8 {Chap}
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
   *normal_command@pxref C1 l10
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{a-before-Top}
     {normal_text:a before Top}
   {normal_text:\\n}
';


$result_texis{'anchor_before_top'} = '
@anchor{a before Top}

@node Top
@top top

@node Chapter
@chapter Chap

@pxref{a before Top}
';


$result_texts{'anchor_before_top'} = '
top
***

1 Chap
******

a before Top
';

$result_errors{'anchor_before_top'} = '';

$result_nodes_list{'anchor_before_top'} = '1|Top
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

$result_sections_list{'anchor_before_top'} = '1|top
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

$result_sectioning_root{'anchor_before_top'} = 'level: -1
list:
 1|top
';

$result_headings_list{'anchor_before_top'} = '';


$result_converted{'latex_text'}->{'anchor_before_top'} = '\\begin{document}
\\label{anchor:a-before-Top}%

\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:Chapter}%

see \\hyperref[anchor:a-before-Top]{[a before Top], page~\\pageref*{anchor:a-before-Top}}
';

1;
