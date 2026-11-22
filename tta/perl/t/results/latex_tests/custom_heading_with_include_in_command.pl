use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'custom_heading_with_include_in_command'} = '*document_root C25
 *before_node_section C1
  *preamble_before_content C3
   *normal_command@setchapternewpage C1 l1
   |misc_args:A{odd}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:odd}
     {spaces_after_argument:\\n}
   *normal_command@everyheading C1 l2
    *line_arg C11
     {spaces_before_argument: }
     *normal_command@thischapter
     {normal_text: }
     *normal_command@emph C1 l2
      *brace_container C1
       *normal_command@thisfile
     {normal_text: }
     *normal_command@|
     {normal_text: }
     *normal_command@|
     {normal_text: }
     *normal_command@thispage
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
 *normal_command@top C4 l5 {top sectionning}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top sectionning}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@contents C1 l7
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {in main}
 |identifier:{in-main}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:in main}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 l10 {chap in main}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap in main}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@set C1
  |misc_args:A{do-top|}
  >SOURCEMARKS
  >include<start;1>
   >*normal_command@include C1 l13
   >|text_arg:{section_file.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:section_file.texi}
     >{spaces_after_argument:\\n}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:do-top}
    {spaces_after_argument:\\n}
  *paragraph C2
   {normal_text:\\input texinfo }
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:-*-texinfo-*-}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*normal_command@ifclear C8 section_file.texi:l3
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:do-top}
      >{spaces_after_argument:\\n}
    >{raw:@node Top\\n}
    >{raw:@top\\n}
    >{raw:\\n}
    >{raw:@menu\\n}
    >{raw:* Chapter in included file::\\n}
    >{raw:@end menu\\n}
    >*normal_command@end C1 section_file.texi:l10
    >|text_arg:{ifclear}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifclear}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 section_file.texi:l12 {Chapter in included file}
 |identifier:{Chapter-in-included-file}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter in included file}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 section_file.texi:l13 {Chapter in included file}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter in included file}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 section_file.texi:l15
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 section_file.texi:l16
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Section}
     {normal_text:Section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 section_file.texi:l17
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 section_file.texi:l19 {Section}
 |identifier:{Section}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
 *normal_command@section C4 section_file.texi:l20 {Section}
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 section_file.texi:l22
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 section_file.texi:l23
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Subsection}
     {normal_text:Subsection}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 section_file.texi:l24
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 section_file.texi:l26 {Subsection}
 |identifier:{Subsection}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection}
    {spaces_after_argument:\\n}
 *normal_command@subsection C5 section_file.texi:l27 {Subsection}
 |section_heading_number:{2.1.1}
 |section_level:{3}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<2><p:1>
   >*normal_command@ifset C8 section_file.texi:l29
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:subsub}
      >{spaces_after_argument:\\n}
    >{raw:@menu\\n}
    >{raw:* Subsubsection::\\n}
    >{raw:@end menu\\n}
    >{raw:\\n}
    >{raw:@node Subsubsection\\n}
    >{raw:@subsubsection Subsubsection\\n}
    >*normal_command@end C1 section_file.texi:l36
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<3><p:1>
   >*normal_command@ifclear C4 section_file.texi:l38
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:do-top}
      >{spaces_after_argument:\\n}
    >{raw:@contents\\n}
    >{raw:@bye\\n}
    >*normal_command@end C1 section_file.texi:l41
    >|text_arg:{ifclear}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifclear}
      >{spaces_after_argument:\\n}
  >include<end;1><p:1>
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;2><p:1>
   >*normal_command@include C1 l15
   >|text_arg:{section_file_no_node.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:section_file_no_node.texi}
     >{spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 section_file_no_node.texi:l2 {Chapter in included file}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter in included file}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C2 section_file_no_node.texi:l4 {Section}
 |section_heading_number:{3.1}
 |section_level:{2}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@subsection C5 section_file_no_node.texi:l6 {Subsection}
 |section_heading_number:{3.1.1}
 |section_level:{3}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<4><p:1>
   >*normal_command@ifset C3 section_file_no_node.texi:l8
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:subsub}
      >{spaces_after_argument:\\n}
    >{raw:@subsubsection Subsubsection\\n}
    >*normal_command@end C1 section_file_no_node.texi:l10
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;2><p:1>
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;3><p:1>
   >*normal_command@include C1 l17
   >|text_arg:{section_file_no_node_include.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:section_file_no_node_include.texi}
     >{spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 section_file_no_node_include.texi:l2 {Chapter in included file Include}
 |identifier:{Chapter-in-included-file-Include}
 |is_target:{1}
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter in included file Include}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C2 section_file_no_node_include.texi:l4 {Section Include}
 |identifier:{Section-Include}
 |is_target:{1}
 |section_heading_number:{4.1}
 |section_level:{2}
 |section_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section Include}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@subsection C6 section_file_no_node_include.texi:l6 {Subsection Include}
 |identifier:{Subsection-Include}
 |is_target:{1}
 |section_heading_number:{4.1.1}
 |section_level:{3}
 |section_number:{11}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection Include}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<5><p:1>
   >*normal_command@ifset C3 section_file_no_node_include.texi:l8
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:subsub}
      >{spaces_after_argument:\\n}
    >{raw:@subsubsection Subsubsection Include\\n}
    >*normal_command@end C1 section_file_no_node_include.texi:l10
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Now include file\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;4><p:1>
   >*normal_command@include C1 section_file_no_node_include.texi:l14
   >|text_arg:{section_file_no_node.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:section_file_no_node.texi}
     >{spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 section_file_no_node.texi:l2 {Chapter in included file}
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{12}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter in included file}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C2 section_file_no_node.texi:l4 {Section}
 |section_heading_number:{5.1}
 |section_level:{2}
 |section_number:{13}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@subsection C6 section_file_no_node.texi:l6 {Subsection}
 |section_heading_number:{5.1.1}
 |section_level:{3}
 |section_number:{14}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<6><p:1>
   >*normal_command@ifset C3 section_file_no_node.texi:l8
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:subsub}
      >{spaces_after_argument:\\n}
    >{raw:@subsubsection Subsubsection\\n}
    >*normal_command@end C1 section_file_no_node.texi:l10
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;4><p:1>
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;3><p:1>
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;5><p:1>
   >*normal_command@include C1 l19
   >|text_arg:{section_file_no_node.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:section_file_no_node.texi}
     >{spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 section_file_no_node.texi:l2 {Chapter in included file}
 |section_heading_number:{6}
 |section_level:{1}
 |section_number:{15}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter in included file}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C2 section_file_no_node.texi:l4 {Section}
 |section_heading_number:{6.1}
 |section_level:{2}
 |section_number:{16}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@subsection C4 section_file_no_node.texi:l6 {Subsection}
 |section_heading_number:{6.1.1}
 |section_level:{3}
 |section_number:{17}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<7><p:1>
   >*normal_command@ifset C3 section_file_no_node.texi:l8
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:subsub}
      >{spaces_after_argument:\\n}
    >{raw:@subsubsection Subsubsection\\n}
    >*normal_command@end C1 section_file_no_node.texi:l10
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;5><p:1>
  {empty_line:\\n}
 *normal_command@node C1 l21 {last chap}
 |identifier:{last-chap}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:last chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l22 {A last}
 |section_heading_number:{7}
 |section_level:{1}
 |section_number:{18}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:A last}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'custom_heading_with_include_in_command'} = '@setchapternewpage odd
