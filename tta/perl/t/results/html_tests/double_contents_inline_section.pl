use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'double_contents_inline_section'} = '*document_root C8
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@contents C1 double_contents.texi:l3
   |EXTRA
   |global_command_number:{1}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 double_contents.texi:l5 {Top}
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
 *@top C6 double_contents.texi:l6 {Double contents}
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
    {Double contents}
  {empty_line:\\n}
  *paragraph C1
   {Double contents.\\n}
  {empty_line:\\n}
  *@menu C3 double_contents.texi:l10
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
   *menu_entry C4 double_contents.texi:l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter}
    |normalized:{chapter}
     {chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 double_contents.texi:l12
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
 *@node C1 double_contents.texi:l14 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
 *@chapter C7 double_contents.texi:l15 {Chapter 1}
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
    {Chapter 1}
  {empty_line:\\n}
  *@contents C1 double_contents.texi:l17
  |EXTRA
  |global_command_number:{2}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  *paragraph C1
   {The chapter\\n}
  {empty_line:\\n}
  *@menu C3 double_contents.texi:l20
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 double_contents.texi:l21
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{section}
    |normalized:{section}
     {section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 double_contents.texi:l22
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
 *@node C1 double_contents.texi:l24 {section}
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
 *@section C3 double_contents.texi:l25 {section with contents}
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
    {section with contents}
  *@contents C1 double_contents.texi:l26
  |EXTRA
  |global_command_number:{3}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'double_contents_inline_section'} = '\\input texinfo @c -*-texinfo-*-

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


$result_texts{'double_contents_inline_section'} = '
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

$result_errors{'double_contents_inline_section'} = '';

$result_nodes_list{'double_contents_inline_section'} = '1|Top
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

$result_sections_list{'double_contents_inline_section'} = '1|Double contents
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

$result_sectioning_root{'double_contents_inline_section'} = 'level: -1
list:
 1|Double contents
';

$result_headings_list{'double_contents_inline_section'} = '';

1;
