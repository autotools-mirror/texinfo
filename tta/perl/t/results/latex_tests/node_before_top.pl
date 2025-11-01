use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'node_before_top'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content
 *@node C2 l1 {before Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{before-Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {before Top}
  {empty_line:\\n}
 *@node C1 l3 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C2 l4 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
 *@node C1 l6 {Chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter}
 *@chapter C3 l7 {Chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chap}
  {empty_line:\\n}
  *paragraph C2
   *@pxref C1 l9
    *brace_arg C1
    |EXTRA
    |node_content:{before Top}
    |normalized:{before-Top}
     {before Top}
   {\\n}
';


$result_texis{'node_before_top'} = '@node before Top

@node Top
@top top

@node Chapter
@chapter Chap

@pxref{before Top}
';


$result_texts{'node_before_top'} = '
top
***

1 Chap
******

before Top
';

$result_errors{'node_before_top'} = '* W l1|node `before Top\' not in menu
 warning: node `before Top\' not in menu

';

$result_nodes_list{'node_before_top'} = '1|before Top
2|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chapter
3|Chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'node_before_top'} = '1|top
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

$result_sectioning_root{'node_before_top'} = 'level: -1
list:
 1|top
';

$result_headings_list{'node_before_top'} = '';


$result_converted{'latex_text'}->{'node_before_top'} = '\\begin{document}
\\label{anchor:before-Top}%

\\label{anchor:Top}%
\\chapter{{Chap}}
\\label{anchor:Chapter}%

see \\hyperref[anchor:before-Top]{\\chaptername~\\ref*{anchor:before-Top} [before Top], page~\\pageref*{anchor:before-Top}}
';

1;
