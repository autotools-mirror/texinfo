use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'semi_auto'} = '*document_root C9
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l2 {Top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Chap1}
     {normal_text:Chap1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Section-non-auto}
     {normal_text:Section non auto}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l7
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {Chap1}
 |identifier:{Chap1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap1}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l10 {Chapter 1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l12
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l13
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Sec-in-chapter}
     {normal_text:Sec in chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l14
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l16 {Sec in chapter}
 |identifier:{Sec-in-chapter}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Sec in chapter}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l17 {Sec in chapter}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Sec in chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l19 {Section non auto}
 |identifier:{Section-non-auto}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Section non auto}
   *line_arg
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{Chap1}
    {spaces_before_argument: }
    {normal_text:Chap1}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@section C1 l20 {Section}
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
';


$result_texis{'semi_auto'} = '@node Top
@top Top

@menu
* Chap1::
* Section non auto::
@end menu

@node Chap1
@chapter Chapter 1

@menu
* Sec in chapter::
@end menu

@node Sec in chapter
@section Sec in chapter

@node Section non auto,, Chap1, Top
@section Section
';


$result_texts{'semi_auto'} = 'Top
***

* Chap1::
* Section non auto::

1 Chapter 1
***********

* Sec in chapter::

1.1 Sec in chapter
==================

1.2 Section
===========
';

$result_errors{'semi_auto'} = '* W l6|unexpected node `Section non auto\' in menu
 warning: unexpected node `Section non auto\' in menu

';

$result_nodes_list{'semi_auto'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  Chap1
  Section non auto
 node_directions:
  next->Chap1
2|Chap1
 associated_section: 1 Chapter 1
 associated_title_command: 1 Chapter 1
 menus:
  Sec in chapter
 node_directions:
  next->Section non auto
  prev->Top
  up->Top
3|Sec in chapter
 associated_section: 1.1 Sec in chapter
 associated_title_command: 1.1 Sec in chapter
 node_directions:
  next->Section non auto
  up->Chap1
4|Section non auto
 associated_section: 1.2 Section
 associated_title_command: 1.2 Section
 node_directions:
  prev->Chap1
  up->Top
';

$result_sections_list{'semi_auto'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter 1
 section_children:
  1|Chapter 1
2|Chapter 1
 associated_anchor_command: Chap1
 associated_node: Chap1
 section_directions:
  up->Top
 toplevel_directions:
  prev->Top
  up->Top
 section_children:
  1|Sec in chapter
  2|Section
3|Sec in chapter
 associated_anchor_command: Sec in chapter
 associated_node: Sec in chapter
 section_directions:
  next->Section
  up->Chapter 1
4|Section
 associated_anchor_command: Section non auto
 associated_node: Section non auto
 section_directions:
  prev->Sec in chapter
  up->Chapter 1
';

$result_sectioning_root{'semi_auto'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'semi_auto'} = '';

1;
