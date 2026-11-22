use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'regenerate_master_menu_with_menu_comment'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C4 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chap}
     {normal_text:chap}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_comment C1
    *preformatted C3
     {after_menu_description_line:\\n}
     {normal_text:A MC.\\n}
     {empty_line:\\n}
   *@detailmenu C4
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_comment C1
     *preformatted C6
      {normal_text: --- The Detailed Node Listing ---}
      {normal_text:\\n}
      {empty_line:\\n}
      {normal_text:Chapter}
      {empty_line:\\n}
      {empty_line:\\n}
    *menu_entry C4
     {menu_entry_leading_text:* }
     *menu_entry_node C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{sec}
      {normal_text:sec}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {normal_text:\\n}
    *@end C1
    |EXTRA
    |text_arg:{detailmenu}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:detailmenu}
      {spaces_after_argument:\\n}
   *@end C1 l8
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l10 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *@chapter C2 l11 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l13 {sec}
 |EXTRA
 |identifier:{sec}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec}
    {spaces_after_argument:\\n}
 *@section C1 l14 {Sec}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Sec}
    {spaces_after_argument:\\n}
';


$result_texis{'regenerate_master_menu_with_menu_comment'} = '@node Top
@top top

@menu
* chap::

A MC.

@detailmenu
 --- The Detailed Node Listing ---

Chapter

* sec::
@end detailmenu
@end menu

@node chap
@chapter Chapter

@node sec
@section Sec
';


$result_texts{'regenerate_master_menu_with_menu_comment'} = 'top
***

* chap::

A MC.

 -- The Detailed Node Listing --

Chapter

* sec::

1 Chapter
*********

1.1 Sec
=======
';

$result_errors{'regenerate_master_menu_with_menu_comment'} = '';

$result_nodes_list{'regenerate_master_menu_with_menu_comment'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chap
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
3|sec
 associated_section: 1.1 Sec
 associated_title_command: 1.1 Sec
 node_directions:
  up->chap
';

$result_sections_list{'regenerate_master_menu_with_menu_comment'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|Sec
3|Sec
 associated_anchor_command: sec
 associated_node: sec
 section_directions:
  up->Chapter
';

$result_sectioning_root{'regenerate_master_menu_with_menu_comment'} = 'level: -1
list:
 1|top
';

$result_headings_list{'regenerate_master_menu_with_menu_comment'} = '';

1;
