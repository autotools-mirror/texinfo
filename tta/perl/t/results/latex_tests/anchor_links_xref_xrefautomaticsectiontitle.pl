use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'anchor_links_xref_xrefautomaticsectiontitle'} = '*document_root C7
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
  *paragraph C3
   {In node before\\n}
   *@anchor C1 l4
   |EXTRA
   |is_target:{1}
   |normalized:{anch_003a-in-node-before}
    *brace_arg C1
     {anch: in node before}
   {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *@node C1 l6 {Top}
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
 *@top C4 l7 {top sectionning}
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
  *paragraph C3
   {in node Top\\n}
   *@anchor C1 l10
   |EXTRA
   |is_target:{1}
   |normalized:{anch_003a-in-node-top}
    *brace_arg C1
     {anch: in node top}
   {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *@node C4 l12 {after}
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
  *paragraph C3
   {in node after\\n}
   *@anchor C1 l15
   |EXTRA
   |is_target:{1}
   |normalized:{anch_003a-in-node-after}
    *brace_arg C1
     {anch: in node after}
   {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *@node C1 l17 {chap}
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
 *@chapter C9 l18 {chap}
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
  *paragraph C3
   {in chap\\n}
   *@anchor C1 l21
   |EXTRA
   |is_target:{1}
   |normalized:{anch_003a-in-chap}
    *brace_arg C1
     {anch: in chap}
   {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *@xrefautomaticsectiontitle C1 l23
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{on}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {on}
  *paragraph C8
   *@xref C1 l24
    *brace_arg C1
    |EXTRA
    |node_content:{anch: in node before}
    |normalized:{anch_003a-in-node-before}
     {anch: in node before}
   {.\\n}
   *@xref C1 l25
    *brace_arg C1
    |EXTRA
    |node_content:{anch: in node top}
    |normalized:{anch_003a-in-node-top}
     {anch: in node top}
   {.\\n}
   *@xref C1 l26
    *brace_arg C1
    |EXTRA
    |node_content:{anch: in node after}
    |normalized:{anch_003a-in-node-after}
     {anch: in node after}
   {.\\n}
   *@xref C1 l27
    *brace_arg C1
    |EXTRA
    |node_content:{anch: in chap}
    |normalized:{anch_003a-in-chap}
     {anch: in chap}
   {.\\n}
  {empty_line:\\n}
  *@xrefautomaticsectiontitle C1 l29
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{off}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {off}
  *paragraph C8
   *@xref C1 l30
    *brace_arg C1
    |EXTRA
    |node_content:{anch: in node before}
    |normalized:{anch_003a-in-node-before}
     {anch: in node before}
   {.\\n}
   *@xref C1 l31
    *brace_arg C1
    |EXTRA
    |node_content:{anch: in node top}
    |normalized:{anch_003a-in-node-top}
     {anch: in node top}
   {.\\n}
   *@xref C1 l32
    *brace_arg C1
    |EXTRA
    |node_content:{anch: in node after}
    |normalized:{anch_003a-in-node-after}
     {anch: in node after}
   {.\\n}
   *@xref C1 l33
    *brace_arg C1
    |EXTRA
    |node_content:{anch: in chap}
    |normalized:{anch_003a-in-chap}
     {anch: in chap}
   {.\\n}
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

\\chapter{{chap}}
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
