use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'maketitle_documentinfo_publication'} = '*document_root C8
 *before_node_section C4
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C8
   *@publication C3 maketitle_documentinfo_publication.texi:l2
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C1
     {C\'est toto\\n}
    *@end C1 maketitle_documentinfo_publication.texi:l4
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{publication}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {publication}
   {empty_line: \\n}
   *@documentinfo C8 maketitle_documentinfo_publication.texi:l6
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *@author C1 maketitle_documentinfo_publication.texi:l7
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |global_command_number:{1}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {SOme ONe}
    *@title C1 maketitle_documentinfo_publication.texi:l8
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {TTT}
    *@author C1 maketitle_documentinfo_publication.texi:l9
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |global_command_number:{2}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {Gàther Person}
    *@subtitle C1 maketitle_documentinfo_publication.texi:l10
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |global_command_number:{1}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {ST1}
    *@subtitle C1 maketitle_documentinfo_publication.texi:l11
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |global_command_number:{2}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {ST2}
    *paragraph C1
     {Toto\\n}
    *@end C1 maketitle_documentinfo_publication.texi:l13
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{documentinfo}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {documentinfo}
   {empty_line:\\n}
   *@copying C3 maketitle_documentinfo_publication.texi:l15
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C1
     {You shoukd\\n}
    *@end C1 maketitle_documentinfo_publication.texi:l17
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{copying}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {copying}
   {empty_line:\\n}
   *@contents C1 maketitle_documentinfo_publication.texi:l19
   |EXTRA
   |global_command_number:{1}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line: \\n}
  *@maketitle C1 maketitle_documentinfo_publication.texi:l21
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 maketitle_documentinfo_publication.texi:l23 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
 *@top C4 maketitle_documentinfo_publication.texi:l24 {top}
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
  {empty_line: \\n}
  *paragraph C1
   {aaa\\n}
  {empty_line: \\n}
 *@node C1 maketitle_documentinfo_publication.texi:l28 {chùpter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{ch_00f9pter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chùpter}
 *@chapter C2 maketitle_documentinfo_publication.texi:l29 {chap}
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
  {empty_line: \\n}
 *@node C1 maketitle_documentinfo_publication.texi:l31 {section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{section}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {section}
 *@section C2 maketitle_documentinfo_publication.texi:l32 {Sec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sec}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'maketitle_documentinfo_publication'} = '
@publication
C\'est toto
@end publication
 
@documentinfo
@author SOme ONe
@title TTT
@author Gàther Person
@subtitle ST1
@subtitle ST2
Toto
@end documentinfo

@copying
You shoukd
@end copying

@contents
 
@maketitle

@node top
@top top
 
aaa
 
@node chùpter
@chapter chap
 
@node section
@section Sec

@bye
';


$result_texts{'maketitle_documentinfo_publication'} = ' 


 

top
***
 
aaa
 
1 chap
******
 
1.1 Sec
=======

';

$result_errors{'maketitle_documentinfo_publication'} = '';

$result_nodes_list{'maketitle_documentinfo_publication'} = '1|top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chùpter
2|chùpter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->top
  up->top
3|section
 associated_section: 1.1 Sec
 associated_title_command: 1.1 Sec
 node_directions:
  up->chùpter
';

$result_sections_list{'maketitle_documentinfo_publication'} = '1|top
 associated_anchor_command: top
 associated_node: top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chùpter
 associated_node: chùpter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|Sec
3|Sec
 associated_anchor_command: section
 associated_node: section
 section_directions:
  up->chap
';

$result_sectioning_root{'maketitle_documentinfo_publication'} = 'level: -1
list:
 1|top
';

$result_headings_list{'maketitle_documentinfo_publication'} = '';


$result_converted{'latex_text'}->{'maketitle_documentinfo_publication'} = '



\\begin{document}

\\frontmatter
\\pagestyle{empty}%
\\begin{titlepage}
{\\raggedright {\\huge \\bfseries TTT}}
\\vskip 4pt \\hrule height 4pt width \\hsize \\vskip 4pt
\\rightline{ST1}
\\rightline{ST2}
\\vskip 0pt plus 1filll
\\leftline{\\Large \\bfseries SOme ONe}%
\\leftline{\\Large \\bfseries Gàther Person}%
\\vskip 4pt \\hrule height 2pt width \\hsize
\\newpage{}%
\\phantom{blabla}%
\\vskip 0pt plus 1filll
You shoukd

C\'est toto
\\end{titlepage}
\\pagestyle{singlepagenum}%
\\tableofcontents\\newpage
\\mainmatter
\\pagestyle{single}%

\\label{anchor:Top}%
\\chapter{{chap}}
\\label{anchor:ch_00f9pter}%

\\section{{Sec}}
\\label{anchor:section}%

';

1;
