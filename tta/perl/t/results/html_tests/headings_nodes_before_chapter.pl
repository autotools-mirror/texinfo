use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'headings_nodes_before_chapter'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@settitle C1 l1
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:headings nodes before chapter}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C3 l3 {Node 1}
 |EXTRA
 |identifier:{Node-1}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Node 1}
    {spaces_after_argument:\\n}
  *normal_command@heading C1 l4
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Topic One}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C3 l6 {Node 2}
 |EXTRA
 |identifier:{Node-2}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Node 2}
    {spaces_after_argument:\\n}
  *normal_command@heading C1 l7
  |EXTRA
  |global_command_number:{2}
  |heading_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Topic Two}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {Cap 1}
 |EXTRA
 |identifier:{Cap-1}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Cap 1}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l10 {Chapter One}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter One}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 l12
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l13
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Node-1}
     {normal_text:Node 1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l14
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Node-2}
     {normal_text:Node 2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l15
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l17 {Cap 2}
 |EXTRA
 |identifier:{Cap-2}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Cap 2}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l18 {Chapter Two}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter Two}
    {spaces_after_argument:\\n}
';


$result_texis{'headings_nodes_before_chapter'} = '@settitle headings nodes before chapter

@node Node 1
@heading Topic One

@node Node 2
@heading Topic Two

@node Cap 1
@chapter Chapter One

@menu
* Node 1::
* Node 2::
@end menu

@node Cap 2
@chapter Chapter Two
';


$result_texts{'headings_nodes_before_chapter'} = '
Topic One
=========

Topic Two
=========

1 Chapter One
*************

* Node 1::
* Node 2::

2 Chapter Two
*************
';

$result_errors{'headings_nodes_before_chapter'} = '';

$result_nodes_list{'headings_nodes_before_chapter'} = '1|Node 1
 associated_title_command: @heading Topic One
 node_directions:
  next->Node 2
  up->Cap 1
2|Node 2
 associated_title_command: @heading Topic Two
 node_directions:
  prev->Node 1
  up->Cap 1
3|Cap 1
 associated_section: 1 Chapter One
 associated_title_command: 1 Chapter One
 menus:
  Node 1
  Node 2
 node_directions:
  next->Cap 2
4|Cap 2
 associated_section: 2 Chapter Two
 associated_title_command: 2 Chapter Two
 node_directions:
  prev->Cap 1
';

$result_sections_list{'headings_nodes_before_chapter'} = '1|Chapter One
 associated_anchor_command: Cap 1
 associated_node: Cap 1
 section_directions:
  next->Chapter Two
 toplevel_directions:
  next->Chapter Two
2|Chapter Two
 associated_anchor_command: Cap 2
 associated_node: Cap 2
 section_directions:
  prev->Chapter One
 toplevel_directions:
  prev->Chapter One
';

$result_sectioning_root{'headings_nodes_before_chapter'} = 'level: 0
list:
 1|Chapter One
 2|Chapter Two
';

$result_headings_list{'headings_nodes_before_chapter'} = '1|Topic One
 associated_anchor_command: Node 1
2|Topic Two
 associated_anchor_command: Node 2
';

1;
