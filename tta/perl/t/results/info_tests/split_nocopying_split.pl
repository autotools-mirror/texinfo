use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'split_nocopying_split'} = '*document_root C6
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 split_nocopying.texi:l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C6 split_nocopying.texi:l4 {Test file used to test split Info without @@copying}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:Test file used to test split Info without }
    *@@
    {normal_text:copying}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:This is the top node.\\n}
  {empty_line:\\n}
  *@menu C3 split_nocopying.texi:l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 split_nocopying.texi:l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Ch1}
     {normal_text:Ch1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 split_nocopying.texi:l10
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 split_nocopying.texi:l12 {Ch1}
 |EXTRA
 |identifier:{Ch1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Ch1}
    {spaces_after_argument:\\n}
 *@chapter C4 split_nocopying.texi:l13 {Ch1}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Ch1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:First chapter.\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'split_nocopying_split'} = '\\input texinfo

@node Top
@top Test file used to test split Info without @@copying

This is the top node.

@menu
* Ch1::
@end menu

@node Ch1
@chapter Ch1

First chapter.

@bye
';


$result_texts{'split_nocopying_split'} = 'Test file used to test split Info without @copying
**************************************************

This is the top node.

* Ch1::

1 Ch1
*****

First chapter.

';

$result_errors{'split_nocopying_split'} = '';

$result_nodes_list{'split_nocopying_split'} = '1|Top
 associated_section: Test file used to test split Info without @@copying
 associated_title_command: Test file used to test split Info without @@copying
 menus:
  Ch1
 node_directions:
  next->Ch1
2|Ch1
 associated_section: 1 Ch1
 associated_title_command: 1 Ch1
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'split_nocopying_split'} = '1|Test file used to test split Info without @@copying
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Ch1
 section_children:
  1|Ch1
2|Ch1
 associated_anchor_command: Ch1
 associated_node: Ch1
 section_directions:
  up->Test file used to test split Info without @@copying
 toplevel_directions:
  prev->Test file used to test split Info without @@copying
  up->Test file used to test split Info without @@copying
';

$result_sectioning_root{'split_nocopying_split'} = 'level: -1
list:
 1|Test file used to test split Info without @@copying
';

$result_headings_list{'split_nocopying_split'} = '';

1;
