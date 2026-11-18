use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_copying_insertcopying_titlepage'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C4
   *@copying C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C3
     {Cop. }
     *@anchor C1 l2
     |EXTRA
     |identifier:{a-in-copying}
     |is_target:{1}
      *brace_arg C1
      |EXTRA
      |element_region:{copying}
       {a in copying}
     {. Ying.\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@titlepage C8 l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *@title C1 l6
     *line_arg C3
      {spaces_before_argument: }
      {Manual}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
    *@page C1
     *line_arg C1
      {spaces_before_argument:\\n}
    *@anchor C1 l9
    |EXTRA
    |identifier:{a-in-titlepage}
    |is_target:{1}
     *brace_arg C1
     |EXTRA
     |element_region:{titlepage}
      {a in titlepage}
    {spaces_after_close_brace:\\n}
    *@insertcopying C1 l10
    |EXTRA
    |global_command_number:{1}
     *line_arg C1
      {spaces_before_argument:\\n}
    *@end C1 l11
    |EXTRA
    |text_arg:{titlepage}
     *line_arg C3
      {spaces_before_argument: }
      {titlepage}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l13 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C2 l14 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l16 {Chapter}
 |EXTRA
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chapter}
    {spaces_after_argument:\\n}
 *@chapter C3 l17 {Chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@pxref C1 l19
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{a-in-copying}
     {a in copying}
   {.\\n}
   *@pxref C1 l20
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{a-in-titlepage}
     {a in titlepage}
   {.\\n}
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
