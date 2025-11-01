use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'custom_heading_with_include'} = '*document_root C25
 *before_node_section C1
  *preamble_before_content C3
   *@setchapternewpage C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |misc_args:A{odd}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {odd}
   *@everyheading C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@thispage
     { }
     *@|
     { }
     *@thisfile
     { }
     *@|
     { }
     *@thischapter
   {empty_line:\\n}
 *@node C1 l4 {Top}
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
    {Top}
 *@top C4 l5 {top sectionning}
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
  *@contents C1 l7
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l9 {in main}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{in-main}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {in main}
 *@chapter C6 l10 {chap in main}
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
    {chap in main}
  {empty_line:\\n}
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{do-top|}
  >SOURCEMARKS
  >include<start;1>
   >*@include C1 l13
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{section_file.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{section_file.texi}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:do-top}
  *paragraph C2
   {\\input texinfo }
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:-*-texinfo-*-}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*@ifclear C8 section_file.texi:l3
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{do-top}
    >{raw:@node Top\\n}
    >{raw:@top\\n}
    >{raw:\\n}
    >{raw:@menu\\n}
    >{raw:* Chapter in included file::\\n}
    >{raw:@end menu\\n}
    >*@end C1 section_file.texi:l10
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifclear}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifclear}
  {empty_line:\\n}
 *@node C1 section_file.texi:l12 {Chapter in included file}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Chapter-in-included-file}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter in included file}
 *@chapter C4 section_file.texi:l13 {Chapter in included file}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter in included file}
  {empty_line:\\n}
  *@menu C3 section_file.texi:l15
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 section_file.texi:l16
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Section}
    |normalized:{Section}
     {Section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 section_file.texi:l17
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C1 section_file.texi:l19 {Section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{Section}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Section}
 *@section C4 section_file.texi:l20 {Section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Section}
  {empty_line:\\n}
  *@menu C3 section_file.texi:l22
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 section_file.texi:l23
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Subsection}
    |normalized:{Subsection}
     {Subsection}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 section_file.texi:l24
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C1 section_file.texi:l26 {Subsection}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{Subsection}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Subsection}
 *@subsection C5 section_file.texi:l27 {Subsection}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2.1.1}
 |section_level:{3}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Subsection}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<2><p:1>
   >*@ifset C8 section_file.texi:l29
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{subsub}
    >{raw:@menu\\n}
    >{raw:* Subsubsection::\\n}
    >{raw:@end menu\\n}
    >{raw:\\n}
    >{raw:@node Subsubsection\\n}
    >{raw:@subsubsection Subsubsection\\n}
    >*@end C1 section_file.texi:l36
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifset}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<3><p:1>
   >*@ifclear C4 section_file.texi:l38
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{do-top}
    >{raw:@contents\\n}
    >{raw:@bye\\n}
    >*@end C1 section_file.texi:l41
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifclear}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifclear}
  >include<end;1><p:1>
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;2><p:1>
   >*@include C1 l15
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{section_file_no_node.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{section_file_no_node.texi}
  {empty_line:\\n}
 *@chapter C2 section_file_no_node.texi:l2 {Chapter in included file}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter in included file}
  {empty_line:\\n}
 *@section C2 section_file_no_node.texi:l4 {Section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3.1}
 |section_level:{2}
 |section_number:{7}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Section}
  {empty_line:\\n}
 *@subsection C5 section_file_no_node.texi:l6 {Subsection}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3.1.1}
 |section_level:{3}
 |section_number:{8}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Subsection}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<4><p:1>
   >*@ifset C3 section_file_no_node.texi:l8
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{subsub}
    >{raw:@subsubsection Subsubsection\\n}
    >*@end C1 section_file_no_node.texi:l10
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifset}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;2><p:1>
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;3><p:1>
   >*@include C1 l17
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{section_file_no_node_include.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{section_file_no_node_include.texi}
  {empty_line:\\n}
 *@chapter C2 section_file_no_node_include.texi:l2 {Chapter in included file Include}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter in included file Include}
  {empty_line:\\n}
 *@section C2 section_file_no_node_include.texi:l4 {Section Include}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4.1}
 |section_level:{2}
 |section_number:{10}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Section Include}
  {empty_line:\\n}
 *@subsection C6 section_file_no_node_include.texi:l6 {Subsection Include}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4.1.1}
 |section_level:{3}
 |section_number:{11}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Subsection Include}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<5><p:1>
   >*@ifset C3 section_file_no_node_include.texi:l8
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{subsub}
    >{raw:@subsubsection Subsubsection Include\\n}
    >*@end C1 section_file_no_node_include.texi:l10
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifset}
  {empty_line:\\n}
  *paragraph C1
   {Now include file\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;4><p:1>
   >*@include C1 section_file_no_node_include.texi:l14
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{section_file_no_node.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{section_file_no_node.texi}
  {empty_line:\\n}
 *@chapter C2 section_file_no_node.texi:l2 {Chapter in included file}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{12}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter in included file}
  {empty_line:\\n}
 *@section C2 section_file_no_node.texi:l4 {Section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{5.1}
 |section_level:{2}
 |section_number:{13}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Section}
  {empty_line:\\n}
 *@subsection C6 section_file_no_node.texi:l6 {Subsection}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{5.1.1}
 |section_level:{3}
 |section_number:{14}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Subsection}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<6><p:1>
   >*@ifset C3 section_file_no_node.texi:l8
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{subsub}
    >{raw:@subsubsection Subsubsection\\n}
    >*@end C1 section_file_no_node.texi:l10
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifset}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;4><p:1>
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;3><p:1>
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;5><p:1>
   >*@include C1 l19
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{section_file_no_node.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{section_file_no_node.texi}
  {empty_line:\\n}
 *@chapter C2 section_file_no_node.texi:l2 {Chapter in included file}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{6}
 |section_level:{1}
 |section_number:{15}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter in included file}
  {empty_line:\\n}
 *@section C2 section_file_no_node.texi:l4 {Section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{6.1}
 |section_level:{2}
 |section_number:{16}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Section}
  {empty_line:\\n}
 *@subsection C4 section_file_no_node.texi:l6 {Subsection}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{6.1.1}
 |section_level:{3}
 |section_number:{17}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Subsection}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<7><p:1>
   >*@ifset C3 section_file_no_node.texi:l8
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{subsub}
    >{raw:@subsubsection Subsubsection\\n}
    >*@end C1 section_file_no_node.texi:l10
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifset}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;5><p:1>
  {empty_line:\\n}
 *@node C1 l21 {last chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{last-chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {last chap}
 *@chapter C2 l22 {A last}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{7}
 |section_level:{1}
 |section_number:{18}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {A last}
  {empty_line:\\n}
';


$result_texis{'custom_heading_with_include'} = '@setchapternewpage odd
@everyheading @thispage @| @thisfile @| @thischapter

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


$result_texts{'custom_heading_with_include'} = '
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

$result_errors{'custom_heading_with_include'} = '';

$result_nodes_list{'custom_heading_with_include'} = '1|Top
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

$result_sections_list{'custom_heading_with_include'} = '1|top sectionning
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

$result_sectioning_root{'custom_heading_with_include'} = 'level: -1
list:
 1|top sectionning
';

$result_headings_list{'custom_heading_with_include'} = '';


$result_converted{'latex_text'}->{'custom_heading_with_include'} = '\\pagestyle{double}%
\\newpagestyle{custom}{%
\\sethead[\\thepage{}][\\Texinfotheinclude{}][\\chaptername{} \\thechapter{} \\chaptertitle{}]%
{\\thepage{}}{\\Texinfotheinclude{}}{\\chaptername{} \\thechapter{} \\chaptertitle{}}%
}%
\\pagestyle{custom}%

\\begin{document}
\\tableofcontents\\newpage
\\label{anchor:Top}%
\\chapter{{chap in main}}
\\label{anchor:in-main}%

\\renewcommand{\\Texinfotheinclude}{section\\_file.texi}%
\\textbackslash{}input texinfo 

\\chapter{{Chapter in included file}}
\\label{anchor:Chapter-in-included-file}%


\\section{{Section}}
\\label{anchor:Section}%


\\subsection{{Subsection}}
\\label{anchor:Subsection}%

\\renewcommand{\\Texinfotheinclude}{}%

\\renewcommand{\\Texinfotheinclude}{section\\_file\\_no\\_node.texi}%


\\chapter{{Chapter in included file}}

\\section{{Section}}

\\subsection{{Subsection}}

\\renewcommand{\\Texinfotheinclude}{}%

\\renewcommand{\\Texinfotheinclude}{section\\_file\\_no\\_node\\_include.texi}%


\\chapter{{Chapter in included file Include}}

\\section{{Section Include}}

\\subsection{{Subsection Include}}


Now include file
\\renewcommand{\\Texinfotheinclude}{section\\_file\\_no\\_node.texi}%


\\chapter{{Chapter in included file}}

\\section{{Section}}

\\subsection{{Subsection}}

\\renewcommand{\\Texinfotheinclude}{section\\_file\\_no\\_node\\_include.texi}%

\\renewcommand{\\Texinfotheinclude}{}%

\\renewcommand{\\Texinfotheinclude}{section\\_file\\_no\\_node.texi}%


\\chapter{{Chapter in included file}}

\\section{{Section}}

\\subsection{{Subsection}}

\\renewcommand{\\Texinfotheinclude}{}%


\\chapter{{A last}}
\\label{anchor:last-chap}%

';

1;
