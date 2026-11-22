use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'index_no_node'} = '*document_root C7
 *before_node_section C7
  *preamble_before_setfilename C1
   *preamble_before_beginning C2
    {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
    {text_before_beginning:\\n}
  *preamble_before_content C2
   *@setfilename C1 index_no_node.texi:l3
   |EXTRA
   |text_arg:{index_no_node}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:index_no_node}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *index_entry_command@cindex C1 index_no_node.texi:l5
  |EXTRA
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:truc}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Garbage\\n}
  *@printindex C1 index_no_node.texi:l7
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *@unnumbered C8 index_no_node.texi:l10 {unnumbered}
 |EXTRA
 |identifier:{unnumbered}
 |is_target:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered}
    {spaces_after_argument:\\n}
  *@printindex C1 index_no_node.texi:l11
  |EXTRA
  |global_command_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:bidule}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_no_node.texi:l13
  |EXTRA
  |index_entry:I{cp,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered}
    {spaces_after_argument:\\n}
  *paragraph C2
   {normal_text:in unnumbered\\n}
   *index_entry_command@cindex C1 index_no_node.texi:l15
   |EXTRA
   |index_entry:I{cp,3}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:unnumbered after text}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 index_no_node.texi:l17
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@top C15 index_no_node.texi:l19 {top section}
 |EXTRA
 |identifier:{top-section}
 |is_target:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_no_node.texi:l21
  |EXTRA
  |index_entry:I{cp,4}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_no_node.texi:l22
  |EXTRA
  |index_entry:I{cp,5}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_no_node.texi:l23
  |EXTRA
  |index_entry:I{cp,6}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_no_node.texi:l24
  |EXTRA
  |index_entry:I{cp,7}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_no_node.texi:l25
  |EXTRA
  |index_entry:I{cp,8}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_no_node.texi:l26
  |EXTRA
  |index_entry:I{cp,9}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Top node\\n}
  {empty_line:\\n}
  *@printindex C1 index_no_node.texi:l29
  |EXTRA
  |global_command_number:{4}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_no_node.texi:l31
  |EXTRA
  |index_entry:I{cp,10}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *@section C7 index_no_node.texi:l34 {second}
 |EXTRA
 |identifier:{second}
 |is_target:{1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:second}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 index_no_node.texi:l36
  |EXTRA
  |global_command_number:{5}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_no_node.texi:l37
  |EXTRA
  |index_entry:I{cp,11}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:second}
    {spaces_after_argument:\\n}
  *paragraph C2
   {normal_text:second node\\n}
   *index_entry_command@cindex C1 index_no_node.texi:l39
   |EXTRA
   |index_entry:I{cp,12}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:second}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 index_no_node.texi:l41
  |EXTRA
  |global_command_number:{6}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
 *@chapter C6 index_no_node.texi:l42 {Chapter}
 |EXTRA
 |identifier:{Chapter}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_no_node.texi:l43
  |EXTRA
  |index_entry:I{cp,13}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 index_no_node.texi:l45
  |EXTRA
  |global_command_number:{7}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  *paragraph C2
   {normal_text:Text of chapter\\n}
   *index_entry_command@cindex C1 index_no_node.texi:l47
   |EXTRA
   |index_entry:I{cp,14}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Chapter2}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@chapter C4 index_no_node.texi:l49 {Chapter 2}
 |EXTRA
 |identifier:{Chapter-2}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In chapter 2\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'index_no_node'} = '\\input texinfo @c -*-texinfo-*-

@setfilename index_no_node

@cindex truc
Garbage
@printindex cp


@unnumbered unnumbered
@printindex bidule

@cindex unnumbered
in unnumbered
@cindex unnumbered after text

@printindex cp

@top top section

@cindex top section
@cindex top section
@cindex top section
@cindex top section
@cindex top section
@cindex top section
Top node

@printindex cp

@cindex top section1


@section second

@printindex cp
@cindex second
second node
@cindex second

@printindex cp
@chapter Chapter
@cindex chapter

@printindex cp
Text of chapter
@cindex Chapter2

@chapter Chapter 2

In chapter 2

@bye
';


$result_texts{'index_no_node'} = '
Garbage


unnumbered
**********

in unnumbered


top section
***********

Top node




second
======

second node

1 Chapter
*********

Text of chapter

2 Chapter 2
***********

In chapter 2

';

$result_errors{'index_no_node'} = '* W index_no_node.texi:l5|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W index_no_node.texi:l7|printindex before document beginning: @printindex cp
 warning: printindex before document beginning: @printindex cp

* E index_no_node.texi:l11|unknown index `bidule\' in @printindex
 unknown index `bidule\' in @printindex

* W index_no_node.texi:l19|lowering the section level of @top appearing after a lower element
 warning: lowering the section level of @top appearing after a lower element

';

$result_nodes_list{'index_no_node'} = '';

$result_sections_list{'index_no_node'} = '1|unnumbered
 section_directions:
  next->top section
 toplevel_directions:
  next->top section
2|top section
 section_directions:
  next->Chapter
  prev->unnumbered
 toplevel_directions:
  next->Chapter
  prev->unnumbered
 section_children:
  1|second
3|second
 section_directions:
  up->top section
4|Chapter
 section_directions:
  next->Chapter 2
  prev->top section
 toplevel_directions:
  next->Chapter 2
  prev->top section
  up->top section
5|Chapter 2
 section_directions:
  prev->Chapter
 toplevel_directions:
  prev->Chapter
  up->top section
';

$result_sectioning_root{'index_no_node'} = 'level: 0
list:
 1|unnumbered
 2|top section
 3|Chapter
 4|Chapter 2
';

$result_headings_list{'index_no_node'} = '';

$result_indices_sort_strings{'index_no_node'} = 'cp:
 chapter
 Chapter2
 second
 second
 top section
 top section
 top section
 top section
 top section
 top section
 top section1
 truc
 unnumbered
 unnumbered after text
';

$result_converted_sort_strings{'file_html'}->{'index_no_node'} = 'cp:
 chapter
 Chapter2
 second
 second
 top section
 top section
 top section
 top section
 top section
 top section
 top section1
 truc
 unnumbered
 unnumbered after text
';

1;
