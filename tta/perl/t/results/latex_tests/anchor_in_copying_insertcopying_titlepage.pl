use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_copying_insertcopying_titlepage'} = '*document_root C5
 *before_node_section C1
  *preamble C4
   *normal_command@copying C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C3
     {normal_text:Cop. }
     *normal_command@anchor C1 l2
     |identifier:{a-in-copying}
     |is_target:{1}
      *brace_arg C1
      |element_region:{copying}
       {normal_text:a in copying}
     {normal_text:. Ying.\\n}
    *normal_command@end C1 l3
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@titlepage C8 l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@title C1 l6
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:Manual}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
    *normal_command@page C1
     *line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@anchor C1 l9
    |identifier:{a-in-titlepage}
    |is_target:{1}
     *brace_arg C1
     |element_region:{titlepage}
      {normal_text:a in titlepage}
    {spaces_after_close_brace:\\n}
    *normal_command@insertcopying C1 l10
    |global_command_number:{1}
     *line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@end C1 l11
    |text_arg:{titlepage}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:titlepage}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l13 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l14 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l16 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l17 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *normal_command@pxref C1 l19
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{a-in-copying}
     {normal_text:a in copying}
   {normal_text:.\\n}
   *normal_command@pxref C1 l20
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{a-in-titlepage}
     {normal_text:a in titlepage}
   {normal_text:.\\n}
';


$result_texis{'anchor_in_copying_insertcopying_titlepage'} = '@copying
Cop. @anchor{a in copying}. Ying.
@end copying

@titlepage
@title Manual

@page
@anchor{a in titlepage}
@insertcopying
@end titlepage

@node Top
@top top

@node Chapter
@chapter Chap

@pxref{a in copying}.
@pxref{a in titlepage}.
';


$result_texts{'anchor_in_copying_insertcopying_titlepage'} = '

top
***

1 Chap
******

a in copying.
a in titlepage.
';

$result_errors{'anchor_in_copying_insertcopying_titlepage'} = '';

$result_nodes_list{'anchor_in_copying_insertcopying_titlepage'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chapter
2|Chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'anchor_in_copying_insertcopying_titlepage'} = '1|top
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

$result_sectioning_root{'anchor_in_copying_insertcopying_titlepage'} = 'level: -1
list:
 1|top
';

$result_headings_list{'anchor_in_copying_insertcopying_titlepage'} = '';


$result_converted{'latex_text'}->{'anchor_in_copying_insertcopying_titlepage'} = '

\\begin{document}

\\frontmatter
\\pagestyle{empty}%
\\begin{titlepage}
\\begingroup
\\newskip\\titlepagetopglue \\titlepagetopglue = 1.5in
\\newskip\\titlepagebottomglue \\titlepagebottomglue = 2pc
\\setlength{\\parindent}{0pt}
% Leave some space at the very top of the page.
    \\vglue\\titlepagetopglue
{\\raggedright {\\huge \\bfseries Manual}}
\\vskip 4pt \\hrule height 4pt width \\hsize \\vskip 4pt

\\vskip4pt \\hrule height 2pt width \\hsize
  \\vskip\\titlepagebottomglue
\\endgroup
\\newpage{}%
\\phantom{blabla}%
\\label{anchor:a-in-titlepage}%
Cop. \\label{anchor:a-in-copying}%
. Ying.
\\end{titlepage}
\\mainmatter
\\pagestyle{single}%
\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:Chapter}%

see \\hyperref[anchor:a-in-copying]{[a in copying], page~\\pageref*{anchor:a-in-copying}}.
see \\hyperref[anchor:a-in-titlepage]{[a in titlepage], page~\\pageref*{anchor:a-in-titlepage}}.
';

1;
