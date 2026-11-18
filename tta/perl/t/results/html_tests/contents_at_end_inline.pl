use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'contents_at_end_inline'} = '*document_root C6
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 contents_at_end.texi:l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C6 contents_at_end.texi:l4 {Contents at end}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Contents at end}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Content at end.\\n}
  {empty_line:\\n}
  *@menu C3 contents_at_end.texi:l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *menu_entry C4 contents_at_end.texi:l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter}
     {chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 contents_at_end.texi:l10
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 contents_at_end.texi:l12 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter}
    {spaces_after_argument:\\n}
 *@chapter C5 contents_at_end.texi:l13 {Chapter 1}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chapter 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {The chapter\\n}
  {empty_line:\\n}
  *@contents C1 contents_at_end.texi:l17
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'contents_at_end_inline'} = '\\input texinfo @c -*-texinfo-*-

@node Top
@top Contents at end

Content at end.

@menu 
* chapter::
@end menu

@node chapter
@chapter Chapter 1

The chapter

@contents
@bye
';


$result_texts{'contents_at_end_inline'} = 'Contents at end
***************

Content at end.

* chapter::

1 Chapter 1
***********

The chapter

';

$result_errors{'contents_at_end_inline'} = '';

$result_nodes_list{'contents_at_end_inline'} = '1|Top
 associated_section: Contents at end
 associated_title_command: Contents at end
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

$result_sections_list{'contents_at_end_inline'} = '1|Contents at end
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
  up->Contents at end
 toplevel_directions:
  prev->Contents at end
  up->Contents at end
';

$result_sectioning_root{'contents_at_end_inline'} = 'level: -1
list:
 1|Contents at end
';

$result_headings_list{'contents_at_end_inline'} = '';

1;
