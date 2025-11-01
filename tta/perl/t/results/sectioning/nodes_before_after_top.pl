use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'nodes_before_after_top'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *@node C4 l1 {node before}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{node-before}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {node before}
  {empty_line:\\n}
  *paragraph C1
   {In node before\\n}
  {empty_line:\\n}
 *@node C1 l5 {Top}
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
 *@top C4 l6 {top sectionning}
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
    {top sectionning}
  {empty_line:\\n}
  *paragraph C1
   {in node Top\\n}
  {empty_line:\\n}
 *@node C4 l10 {after}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{after}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {after}
  {empty_line:\\n}
  *paragraph C1
   {in node after\\n}
  {empty_line:\\n}
 *@node C1 l14 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
 *@chapter C3 l15 {chap}
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
    {chap}
  {empty_line:\\n}
  *paragraph C1
   {in chap\\n}
';


$result_texis{'nodes_before_after_top'} = '@node node before

In node before

@node Top
@top top sectionning

in node Top

@node after

in node after

@node chap
@chapter chap

in chap
';


$result_texts{'nodes_before_after_top'} = '
In node before

top sectionning
***************

in node Top


in node after

1 chap
******

in chap
';

$result_errors{'nodes_before_after_top'} = '* W l1|node `node before\' unreferenced
 warning: node `node before\' unreferenced

* W l10|node `after\' unreferenced
 warning: node `after\' unreferenced

';

$result_nodes_list{'nodes_before_after_top'} = '1|node before
2|Top
 associated_section: top sectionning
 associated_title_command: top sectionning
 node_directions:
  next->chap
3|after
4|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'nodes_before_after_top'} = '1|top sectionning
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top sectionning
 toplevel_directions:
  prev->top sectionning
  up->top sectionning
';

$result_sectioning_root{'nodes_before_after_top'} = 'level: -1
list:
 1|top sectionning
';

$result_headings_list{'nodes_before_after_top'} = '';


$result_converted{'latex_text'}->{'nodes_before_after_top'} = '\\begin{document}
\\label{anchor:node-before}%

In node before

\\label{anchor:Top}%
\\label{anchor:after}%

in node after

\\chapter{{chap}}
\\label{anchor:chap}%

in chap
';

1;
