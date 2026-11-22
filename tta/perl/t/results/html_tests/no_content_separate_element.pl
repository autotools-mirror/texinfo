use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_content_separate_element'} = '*document_root C6
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 no_content.texi:l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C6 no_content.texi:l4 {No ccontent}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:No ccontent}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:No content.\\n}
  {empty_line:\\n}
  *@menu C3 no_content.texi:l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *menu_entry C4 no_content.texi:l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 no_content.texi:l10
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 no_content.texi:l12 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *@chapter C4 no_content.texi:l13 {Chapter 1}
 |EXTRA
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
   {normal_text:The chapter\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'no_content_separate_element'} = '\\input texinfo @c -*-texinfo-*-

@node Top
@top No ccontent

No content.

@menu 
* chapter::
@end menu

@node chapter
@chapter Chapter 1

The chapter

@bye
';


$result_texts{'no_content_separate_element'} = 'No ccontent
***********

No content.

* chapter::

1 Chapter 1
***********

The chapter

';

$result_errors{'no_content_separate_element'} = '';

$result_nodes_list{'no_content_separate_element'} = '1|Top
 associated_section: No ccontent
 associated_title_command: No ccontent
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chapter 1
 associated_title_command: 1 Chapter 1
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'no_content_separate_element'} = '1|No ccontent
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
  up->No ccontent
 toplevel_directions:
  prev->No ccontent
  up->No ccontent
';

$result_sectioning_root{'no_content_separate_element'} = 'level: -1
list:
 1|No ccontent
';

$result_headings_list{'no_content_separate_element'} = '';

1;