@everyheading @thischapter @emph{@thisfile} @| @| @thispage

@node Top
@top top sectionning

@contents

@node in main
@chapter chap in main

@set do-top
\\input texinfo @c -*-texinfo-*-


@node Chapter in included file
@chapter Chapter in included file

@menu
* Section::
@end menu

@node Section
@section Section

@menu
* Subsection::
@end menu

@node Subsection
@subsection Subsection




@chapter Chapter in included file

@section Section

@subsection Subsection




@chapter Chapter in included file Include

@section Section Include

@subsection Subsection Include


Now include file


@chapter Chapter in included file

@section Section

@subsection Subsection





@chapter Chapter in included file

@section Section

@subsection Subsection



@node last chap
@chapter A last

';


$result_texts{'custom_heading_with_include_in_command'} = '
top sectionning
***************


1 chap in main
**************

\\input texinfo 

2 Chapter in included file
**************************

* Section::

2.1 Section
===========

* Subsection::

2.1.1 Subsection
----------------




3 Chapter in included file
**************************

3.1 Section
===========

3.1.1 Subsection
----------------




4 Chapter in included file Include
**********************************

4.1 Section Include
===================

4.1.1 Subsection Include
------------------------


Now include file


5 Chapter in included file
**************************

5.1 Section
===========

