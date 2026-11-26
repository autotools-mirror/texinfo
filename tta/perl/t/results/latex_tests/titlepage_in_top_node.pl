use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'titlepage_in_top_node'} = '*document_root C5
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
 *normal_command@top C6 l2 {top sectionning}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top sectionning}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In top\\n}
  {empty_line:\\n}
  *normal_command@titlepage C3 l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@title C1 l7
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:the TTitle}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l8
   |text_arg:{titlepage}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:titlepage}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l11 {chap}
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
';


$result_texis{'titlepage_in_top_node'} = '@node Top
@top top sectionning

In top

@titlepage
@title the TTitle
@end titlepage

@node chap
@chapter chap

in chap
';


$result_texts{'titlepage_in_top_node'} = 'top sectionning
***************

In top


1 chap
******

in chap
';

$result_errors{'titlepage_in_top_node'} = '';

$result_nodes_list{'titlepage_in_top_node'} = '1|Top
 associated_section: top sectionning
 associated_title_command: top sectionning
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'titlepage_in_top_node'} = '1|top sectionning
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

$result_sectioning_root{'titlepage_in_top_node'} = 'level: -1
list:
 1|top sectionning
';

$result_headings_list{'titlepage_in_top_node'} = '';


$result_converted{'latex_text'}->{'titlepage_in_top_node'} = '\\begin{document}

\\frontmatter
\\pagestyle{empty}%
\\begin{titlepage}
\\begingroup
\\newskip\\titlepagetopglue \\titlepagetopglue = 1.5in
\\newskip\\titlepagebottomglue \\titlepagebottomglue = 2pc
\\setlength{\\parindent}{0pt}
% Leave some space at the very top of the page.
    \\vglue\\titlepagetopglue
{\\raggedright {\\huge \\bfseries the TTitle}}
\\vskip 4pt \\hrule height 4pt width \\hsize \\vskip 4pt
\\vskip4pt \\hrule height 2pt width \\hsize
  \\vskip\\titlepagebottomglue
\\endgroup
\\end{titlepage}
\\mainmatter
\\pagestyle{single}%
\\label{anchor:Top}%
\\Texinfochapter{{chap}}
\\label{anchor:chap}%

in chap
';

1;
