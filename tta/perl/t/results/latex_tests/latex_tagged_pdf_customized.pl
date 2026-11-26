use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'latex_tagged_pdf_customized'} = '*document_root C5
 *before_node_section C1
  *preamble C3
   *normal_command@documentlanguage C1 l1
   |global_command_number:{1}
   |text_arg:{sr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:sr}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l2
   |global_command_number:{1}
   |text_arg:{Latn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Latn}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l4 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l5 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l8 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'latex_tagged_pdf_customized'} = '@documentlanguage sr
@documentscript Latn

@node Top
@top top

@node chap
@chapter Chap

';


$result_texts{'latex_tagged_pdf_customized'} = '
top
***

1 Chap
******

';

$result_errors{'latex_tagged_pdf_customized'} = '';

$result_nodes_list{'latex_tagged_pdf_customized'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'latex_tagged_pdf_customized'} = '1|top
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
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'latex_tagged_pdf_customized'} = 'level: -1
list:
 1|top
';

$result_headings_list{'latex_tagged_pdf_customized'} = '';


$result_converted{'latex_text'}->{'latex_tagged_pdf_customized'} = '\\selectlanguage{sr}%
\\selectlanguage{sr-Latn}%

\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:chap}%

';

1;