5.1.1 Subsection
----------------





6 Chapter in included file
**************************

6.1 Section
===========

6.1.1 Subsection
----------------



7 A last
********

';

$result_errors{'custom_heading_with_include_in_command'} = '';

$result_nodes_list{'custom_heading_with_include_in_command'} = '1|Top
 associated_section: top sectionning
 associated_title_command: top sectionning
 node_directions:
  next->in main
2|in main
 associated_section: 1 chap in main
 associated_title_command: 1 chap in main
 node_directions:
  next->Chapter in included file
  prev->Top
  up->Top
3|Chapter in included file
 associated_section: 2 Chapter in included file
 associated_title_command: 2 Chapter in included file
 menus:
  Section
 node_directions:
  prev->in main
  up->Top
4|Section
 associated_section: 2.1 Section
 associated_title_command: 2.1 Section
 menus:
  Subsection
 node_directions:
  up->Chapter in included file
5|Subsection
 associated_section: 2.1.1 Subsection
 associated_title_command: 2.1.1 Subsection
 node_directions:
  up->Section
6|last chap
 associated_section: 7 A last
 associated_title_command: 7 A last
 node_directions:
  up->Top
';

$result_sections_list{'custom_heading_with_include_in_command'} = '1|top sectionning
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap in main
 section_children:
  1|chap in main
  2|Chapter in included file
  3|Chapter in included file
  4|Chapter in included file Include
  5|Chapter in included file
  6|Chapter in included file
  7|A last
2|chap in main
 associated_anchor_command: in main
 associated_node: in main
 section_directions:
  next->Chapter in included file
  up->top sectionning
 toplevel_directions:
  next->Chapter in included file
  prev->top sectionning
  up->top sectionning
3|Chapter in included file
 associated_anchor_command: Chapter in included file
 associated_node: Chapter in included file
 section_directions:
  next->Chapter in included file
  prev->chap in main
  up->top sectionning
 toplevel_directions:
  next->Chapter in included file
  prev->chap in main
  up->top sectionning
 section_children:
  1|Section
4|Section
 associated_anchor_command: Section
 associated_node: Section
 section_directions:
  up->Chapter in included file
 section_children:
  1|Subsection
5|Subsection
 associated_anchor_command: Subsection
 associated_node: Subsection
 section_directions:
  up->Section
6|Chapter in included file
 section_directions:
  next->Chapter in included file Include
  prev->Chapter in included file
  up->top sectionning
 toplevel_directions:
  next->Chapter in included file Include
  prev->Chapter in included file
  up->top sectionning
 section_children:
  1|Section
7|Section
 section_directions:
  up->Chapter in included file
 section_children:
  1|Subsection
8|Subsection
 section_directions:
  up->Section
9|Chapter in included file Include
 section_directions:
  next->Chapter in included file
  prev->Chapter in included file
  up->top sectionning
 toplevel_directions:
  next->Chapter in included file
  prev->Chapter in included file
  up->top sectionning
 section_children:
  1|Section Include
