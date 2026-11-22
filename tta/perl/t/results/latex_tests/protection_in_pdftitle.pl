use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'protection_in_pdftitle'} = '*document_root C5
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
 *normal_command@top C2 l2 {top @{but really ? protected@} and percent %}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    {normal_text:top }
    *normal_command@{
    {normal_text:but really ? protected}
    *normal_command@}
    {normal_text: and percent %}
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
 *normal_command@chapter C1 l5 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
';


$result_texis{'protection_in_pdftitle'} = '@node Top
@top top @{but really ? protected@} and percent %

@node chap
@chapter Chap
';


$result_texts{'protection_in_pdftitle'} = 'top {but really ? protected} and percent %
******************************************

1 Chap
******
';

$result_errors{'protection_in_pdftitle'} = '';

$result_nodes_list{'protection_in_pdftitle'} = '1|Top
 associated_section: top @{but really ? protected@} and percent %
 associated_title_command: top @{but really ? protected@} and percent %
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'protection_in_pdftitle'} = '1|top @{but really ? protected@} and percent %
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
  up->top @{but really ? protected@} and percent %
 toplevel_directions:
  prev->top @{but really ? protected@} and percent %
  up->top @{but really ? protected@} and percent %
';

$result_sectioning_root{'protection_in_pdftitle'} = 'level: -1
list:
 1|top @{but really ? protected@} and percent %
';

$result_headings_list{'protection_in_pdftitle'} = '';


$result_converted{'latex_text'}->{'protection_in_pdftitle'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:chap}%
';

1;
