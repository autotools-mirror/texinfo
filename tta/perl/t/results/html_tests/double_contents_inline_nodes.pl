use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_contents_inline_nodes'} = '*document_root C8
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo @c -*-texinfo-*-\\n}
   {empty_line:\\n}
  *preamble_before_content C2
   *normal_command@contents C1 double_contents.texi:l3
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 double_contents.texi:l5 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C6 double_contents.texi:l6 {Double contents}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Double contents}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Double contents.\\n}
  {empty_line:\\n}
  *normal_command@menu C3 double_contents.texi:l10
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *menu_entry C4 double_contents.texi:l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 double_contents.texi:l12
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 double_contents.texi:l14 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 double_contents.texi:l15 {Chapter 1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@contents C1 double_contents.texi:l17
  |global_command_number:{2}
   *line_arg C1
    {spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:The chapter\\n}
  {empty_line:\\n}
  *normal_command@menu C3 double_contents.texi:l20
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 double_contents.texi:l21
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{section}
     {normal_text:section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 double_contents.texi:l22
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 double_contents.texi:l24 {section}
 |identifier:{section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
 *normal_command@section C3 double_contents.texi:l25 {section with contents}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section with contents}
    {spaces_after_argument:\\n}
  *normal_command@contents C1 double_contents.texi:l26
  |global_command_number:{3}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'double_contents_inline_nodes'} = '\\input texinfo @c -*-texinfo-*-

@contents

@node Top
@top Double contents

Double contents.

@menu 
* chapter::
@end menu

@node chapter
@chapter Chapter 1

@contents
The chapter

@menu
* section::
@end menu

@node section
@section section with contents
@contents

@bye
';


$result_texts{'double_contents_inline_nodes'} = '
Double contents
***************

Double contents.

* chapter::

1 Chapter 1
***********

The chapter

* section::

1.1 section with contents
=========================

';

$result_errors{'double_contents_inline_nodes'} = '';

$result_nodes_list{'double_contents_inline_nodes'} = '1|Top
 associated_section: Double contents
 associated_title_command: Double contents
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
 associated_section: 1.1 section with contents
 associated_title_command: 1.1 section with contents
 node_directions:
  up->chapter
';

$result_sections_list{'double_contents_inline_nodes'} = '1|Double contents
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
  up->Double contents
 toplevel_directions:
  prev->Double contents
  up->Double contents
 section_children:
  1|section with contents
3|section with contents
 associated_anchor_command: section
 associated_node: section
 section_directions:
  up->Chapter 1
';

$result_sectioning_root{'double_contents_inline_nodes'} = 'level: -1
list:
 1|Double contents
';

$result_headings_list{'double_contents_inline_nodes'} = '';

1;
