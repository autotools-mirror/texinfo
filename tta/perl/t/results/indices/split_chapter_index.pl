use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'split_chapter_index'} = '*document_root C10
 *before_node_section C2
  *before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@setfilename C1 split_chapter_index.texi:l3
   |text_arg:{split_chapter_index}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:split_chapter_index}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 split_chapter_index.texi:l5 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C8 split_chapter_index.texi:l6 {split indices}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:split indices}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 split_chapter_index.texi:l7
  |element_node:{Top}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entry a}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Text in top.\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 split_chapter_index.texi:l12
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 split_chapter_index.texi:l13
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{first}
     {normal_text:first}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 split_chapter_index.texi:l14
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 split_chapter_index.texi:l16 {first}
 |identifier:{first}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
 *normal_command@chapter C14 split_chapter_index.texi:l17 {First chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:First chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C5
   {normal_text:Text and then index entries\\n}
   *index_entry_command@cindex C1 split_chapter_index.texi:l20
   |element_node:{first}
   |index_entry:I{cp,2}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:entry in node}
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 split_chapter_index.texi:l21
   |element_node:{first}
   |index_entry:I{cp,3}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:! entry in node}
     {spaces_after_argument:\\n}
   *index_entry_command@findex C1 split_chapter_index.texi:l22
   |element_node:{first}
   |index_entry:I{fn,1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:fun in node}
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 split_chapter_index.texi:l23
   |element_node:{first}
   |index_entry:I{cp,4}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:entry in node}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 split_chapter_index.texi:l25
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 split_chapter_index.texi:l27
  |element_node:{first}
  |index_entry:I{cp,5}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entry after printindex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 split_chapter_index.texi:l29
  |element_node:{first}
  |index_entry:I{fn,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a function}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 split_chapter_index.texi:l30
  |element_node:{first}
  |index_entry:I{cp,6}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a concept in first}
    {spaces_after_argument:\\n}
  *index_entry_command@findex C1 split_chapter_index.texi:l31
  |element_node:{first}
  |index_entry:I{fn,3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:somewhere}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 split_chapter_index.texi:l33
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 split_chapter_index.texi:l34
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{section-1}
     {normal_text:section 1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 split_chapter_index.texi:l35
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 split_chapter_index.texi:l37 {section 1}
 |identifier:{section-1}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section 1}
    {spaces_after_argument:\\n}
 *normal_command@section C8 split_chapter_index.texi:l38 {Section 1}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 split_chapter_index.texi:l40
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 split_chapter_index.texi:l41
    {menu_entry_leading_text:*  }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{subsection-1}
     {normal_text:subsection 1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 split_chapter_index.texi:l42
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 split_chapter_index.texi:l44
  |element_node:{section-1}
  |index_entry:I{cp,7}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:something}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 split_chapter_index.texi:l46
  |element_node:{section-1}
  |index_entry:I{cp,8}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:another}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 split_chapter_index.texi:l48 {subsection 1}
 |identifier:{subsection-1}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subsection 1}
    {spaces_after_argument:\\n}
 *normal_command@subsection C6 split_chapter_index.texi:l49 {Subsection 1}
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In subsection 1\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 split_chapter_index.texi:l53
  |element_node:{subsection-1}
  |index_entry:I{cp,9}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:printindex subsection 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'split_chapter_index'} = '\\input texinfo @c -*-texinfo-*-

@setfilename split_chapter_index

@node Top
@top split indices
@cindex entry a

Text in top.


@menu
* first::
@end menu

@node first
@chapter First chapter

Text and then index entries
@cindex entry in node
@cindex ! entry in node
@findex fun in node
@cindex entry in node

@printindex cp

@cindex entry after printindex

@findex a function
@cindex a concept in first
@findex somewhere

@menu
* section 1::
@end menu

@node section 1
@section Section 1

@menu
*  subsection 1::
@end menu

@cindex something

@cindex another

@node subsection 1
@subsection Subsection 1

In subsection 1

@cindex printindex subsection 2

@bye
';


$result_texts{'split_chapter_index'} = '
split indices
*************

Text in top.


* first::

1 First chapter
***************

Text and then index entries




* section 1::

1.1 Section 1
=============

*  subsection 1::



1.1.1 Subsection 1
------------------

In subsection 1


';

$result_errors{'split_chapter_index'} = '';

$result_nodes_list{'split_chapter_index'} = '1|Top
 associated_section: split indices
 associated_title_command: split indices
 menus:
  first
 node_directions:
  next->first
2|first
 associated_section: 1 First chapter
 associated_title_command: 1 First chapter
 menus:
  section 1
 node_directions:
  prev->Top
  up->Top
3|section 1
 associated_section: 1.1 Section 1
 associated_title_command: 1.1 Section 1
 menus:
  subsection 1
 node_directions:
  up->first
4|subsection 1
 associated_section: 1.1.1 Subsection 1
 associated_title_command: 1.1.1 Subsection 1
 node_directions:
  up->section 1
';

$result_sections_list{'split_chapter_index'} = '1|split indices
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->First chapter
 section_children:
  1|First chapter
2|First chapter
 associated_anchor_command: first
 associated_node: first
 section_directions:
  up->split indices
 toplevel_directions:
  prev->split indices
  up->split indices
 section_children:
  1|Section 1
3|Section 1
 associated_anchor_command: section 1
 associated_node: section 1
 section_directions:
  up->First chapter
 section_children:
  1|Subsection 1
4|Subsection 1
 associated_anchor_command: subsection 1
 associated_node: subsection 1
 section_directions:
  up->Section 1
';

$result_sectioning_root{'split_chapter_index'} = 'level: -1
list:
 1|split indices
';

$result_headings_list{'split_chapter_index'} = '';

$result_indices_sort_strings{'split_chapter_index'} = 'cp:
 ! entry in node
 a concept in first
 another
 entry a
 entry after printindex
 entry in node
 entry in node
 printindex subsection 2
 something
fn:
 a function
 fun in node
 somewhere
';

$result_converted_sort_strings{'file_html'}->{'split_chapter_index'} = 'cp:
 ! entry in node
 a concept in first
 another
 entry a
 entry after printindex
 entry in node
 entry in node
 printindex subsection 2
 something
fn:
 a function
 fun in node
 somewhere
';

1;
