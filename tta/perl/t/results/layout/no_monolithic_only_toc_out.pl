use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_monolithic_only_toc_out'} = '*document_root C6
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 no_monolithic.texi:l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C8 no_monolithic.texi:l4 {Not monolithic}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Not monolithic}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {Not monolitic manual}
   *@footnote C1 no_monolithic.texi:l6
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {my footnote}
   {.\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 no_monolithic.texi:l8
  |EXTRA
  |element_node:{Top}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 no_monolithic.texi:l10
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 no_monolithic.texi:l11
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
   *@end C1 no_monolithic.texi:l12
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 no_monolithic.texi:l14 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter}
    {spaces_after_argument:\\n}
 *@chapter C8 no_monolithic.texi:l15 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Chapter.\\n}
  {empty_line:\\n}
  *@contents C1 no_monolithic.texi:l19
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  *@shortcontents C1 no_monolithic.texi:l20
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 no_monolithic.texi:l22
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'no_monolithic_only_toc_out'} = '\\input texinfo @c -*-texinfo-*-

@node Top
@top Not monolithic

Not monolitic manual@footnote{my footnote}.

@cindex top

@menu
* chapter::
@end menu

@node chapter
@chapter Chapter

Chapter.

@contents
@shortcontents

@printindex cp
@bye
';


$result_texts{'no_monolithic_only_toc_out'} = 'Not monolithic
**************

Not monolitic manual.


* chapter::

1 Chapter
*********

Chapter.


';

$result_errors{'no_monolithic_only_toc_out'} = '';

$result_nodes_list{'no_monolithic_only_toc_out'} = '1|Top
 associated_section: Not monolithic
 associated_title_command: Not monolithic
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'no_monolithic_only_toc_out'} = '1|Not monolithic
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->Not monolithic
 toplevel_directions:
  prev->Not monolithic
  up->Not monolithic
';

$result_sectioning_root{'no_monolithic_only_toc_out'} = 'level: -1
list:
 1|Not monolithic
';

$result_headings_list{'no_monolithic_only_toc_out'} = '';

$result_indices_sort_strings{'no_monolithic_only_toc_out'} = 'cp:
 top
';

$result_converted_sort_strings{'file_html'}->{'no_monolithic_only_toc_out'} = 'cp:
 top
';

1;