10|Section Include
 section_directions:
  up->Chapter in included file Include
 section_children:
  1|Subsection Include
11|Subsection Include
 section_directions:
  up->Section Include
12|Chapter in included file
 section_directions:
  next->Chapter in included file
  prev->Chapter in included file Include
  up->top sectionning
 toplevel_directions:
  next->Chapter in included file
  prev->Chapter in included file Include
  up->top sectionning
 section_children:
  1|Section
13|Section
 section_directions:
  up->Chapter in included file
 section_children:
  1|Subsection
14|Subsection
 section_directions:
  up->Section
15|Chapter in included file
 section_directions:
  next->A last
  prev->Chapter in included file
  up->top sectionning
 toplevel_directions:
  next->A last
  prev->Chapter in included file
  up->top sectionning
 section_children:
  1|Section
16|Section
 section_directions:
  up->Chapter in included file
 section_children:
  1|Subsection
17|Subsection
 section_directions:
  up->Section
18|A last
 associated_anchor_command: last chap
 associated_node: last chap
 section_directions:
  prev->Chapter in included file
  up->top sectionning
 toplevel_directions:
  prev->Chapter in included file
  up->top sectionning
';

$result_sectioning_root{'custom_heading_with_include_in_command'} = 'level: -1
list:
 1|top sectionning
';

$result_headings_list{'custom_heading_with_include_in_command'} = '';


$result_converted{'latex_text'}->{'custom_heading_with_include_in_command'} = '\\pagestyle{double}%
\\newpagestyle{custom}{%
\\sethead[\\Texinfothechapterheading{}\\chaptertitle{} \\emph{\\Texinfotheinclude{}}][][\\thepage{}]%
{\\Texinfothechapterheading{}\\chaptertitle{} \\emph{\\Texinfotheinclude{}}}{}{\\thepage{}}%
}%
\\pagestyle{custom}%

\\begin{document}
\\tableofcontents\\newpage
\\label{anchor:Top}%
\\Texinfochapter{{chap in main}}
\\label{anchor:in-main}%

\\renewcommand{\\Texinfotheinclude}{section\\_file.texi}%
\\textbackslash{}input texinfo 

\\Texinfochapter{{Chapter in included file}}
\\label{anchor:Chapter-in-included-file}%


\\section{{Section}}
\\label{anchor:Section}%


\\subsection{{Subsection}}
\\label{anchor:Subsection}%

\\renewcommand{\\Texinfotheinclude}{}%

\\renewcommand{\\Texinfotheinclude}{section\\_file\\_no\\_node.texi}%


\\Texinfochapter{{Chapter in included file}}

\\section{{Section}}

\\subsection{{Subsection}}

\\renewcommand{\\Texinfotheinclude}{}%

\\renewcommand{\\Texinfotheinclude}{section\\_file\\_no\\_node\\_include.texi}%


\\Texinfochapter{{Chapter in included file Include}}
\\label{anchor:Chapter-in-included-file-Include}%

\\section{{Section Include}}
\\label{anchor:Section-Include}%

\\subsection{{Subsection Include}}
\\label{anchor:Subsection-Include}%


Now include file
\\renewcommand{\\Texinfotheinclude}{section\\_file\\_no\\_node.texi}%


\\Texinfochapter{{Chapter in included file}}

\\section{{Section}}

\\subsection{{Subsection}}

\\renewcommand{\\Texinfotheinclude}{section\\_file\\_no\\_node\\_include.texi}%

\\renewcommand{\\Texinfotheinclude}{}%

\\renewcommand{\\Texinfotheinclude}{section\\_file\\_no\\_node.texi}%


\\Texinfochapter{{Chapter in included file}}

\\section{{Section}}

\\subsection{{Subsection}}

\\renewcommand{\\Texinfotheinclude}{}%


\\Texinfochapter{{A last}}
\\label{anchor:last-chap}%

';

1;
