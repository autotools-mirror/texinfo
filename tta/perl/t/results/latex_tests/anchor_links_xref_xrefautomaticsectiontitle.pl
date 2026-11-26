use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_links_xref_xrefautomaticsectiontitle'} = '*document_root C7
 *before_node_section C1
  *preamble
 *normal_command@node C4 l1 {node before}
 |identifier:{node-before}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node before}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:In node before\\n}
   *normal_command@anchor C1 l4
   |identifier:{anch_003a-in-node-before}
   |is_target:{1}
    *brace_arg C1
     {normal_text:anch: in node before}
   {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l7 {top sectionning}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top sectionning}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:in node Top\\n}
   *normal_command@anchor C1 l10
   |identifier:{anch_003a-in-node-top}
   |is_target:{1}
    *brace_arg C1
     {normal_text:anch: in node top}
   {spaces_after_close_brace:\\n}
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
  *paragraph C3
   {normal_text:in node after\\n}
   *normal_command@anchor C1 l15
   |identifier:{anch_003a-in-node-after}
   |is_target:{1}
    *brace_arg C1
     {normal_text:anch: in node after}
   {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l17 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C9 l18 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:in chap\\n}
   *normal_command@anchor C1 l21
   |identifier:{anch_003a-in-chap}
   |is_target:{1}
    *brace_arg C1
     {normal_text:anch: in chap}
   {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *normal_command@xrefautomaticsectiontitle C1 l23
  |global_command_number:{1}
  |misc_args:A{on}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:on}
    {spaces_after_argument:\\n}
  *paragraph C8
   *normal_command@xref C1 l24
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{anch_003a-in-node-before}
     {normal_text:anch: in node before}
   {normal_text:.\\n}
   *normal_command@xref C1 l25
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{anch_003a-in-node-top}
     {normal_text:anch: in node top}
   {normal_text:.\\n}
   *normal_command@xref C1 l26
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{anch_003a-in-node-after}
     {normal_text:anch: in node after}
   {normal_text:.\\n}
   *normal_command@xref C1 l27
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{anch_003a-in-chap}
     {normal_text:anch: in chap}
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@xrefautomaticsectiontitle C1 l29
  |global_command_number:{2}
  |misc_args:A{off}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:off}
    {spaces_after_argument:\\n}
  *paragraph C8
   *normal_command@xref C1 l30
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{anch_003a-in-node-before}
     {normal_text:anch: in node before}
   {normal_text:.\\n}
   *normal_command@xref C1 l31
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{anch_003a-in-node-top}
     {normal_text:anch: in node top}
   {normal_text:.\\n}
   *normal_command@xref C1 l32
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{anch_003a-in-node-after}
     {normal_text:anch: in node after}
   {normal_text:.\\n}
   *normal_command@xref C1 l33
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{anch_003a-in-chap}
     {normal_text:anch: in chap}
   {normal_text:.\\n}
';


$result_texis{'anchor_links_xref_xrefautomaticsectiontitle'} = '@node node before

In node before
@anchor{anch: in node before}

@node Top
@top top sectionning

in node Top
@anchor{anch: in node top}

@node after

in node after
@anchor{anch: in node after}

@node chap
@chapter chap

in chap
@anchor{anch: in chap}

@xrefautomaticsectiontitle on
@xref{anch: in node before}.
@xref{anch: in node top}.
@xref{anch: in node after}.
@xref{anch: in chap}.

@xrefautomaticsectiontitle off
@xref{anch: in node before}.
@xref{anch: in node top}.
@xref{anch: in node after}.
@xref{anch: in chap}.
';


$result_texts{'anchor_links_xref_xrefautomaticsectiontitle'} = '
In node before

top sectionning
***************

in node Top


in node after

1 chap
******

in chap

anch: in node before.
anch: in node top.
anch: in node after.
anch: in chap.

anch: in node before.
anch: in node top.
anch: in node after.
anch: in chap.
';

$result_errors{'anchor_links_xref_xrefautomaticsectiontitle'} = '* W l1|node `node before\' unreferenced
 warning: node `node before\' unreferenced

* W l12|node `after\' unreferenced
 warning: node `after\' unreferenced

';

$result_nodes_list{'anchor_links_xref_xrefautomaticsectiontitle'} = '1|node before
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

$result_sections_list{'anchor_links_xref_xrefautomaticsectiontitle'} = '1|top sectionning
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

$result_sectioning_root{'anchor_links_xref_xrefautomaticsectiontitle'} = 'level: -1
list:
 1|top sectionning
';

$result_headings_list{'anchor_links_xref_xrefautomaticsectiontitle'} = '';


$result_converted{'latex_text'}->{'anchor_links_xref_xrefautomaticsectiontitle'} = '\\begin{document}
\\label{anchor:node-before}%

In node before
\\label{anchor:anch_003a-in-node-before}%

\\label{anchor:Top}%
\\label{anchor:anch_003a-in-node-top}%
\\label{anchor:after}%

in node after
\\label{anchor:anch_003a-in-node-after}%

\\Texinfochapter{{chap}}
\\label{anchor:chap}%

in chap
\\label{anchor:anch_003a-in-chap}%

See \\hyperref[anchor:anch_003a-in-node-before]{[top sectionning], page~\\pageref*{anchor:anch_003a-in-node-before}}.
See \\hyperref[anchor:anch_003a-in-node-top]{[top sectionning], page~\\pageref*{anchor:anch_003a-in-node-top}}.
See \\hyperref[anchor:anch_003a-in-node-after]{[top sectionning], page~\\pageref*{anchor:anch_003a-in-node-after}}.
See \\hyperref[anchor:anch_003a-in-chap]{[chap], page~\\pageref*{anchor:anch_003a-in-chap}}.

See \\hyperref[anchor:anch_003a-in-node-before]{[anch: in node before], page~\\pageref*{anchor:anch_003a-in-node-before}}.
See \\hyperref[anchor:anch_003a-in-node-top]{[anch: in node top], page~\\pageref*{anchor:anch_003a-in-node-top}}.
See \\hyperref[anchor:anch_003a-in-node-after]{[anch: in node after], page~\\pageref*{anchor:anch_003a-in-node-after}}.
See \\hyperref[anchor:anch_003a-in-chap]{[anch: in chap], page~\\pageref*{anchor:anch_003a-in-chap}}.
';

1;
