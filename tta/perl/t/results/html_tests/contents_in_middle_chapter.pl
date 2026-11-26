use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'contents_in_middle_chapter'} = '*document_root C8
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo @c -*-texinfo-*-\\n}
   {empty_line:\\n}
  *preamble
 *normal_command@node C1 contents_in_middle_chapter.texi:l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C6 contents_in_middle_chapter.texi:l4 {Contents in chapter}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Contents in chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Content in chapter.\\n}
  {empty_line:\\n}
  *normal_command@menu C3 contents_in_middle_chapter.texi:l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *menu_entry C4 contents_in_middle_chapter.texi:l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 contents_in_middle_chapter.texi:l10
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 contents_in_middle_chapter.texi:l12 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 contents_in_middle_chapter.texi:l13 {Chapter 1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:The chapter with contents\\n}
  *normal_command@contents C1 contents_in_middle_chapter.texi:l16
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 contents_in_middle_chapter.texi:l18
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 contents_in_middle_chapter.texi:l19
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{section}
     {normal_text:section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 contents_in_middle_chapter.texi:l20
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 contents_in_middle_chapter.texi:l22 {section}
 |identifier:{section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
 *normal_command@section C4 contents_in_middle_chapter.texi:l23 {section}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Section.\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'contents_in_middle_chapter'} = '\\input texinfo @c -*-texinfo-*-

@node Top
@top Contents in chapter

Content in chapter.

@menu 
* chapter::
@end menu

@node chapter
@chapter Chapter 1

The chapter with contents
@contents

@menu
* section::
@end menu

@node section
@section section

Section.

@bye
';


$result_texts{'contents_in_middle_chapter'} = 'Contents in chapter
*******************

Content in chapter.

* chapter::

1 Chapter 1
***********

The chapter with contents

* section::

1.1 section
===========

Section.

';

$result_errors{'contents_in_middle_chapter'} = '';

$result_nodes_list{'contents_in_middle_chapter'} = '1|Top
 associated_section: Contents in chapter
 associated_title_command: Contents in chapter
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chapter 1
 associated_title_command: 1 Chapter 1
 menus:
  section
 node_directions:
  prev->Top
  up->Top
3|section
 associated_section: 1.1 section
 associated_title_command: 1.1 section
 node_directions:
  up->chapter
';

$result_sections_list{'contents_in_middle_chapter'} = '1|Contents in chapter
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter 1
 section_children:
  1|Chapter 1
2|Chapter 1
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->Contents in chapter
 toplevel_directions:
  prev->Contents in chapter
  up->Contents in chapter
 section_children:
  1|section
3|section
 associated_anchor_command: section
 associated_node: section
 section_directions:
  up->Chapter 1
';

$result_sectioning_root{'contents_in_middle_chapter'} = 'level: -1
list:
 1|Contents in chapter
';

$result_headings_list{'contents_in_middle_chapter'} = '';

1;
