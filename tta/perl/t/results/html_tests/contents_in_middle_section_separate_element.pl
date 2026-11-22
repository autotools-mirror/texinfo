use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'contents_in_middle_section_separate_element'} = '*document_root C10
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C1 contents_in_middle_section.texi:l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C6 contents_in_middle_section.texi:l4 {Contents in section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Contents in section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Content in section.\\n}
  {empty_line:\\n}
  *normal_command@menu C3 contents_in_middle_section.texi:l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *menu_entry C4 contents_in_middle_section.texi:l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 contents_in_middle_section.texi:l10
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 contents_in_middle_section.texi:l12 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 contents_in_middle_section.texi:l13 {Chapter 1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 contents_in_middle_section.texi:l16
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 contents_in_middle_section.texi:l17
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{section}
     {normal_text:section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 contents_in_middle_section.texi:l18
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{section1}
     {normal_text:section1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 contents_in_middle_section.texi:l19
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 contents_in_middle_section.texi:l21 {section}
 |identifier:{section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
 *normal_command@section C5 contents_in_middle_section.texi:l22 {section}
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
   {normal_text:The section with contents\\n}
  *normal_command@contents C1 contents_in_middle_section.texi:l25
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 contents_in_middle_section.texi:l27 {section1}
 |identifier:{section1}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section1}
    {spaces_after_argument:\\n}
 *normal_command@section C4 contents_in_middle_section.texi:l28 {section 1}
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Section 1.\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'contents_in_middle_section_separate_element'} = '\\input texinfo @c -*-texinfo-*-

@node Top
@top Contents in section

Content in section.

@menu 
* chapter::
@end menu

@node chapter
@chapter Chapter 1


@menu
* section::
* section1::
@end menu

@node section
@section section

The section with contents
@contents

@node section1
@section section 1

Section 1.

@bye
';


$result_texts{'contents_in_middle_section_separate_element'} = 'Contents in section
*******************

Content in section.

* chapter::

1 Chapter 1
***********


* section::
* section1::

1.1 section
===========

The section with contents

1.2 section 1
=============

Section 1.

';

$result_errors{'contents_in_middle_section_separate_element'} = '';

$result_nodes_list{'contents_in_middle_section_separate_element'} = '1|Top
 associated_section: Contents in section
 associated_title_command: Contents in section
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chapter 1
 associated_title_command: 1 Chapter 1
 menus:
  section
  section1
 node_directions:
  prev->Top
  up->Top
3|section
 associated_section: 1.1 section
 associated_title_command: 1.1 section
 node_directions:
  next->section1
  up->chapter
4|section1
 associated_section: 1.2 section 1
 associated_title_command: 1.2 section 1
 node_directions:
  prev->section
  up->chapter
';

$result_sections_list{'contents_in_middle_section_separate_element'} = '1|Contents in section
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
  up->Contents in section
 toplevel_directions:
  prev->Contents in section
  up->Contents in section
 section_children:
  1|section
  2|section 1
3|section
 associated_anchor_command: section
 associated_node: section
 section_directions:
  next->section 1
  up->Chapter 1
4|section 1
 associated_anchor_command: section1
 associated_node: section1
 section_directions:
  prev->section
  up->Chapter 1
';

$result_sectioning_root{'contents_in_middle_section_separate_element'} = 'level: -1
list:
 1|Contents in section
';

$result_headings_list{'contents_in_middle_section_separate_element'} = '';

1;
