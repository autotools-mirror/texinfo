use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodes_before_after_top_xref'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@setfilename C1 l1
   |text_arg:{nodes_before_after_top_xref.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:nodes_before_after_top_xref.info}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C4 l3 {node before}
 |identifier:{node-before}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node before}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In node before\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l8 {top sectionning}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top sectionning}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in node Top\\n}
  {empty_line:\\n}
 *normal_command@node C4 l12 {after}
 |identifier:{after}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:after}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in node after\\n}
  {empty_line:\\n}
 *normal_command@node C1 l16 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C10 l17 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in chap\\n}
  {empty_line:\\n}
  *normal_command@xrefautomaticsectiontitle C1 l21
  |global_command_number:{1}
  |misc_args:A{on}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:on}
    {spaces_after_argument:\\n}
  *paragraph C4
   *normal_command@xref C1 l22
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{node-before}
     {normal_text:node before}
   {normal_text:.\\n}
   *normal_command@xref C1 l23
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{after}
     {normal_text:after}
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@xrefautomaticsectiontitle C1 l25
  |global_command_number:{2}
  |misc_args:A{off}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:off}
    {spaces_after_argument:\\n}
  *paragraph C4
   *normal_command@xref C1 l26
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{node-before}
     {normal_text:node before}
   {normal_text:.\\n}
   *normal_command@xref C1 l27
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{after}
     {normal_text:after}
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'nodes_before_after_top_xref'} = '@setfilename nodes_before_after_top_xref.info

@node node before

In node before

@node Top
@top top sectionning

in node Top

@node after

in node after

@node chap
@chapter chap

in chap

@xrefautomaticsectiontitle on
@xref{node before}.
@xref{after}.

@xrefautomaticsectiontitle off
@xref{node before}.
@xref{after}.

';


$result_texts{'nodes_before_after_top_xref'} = '

In node before

top sectionning
***************

in node Top


in node after

1 chap
******

in chap

node before.
after.

node before.
after.

';

$result_errors{'nodes_before_after_top_xref'} = '* W l3|node `node before\' not in menu
 warning: node `node before\' not in menu

* W l12|node `after\' not in menu
 warning: node `after\' not in menu

';

$result_nodes_list{'nodes_before_after_top_xref'} = '1|node before
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

$result_sections_list{'nodes_before_after_top_xref'} = '1|top sectionning
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

$result_sectioning_root{'nodes_before_after_top_xref'} = 'level: -1
list:
 1|top sectionning
';

$result_headings_list{'nodes_before_after_top_xref'} = '';


$result_converted{'latex_text'}->{'nodes_before_after_top_xref'} = '
\\begin{document}
\\label{anchor:node-before}%

In node before

\\label{anchor:Top}%
\\label{anchor:after}%

in node after

\\Texinfochapter{{chap}}
\\label{anchor:chap}%

in chap

See \\hyperref[anchor:node-before]{\\chaptername~\\ref*{anchor:node-before} [top sectionning], page~\\pageref*{anchor:node-before}}.
See \\hyperref[anchor:after]{\\chaptername~\\ref*{anchor:after} [top sectionning], page~\\pageref*{anchor:after}}.

See \\hyperref[anchor:node-before]{\\chaptername~\\ref*{anchor:node-before} [node before], page~\\pageref*{anchor:node-before}}.
See \\hyperref[anchor:after]{\\chaptername~\\ref*{anchor:after} [after], page~\\pageref*{anchor:after}}.

';

1;
