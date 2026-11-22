use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'custom_headings_and_comments'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content C3
   *normal_command@evenheading C1 l1
    *line_arg C17
     {spaces_before_argument: }
     *normal_command@thispage
     {normal_text: }
     *normal_command@thissectionname
     {normal_text: }
     *normal_command@|
     {normal_text: }
     *normal_command@thissectionnum
     {normal_text: }
     *normal_command@thissection
     {normal_text: }
     *normal_command@|
     {normal_text: }
     *normal_command@thischaptername
     {normal_text: }
     *normal_command@thischapternum
     {spaces_after_argument:  \\n}
   *normal_command@evenfooting C1 l2
    *line_arg C14
     {spaces_before_argument:   }
     *normal_command@thischapter
     {normal_text: }
     *normal_command@thistitle
     {normal_text: }
     *normal_command@|
     {normal_text: }
     *normal_command@thisfile
     {normal_text: }
     *normal_command@|
     {normal_text:   }
     *normal_command@code C1 l2
      *brace_container C1
       *normal_command@thischaptername
     {spaces_after_argument:  }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l4 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l5 {top sectionning}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top sectionning}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C10 l8 {ch--ap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ch--ap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@page C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:after ch--ap first page\\n}
  {empty_line:\\n}
  *normal_command@page C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:after ch--ap second page\\n}
  {empty_line:\\n}
 *normal_command@section C2 l18 {sec1}
 |identifier:{sec1}
 |is_target:{1}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 l20 {chap 2}
 |identifier:{chap-2}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'custom_headings_and_comments'} = '@evenheading @thispage @thissectionname @| @thissectionnum @thissection @| @thischaptername @thischapternum  
@evenfooting   @thischapter @thistitle @| @thisfile @|   @code{@thischaptername}  @c comment

@node Top
@top top sectionning

@node chapter
@chapter ch--ap

@page

after ch--ap first page

@page

after ch--ap second page

@section sec1

@chapter chap 2

';


$result_texts{'custom_headings_and_comments'} = '
top sectionning
***************

1 ch-ap
*******



after ch-ap first page



after ch-ap second page

1.1 sec1
========

2 chap 2
********

';

$result_errors{'custom_headings_and_comments'} = '';

$result_nodes_list{'custom_headings_and_comments'} = '1|Top
 associated_section: top sectionning
 associated_title_command: top sectionning
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 ch--ap
 associated_title_command: 1 ch--ap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'custom_headings_and_comments'} = '1|top sectionning
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->ch--ap
 section_children:
  1|ch--ap
  2|chap 2
2|ch--ap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->chap 2
  up->top sectionning
 toplevel_directions:
  next->chap 2
  prev->top sectionning
  up->top sectionning
 section_children:
  1|sec1
3|sec1
 section_directions:
  up->ch--ap
4|chap 2
 section_directions:
  prev->ch--ap
  up->top sectionning
 toplevel_directions:
  prev->ch--ap
  up->top sectionning
';

$result_sectioning_root{'custom_headings_and_comments'} = 'level: -1
list:
 1|top sectionning
';

$result_headings_list{'custom_headings_and_comments'} = '';


$result_converted{'latex_text'}->{'custom_headings_and_comments'} = '\\newpagestyle{custom}{%
\\sethead[\\thepage{} \\sectiontitle{}][\\thesection{} Section \\thesection{} \\sectiontitle{}][\\chaptertitle{} \\thechapter{}]%
{}{}{}%
}%
\\pagestyle{custom}%
\\renewpagestyle{custom}{%
\\sethead[\\thepage{} \\sectiontitle{}][\\thesection{} Section \\thesection{} \\sectiontitle{}][\\chaptertitle{} \\thechapter{}]%
{}{}{}%
\\setfoot[\\Texinfothechapterheading{}\\chaptertitle{} \\Texinfosettitle{}][\\Texinfotheinclude{}][\\texttt{\\chaptertitle{}}]%
{}{}{}%
}%
\\pagestyle{custom}%

\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{ch--ap}}
\\label{anchor:chapter}%

\\newpage{}%
\\phantom{blabla}%

after ch--ap first page

\\newpage{}%
\\phantom{blabla}%

after ch--ap second page

\\section{{sec1}}
\\label{anchor:sec1}%

\\Texinfochapter{{chap 2}}
\\label{anchor:chap-2}%

';

1;
