use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'titlepage_with_commands_classical'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C4
   *@copying C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in Copying\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@titlepage C12 l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *@title C1 l6
     *line_arg C5
      {spaces_before_argument: }
      {normal_text:Some manual }
      *@*
      {normal_text: tested}
      {spaces_after_argument:\\n}
    *@subtitle C1 l7
    |EXTRA
    |global_command_number:{1}
     *line_arg C5
      {spaces_before_argument: }
      {normal_text:Subtitle manual }
      *@*
      {normal_text: tested}
      {spaces_after_argument:\\n}
    *@subtitle C1 l8
    |EXTRA
    |global_command_number:{2}
     *line_arg C5
      {spaces_before_argument: }
      {normal_text:Subtitle 2 manual }
      *@*
      {normal_text: tested}
      {spaces_after_argument:\\n}
    *@author C1 l9
    |EXTRA
    |global_command_number:{1}
     *line_arg C5
      {spaces_before_argument: }
      {normal_text:First }
      *@*
      {normal_text: author}
      {spaces_after_argument:\\n}
    *@author C1 l10
    |EXTRA
    |global_command_number:{2}
     *line_arg C6
      {spaces_before_argument: }
      {normal_text:Second }
      *@*
      {normal_text: author}
      *@footnote C1 l10
      |EXTRA
      |global_command_number:{1}
       *brace_command_context C4
        *paragraph C2
         {normal_text:Something\\n}
         {normal_text:about the address of author.\\n}
        {empty_line:\\n}
        *paragraph C1
         {normal_text:Something about the life. \\n}
        *@displaymath C6 l14
         *arguments_line C1
          *block_line_arg C1
           {spaces_before_argument:\\n}
         {normal_text:\\frac}
         *balanced_braces C1 l15
          {normal_text:{a}}
         *balanced_braces C1 l15
          {normal_text:{b}}
         {normal_text:\\n}
         *@end C1 l16
         |EXTRA
         |text_arg:{displaymath}
          *line_arg C3
           {spaces_before_argument: }
           {normal_text:displaymath}
           {spaces_after_argument:\\n}
      {spaces_after_argument:\\n}
    *@page C1
     *line_arg C1
      {spaces_before_argument:\\n}
    *@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:The following two commands start the copyright page.}
      {spaces_after_argument:\\n}
    *@page C1
     *line_arg C1
      {spaces_before_argument:\\n}
    *@vskip C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:0pt plus 1filll}
      {spaces_after_argument:\\n}
    *@insertcopying C1 l22
    |EXTRA
    |global_command_number:{1}
     *line_arg C1
      {spaces_before_argument:\\n}
    *@end C1 l23
    |EXTRA
    |text_arg:{titlepage}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:titlepage}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l25 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 l26 {section top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l28 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *@chapter C4 l29 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In chapter\\n}
  {empty_line:\\n}
';


$result_texis{'titlepage_with_commands_classical'} = '@copying
in Copying
@end copying

@titlepage
@title Some manual @* tested
@subtitle Subtitle manual @* tested
@subtitle Subtitle 2 manual @* tested
@author First @* author
@author Second @* author@footnote{Something
about the address of author.

Something about the life. 
@displaymath
\\frac{a}{b}
@end displaymath
}
@page
@c The following two commands start the copyright page.
@page
@vskip 0pt plus 1filll
@insertcopying
@end titlepage

@node Top
@top section top

@node chapter
@chapter Chapter

In chapter

';


$result_texts{'titlepage_with_commands_classical'} = '

section top
***********

1 Chapter
*********

In chapter

';

$result_errors{'titlepage_with_commands_classical'} = '* W l10|@footnote should not appear on @author line
 warning: @footnote should not appear on @author line

* W l14|@displaymath should not appear on @author line
 warning: @displaymath should not appear on @author line

';

$result_nodes_list{'titlepage_with_commands_classical'} = '1|Top
 associated_section: section top
 associated_title_command: section top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'titlepage_with_commands_classical'} = '1|section top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->section top
 toplevel_directions:
  prev->section top
  up->section top
';

$result_sectioning_root{'titlepage_with_commands_classical'} = 'level: -1
list:
 1|section top
';

$result_headings_list{'titlepage_with_commands_classical'} = '';


$result_converted{'latex_text'}->{'titlepage_with_commands_classical'} = '

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
{\\raggedright {\\huge \\bfseries Some manual \\leavevmode{}\\\\ tested}}
\\vskip 4pt \\hrule height 4pt width \\hsize \\vskip 4pt
\\rightline{Subtitle manual \\leavevmode{}\\\\ tested}
\\rightline{Subtitle 2 manual \\leavevmode{}\\\\ tested}
\\vskip 0pt plus 1filll
\\leftline{\\Large \\bfseries First \\leavevmode{}\\\\ author}%
\\leftline{\\Large \\bfseries Second \\leavevmode{}\\\\ author\\footnote{Something
about the address of author.

Something about the life. 
\\[
\\frac{a}{b}
\\]
}}%
\\vskip4pt \\hrule height 2pt width \\hsize
  \\vskip\\titlepagebottomglue
\\endgroup
\\newpage{}%
\\phantom{blabla}%
\\newpage{}%
\\phantom{blabla}%
\\vskip 0pt plus 1filll
in Copying
\\end{titlepage}
\\mainmatter
\\pagestyle{single}%
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chapter}%

In chapter

';

1;
