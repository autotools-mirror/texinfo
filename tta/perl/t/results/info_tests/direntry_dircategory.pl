use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'direntry_dircategory'} = '*document_root C6
 *before_node_section C2
  *before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C9
   *normal_command@setfilename C1 direntry_dircategory.texi:l3
   |text_arg:{direntry_dircategory.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:direntry_dircategory.info}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@dircategory C1 direntry_dircategory.texi:l5
    *line_arg C5
     {spaces_before_argument: }
     {normal_text:``category---}
     *normal_command@var C1 direntry_dircategory.texi:l5
      *brace_container C1
       {normal_text:th  ere}
     {normal_text:?\'\'}
     {spaces_after_argument:\\n}
   *normal_command@direntry C3 direntry_dircategory.texi:l6
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_entry C6 direntry_dircategory.texi:l7
     {menu_entry_leading_text:* }
     *menu_entry_name C1
      {normal_text:foo}
     {menu_entry_separator:: }
     *menu_entry_node C3
     |manual_content:A{1|1}
      {normal_text:(}
      {normal_text:foo}
      {normal_text:)}
     {menu_entry_separator:.   }
     *menu_entry_description C1
      *preformatted C3
       {normal_text:``hello---}
       *normal_command@var C1 direntry_dircategory.texi:l7
        *brace_container C1
         {normal_text:there}
       {normal_text:?\'\'\\n}
    *normal_command@end C1 direntry_dircategory.texi:l8
    |text_arg:{direntry}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:direntry}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@dircategory C1 direntry_dircategory.texi:l10
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:cat2}
     {spaces_after_argument:\\n}
   *normal_command@direntry C4 direntry_dircategory.texi:l11
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_entry C4 direntry_dircategory.texi:l12
     {menu_entry_leading_text:* }
     *menu_entry_node C2
     |node_content:A{0|1}
     |normalized:{aaa}
      {normal_text:aaa}
      {space_at_end_menu_node: }
     {menu_entry_separator:::               }
     *menu_entry_description C1
      *preformatted C2
       {normal_text:aaaa\\n}
       {normal_text:                   bbbbb\\n}
    *menu_comment C1
     *preformatted C2
      {after_menu_description_line:\\n}
      {normal_text:menutitle\\n}
    *normal_command@end C1 direntry_dircategory.texi:l16
    |text_arg:{direntry}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:direntry}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
 *normal_command@node C1 direntry_dircategory.texi:l19 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C8 direntry_dircategory.texi:l20 {Test dircategory and direntry}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Test dircategory and direntry}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Text\\n}
  *normal_command@dircategory C1 direntry_dircategory.texi:l23
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:in text}
    {spaces_after_argument:\\n}
  *normal_command@direntry C3 direntry_dircategory.texi:l24
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C6 direntry_dircategory.texi:l25
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {normal_text:in text}
    {menu_entry_separator:: }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:in_text}
     {normal_text:)}
    {menu_entry_separator:. }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:in text\\n}
   *normal_command@end C1 direntry_dircategory.texi:l26
   |text_arg:{direntry}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:direntry}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 direntry_dircategory.texi:l28
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 direntry_dircategory.texi:l29
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 direntry_dircategory.texi:l30
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 direntry_dircategory.texi:l32 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 direntry_dircategory.texi:l33 {chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In chapter\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'direntry_dircategory'} = '\\input texinfo @c -*-texinfo-*-

@setfilename direntry_dircategory.info

@dircategory ``category---@var{th  ere}?\'\'
@direntry
* foo: (foo).   ``hello---@var{there}?\'\'
@end direntry

@dircategory cat2
@direntry
* aaa ::               aaaa
                   bbbbb

menutitle
@end direntry


@node Top
@top Test dircategory and direntry

Text
@dircategory in text
@direntry
* in text: (in_text). in text
@end direntry

@menu
* chapter::
@end menu

@node chapter
@chapter chapter

In chapter

@bye
';


$result_texts{'direntry_dircategory'} = '
* foo: (foo).   "hello--there?"

* aaa::               aaaa
                   bbbbb

menutitle


Test dircategory and direntry
*****************************

Text
* in text: (in_text). in text

* chapter::

1 chapter
*********

In chapter

';

$result_errors{'direntry_dircategory'} = '* W direntry_dircategory.texi:l23|@dircategory after first node
 warning: @dircategory after first node

* W direntry_dircategory.texi:l24|@direntry after first node
 warning: @direntry after first node

';

$result_nodes_list{'direntry_dircategory'} = '1|Top
 associated_section: Test dircategory and direntry
 associated_title_command: Test dircategory and direntry
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'direntry_dircategory'} = '1|Test dircategory and direntry
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->Test dircategory and direntry
 toplevel_directions:
  prev->Test dircategory and direntry
  up->Test dircategory and direntry
';

$result_sectioning_root{'direntry_dircategory'} = 'level: -1
list:
 1|Test dircategory and direntry
';

$result_headings_list{'direntry_dircategory'} = '';

1;
