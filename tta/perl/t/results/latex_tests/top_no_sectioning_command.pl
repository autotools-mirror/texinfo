use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_no_sectioning_command'} = '*document_root C4
 *before_node_section C1
  *preamble
 *normal_command@node C2 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l3 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l4 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@pxref C1 l6
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Top}
     {normal_text:Top}
   {normal_text:\\n}
';


$result_texis{'top_no_sectioning_command'} = '@node Top

@node Chapter
@chapter Chap

@pxref{Top}
';


$result_texts{'top_no_sectioning_command'} = '
1 Chap
******

Top
';

$result_errors{'top_no_sectioning_command'} = '';

$result_nodes_list{'top_no_sectioning_command'} = '1|Top
 node_directions:
  next->Chapter
2|Chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
';

$result_sections_list{'top_no_sectioning_command'} = '1|Chap
 associated_anchor_command: Chapter
 associated_node: Chapter
';

$result_sectioning_root{'top_no_sectioning_command'} = 'level: 0
list:
 1|Chap
';

$result_headings_list{'top_no_sectioning_command'} = '';


$result_converted{'latex_text'}->{'top_no_sectioning_command'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:Chapter}%

see \\hyperref[anchor:Top]{\\chaptername~\\ref*{anchor:Top} [Top], page~\\pageref*{anchor:Top}}
';

1;
