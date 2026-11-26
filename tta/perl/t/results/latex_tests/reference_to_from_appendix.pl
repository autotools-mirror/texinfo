use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'reference_to_from_appendix'} = '*document_root C7
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
 *normal_command@chapter C4 l5 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l7
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{appendix}
     {normal_text:appendix}
   {normal_text:.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {appendix}
 |identifier:{appendix}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:appendix}
    {spaces_after_argument:\\n}
 *normal_command@appendix C3 l10 {Appendix}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Appendix}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l12
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{chap}
     {normal_text:chap}
   {normal_text:.\\n}
';


$result_texis{'reference_to_from_appendix'} = '@node Top
@top top

@node chap
@chapter Chapter

@xref{appendix}.

@node appendix
@appendix Appendix

@xref{chap}.
';


$result_texts{'reference_to_from_appendix'} = 'top
***

1 Chapter
*********

appendix.

Appendix A Appendix
*******************

chap.
';

$result_errors{'reference_to_from_appendix'} = '';

$result_nodes_list{'reference_to_from_appendix'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  next->appendix
  prev->Top
  up->Top
3|appendix
 associated_section: A Appendix
 associated_title_command: A Appendix
 node_directions:
  prev->chap
  up->Top
';

$result_sections_list{'reference_to_from_appendix'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
  2|Appendix
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  next->Appendix
  up->top
 toplevel_directions:
  next->Appendix
  prev->top
  up->top
3|Appendix
 associated_anchor_command: appendix
 associated_node: appendix
 section_directions:
  prev->Chapter
  up->top
 toplevel_directions:
  prev->Chapter
  up->top
';

$result_sectioning_root{'reference_to_from_appendix'} = 'level: -1
list:
 1|top
';

$result_headings_list{'reference_to_from_appendix'} = '';


$result_converted{'latex_text'}->{'reference_to_from_appendix'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chap}%

See \\hyperref[anchor:appendix]{\\appendixname~\\ref*{anchor:appendix} [appendix], page~\\pageref*{anchor:appendix}}.

\\appendix
\\renewcommand{\\Texinfoheadingchaptername}{\\appendixname}
\\Texinfochapter{{Appendix}}
\\label{anchor:appendix}%

See \\hyperref[anchor:chap]{\\chaptername~\\ref*{anchor:chap} [chap], page~\\pageref*{anchor:chap}}.
';

1;
