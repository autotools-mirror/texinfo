use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'sample_utf8'} = '*document_root C10
 *before_node_section C2
  *preamble_before_setfilename C2
   *preamble_before_beginning C1
    {text_before_beginning:\\input texinfo   @c -*-texinfo-*-\\n}
   *@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%**start of header}
     {spaces_after_argument:\\n}
  *preamble_before_content C12
   *@setfilename C1 sample_utf8.texi:l3
   |EXTRA
   |text_arg:{sample_utf8.info}
    *line_arg C3
     {spaces_before_argument: }
     {sample_utf8.info}
     {spaces_after_argument:\\n}
   *@settitle C1 sample_utf8.texi:l4
    *line_arg C3
     {spaces_before_argument: }
     {Sample 示例 ĄĘ ù}
     {spaces_after_argument:\\n}
   *@documentencoding C1 sample_utf8.texi:l5
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{UTF-8}
    *line_arg C3
     {spaces_before_argument: }
     {UTF-8}
     {spaces_after_argument:\\n}
   *@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%**end of header}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@copying C5 sample_utf8.texi:l8
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {This is a short example of a complete Texinfo file.\\n}
    {empty_line:\\n}
    *paragraph C2
     {Copyright (C) 2005 Someone.\\n}
     {Texinfo中文示例\\n}
    *@end C1 sample_utf8.texi:l13
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@titlepage C6 sample_utf8.texi:l15
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *@title C1 sample_utf8.texi:l16
     *line_arg C3
      {spaces_before_argument: }
      {标题示例 ĄĘ ae ąę Â ù}
      {spaces_after_argument:\\n}
    *@page C1
     *line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C2
     {Texinfo中文示例\\n}
     *@vskip C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:0pt plus 1filll}
       {spaces_after_argument:\\n}
    *@insertcopying C1 sample_utf8.texi:l20
    |EXTRA
    |global_command_number:{1}
     *line_arg C1
      {spaces_before_argument:\\n}
    *@end C1 sample_utf8.texi:l21
    |EXTRA
    |text_arg:{titlepage}
     *line_arg C3
      {spaces_before_argument: }
      {titlepage}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:Output the table of the contents at the beginning.}
     {spaces_after_argument:\\n}
   *@contents C1 sample_utf8.texi:l24
   |EXTRA
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*@ifnottex C1 sample_utf8.texi:l26
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
 *@node C1 sample_utf8.texi:l27 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C7 sample_utf8.texi:l28 {Texinfo中文示例}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Texinfo中文示例}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@insertcopying C1 sample_utf8.texi:l30
  |EXTRA
  |global_command_number:{2}
  >SOURCEMARKS
  >expanded_conditional_command<end;1>
   >*@end C1 sample_utf8.texi:l31
   >|EXTRA
   >|text_arg:{ifnottex}
    >*line_arg C3
     >{spaces_before_argument: }
     >{ifnottex}
     >{spaces_after_argument:\\n}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *@menu C5 sample_utf8.texi:l33
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 sample_utf8.texi:l34
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_7b2c_4e00_7ae0_ff08First-Chapter_ff09}
     {第一章（First Chapter）}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C2
      {这是此示例文档的第一章\\n}
      {                           (with mixed cjk & latin char title)\\n}
   *menu_entry C4 sample_utf8.texi:l36
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Second-Chapter-AE-_0104_0118-ae-_0105_0119}
     {Second Chapter AE ĄĘ ae ąę}
    {menu_entry_separator:::  }
    *menu_entry_description C1
     *preformatted C1
      {this is chapter 2. AE ĄĘ ae ąę\\n}
   *menu_entry C4 sample_utf8.texi:l37
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Index-node}
     {Index node}
    {menu_entry_separator:::    }
    *menu_entry_description C1
     *preformatted C1
      {Complete index.\\n}
   *@end C1 sample_utf8.texi:l38
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *@node C1 sample_utf8.texi:l41 {第一章（First Chapter）}
 |EXTRA
 |identifier:{_7b2c_4e00_7ae0_ff08First-Chapter_ff09}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {第一章（First Chapter）}
    {spaces_after_argument:\\n}
 *@chapter C10 sample_utf8.texi:l42 {第一章（First Chapter）}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {第一章（First Chapter）}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 sample_utf8.texi:l44
  |EXTRA
  |element_node:{_7b2c_4e00_7ae0_ff08First-Chapter_ff09}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {chapter, first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   {This is the first chapter. 这是第一章。\\n}
   *index_entry_command@cindex C1 sample_utf8.texi:l47
   |EXTRA
   |element_node:{_7b2c_4e00_7ae0_ff08First-Chapter_ff09}
   |index_entry:I{cp,2}
    *line_arg C3
     {spaces_before_argument: }
     {另一个，index entry}
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 sample_utf8.texi:l48
   |EXTRA
   |element_node:{_7b2c_4e00_7ae0_ff08First-Chapter_ff09}
   |index_entry:I{cp,3}
    *line_arg C3
     {spaces_before_argument: }
     {ĄĘ ae ąę}
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 sample_utf8.texi:l49
   |EXTRA
   |element_node:{_7b2c_4e00_7ae0_ff08First-Chapter_ff09}
   |index_entry:I{cp,4}
    *line_arg C3
     {spaces_before_argument: }
     {é Â}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Here is a numbered list.\\n}
  {empty_line:\\n}
  *@enumerate C4 sample_utf8.texi:l53
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@item C3 sample_utf8.texi:l54
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C2
     {第\\n}
     {This is the first item.\\n}
    {empty_line:\\n}
   *@item C2 sample_utf8.texi:l57
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C2
     {ĄĘ\\n}
     {This is the second item.\\n}
   *@end C1 sample_utf8.texi:l59
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 sample_utf8.texi:l61 {Second Chapter AE ĄĘ ae ąę}
 |EXTRA
 |identifier:{Second-Chapter-AE-_0104_0118-ae-_0105_0119}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Second Chapter AE ĄĘ ae ąę}
    {spaces_after_argument:\\n}
 *@chapter C4 sample_utf8.texi:l62 {Chapter 2 AE ĄĘ ae ąę}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chapter 2 AE ĄĘ ae ąę}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Zażółć gęślą jaźń!\\n}
  {empty_line:\\n}
 *@node C1 sample_utf8.texi:l66 {Index node}
 |EXTRA
 |identifier:{Index-node}
 |is_target:{1}
 |isindex:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Index node}
    {spaces_after_argument:\\n}
 *@unnumbered C4 sample_utf8.texi:l67 {Index}
 |EXTRA
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Index}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 sample_utf8.texi:l69
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'sample_utf8'} = '\\input texinfo   @c -*-texinfo-*-
@c %**start of header
@setfilename sample_utf8.info
@settitle Sample 示例 ĄĘ ù
@documentencoding UTF-8
@c %**end of header

@copying
This is a short example of a complete Texinfo file.

Copyright (C) 2005 Someone.
Texinfo中文示例
@end copying

@titlepage
@title 标题示例 ĄĘ ae ąę Â ù
@page
Texinfo中文示例
@vskip 0pt plus 1filll
@insertcopying
@end titlepage

@c Output the table of the contents at the beginning.
@contents

@node Top
@top Texinfo中文示例

@insertcopying

@menu
* 第一章（First Chapter）:: 这是此示例文档的第一章
                           (with mixed cjk & latin char title)
* Second Chapter AE ĄĘ ae ąę::  this is chapter 2. AE ĄĘ ae ąę
* Index node::    Complete index.
@end menu


@node 第一章（First Chapter）
@chapter 第一章（First Chapter）

@cindex chapter, first

This is the first chapter. 这是第一章。
@cindex 另一个，index entry
@cindex ĄĘ ae ąę
@cindex é Â

Here is a numbered list.

@enumerate
@item 第
This is the first item.

@item ĄĘ
This is the second item.
@end enumerate

@node Second Chapter AE ĄĘ ae ąę
@chapter Chapter 2 AE ĄĘ ae ąę

Zażółć gęślą jaźń!

@node Index node
@unnumbered Index

@printindex cp

@bye
';


$result_texts{'sample_utf8'} = '



Texinfo中文示例
***************


* 第一章（First Chapter）:: 这是此示例文档的第一章
                           (with mixed cjk & latin char title)
* Second Chapter AE ĄĘ ae ąę::  this is chapter 2. AE ĄĘ ae ąę
* Index node::    Complete index.


1 第一章（First Chapter）
*************************


This is the first chapter. 这是第一章。

Here is a numbered list.

1. 第
This is the first item.

2. ĄĘ
This is the second item.

2 Chapter 2 AE ĄĘ ae ąę
***********************

Zażółć gęślą jaźń!

Index
*****


';

$result_errors{'sample_utf8'} = '';

$result_nodes_list{'sample_utf8'} = '1|Top
 associated_section: Texinfo中文示例
 associated_title_command: Texinfo中文示例
 menus:
  第一章（First Chapter）
  Second Chapter AE ĄĘ ae ąę
  Index node
 node_directions:
  next->第一章（First Chapter）
2|第一章（First Chapter）
 associated_section: 1 第一章（First Chapter）
 associated_title_command: 1 第一章（First Chapter）
 node_directions:
  next->Second Chapter AE ĄĘ ae ąę
  prev->Top
  up->Top
3|Second Chapter AE ĄĘ ae ąę
 associated_section: 2 Chapter 2 AE ĄĘ ae ąę
 associated_title_command: 2 Chapter 2 AE ĄĘ ae ąę
 node_directions:
  next->Index node
  prev->第一章（First Chapter）
  up->Top
4|Index node
 associated_section: Index
 associated_title_command: Index
 node_directions:
  prev->Second Chapter AE ĄĘ ae ąę
  up->Top
';

$result_sections_list{'sample_utf8'} = '1|Texinfo中文示例
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->第一章（First Chapter）
 section_children:
  1|第一章（First Chapter）
  2|Chapter 2 AE ĄĘ ae ąę
  3|Index
2|第一章（First Chapter）
 associated_anchor_command: 第一章（First Chapter）
 associated_node: 第一章（First Chapter）
 section_directions:
  next->Chapter 2 AE ĄĘ ae ąę
  up->Texinfo中文示例
 toplevel_directions:
  next->Chapter 2 AE ĄĘ ae ąę
  prev->Texinfo中文示例
  up->Texinfo中文示例
3|Chapter 2 AE ĄĘ ae ąę
 associated_anchor_command: Second Chapter AE ĄĘ ae ąę
 associated_node: Second Chapter AE ĄĘ ae ąę
 section_directions:
  next->Index
  prev->第一章（First Chapter）
  up->Texinfo中文示例
 toplevel_directions:
  next->Index
  prev->第一章（First Chapter）
  up->Texinfo中文示例
4|Index
 associated_anchor_command: Index node
 associated_node: Index node
 section_directions:
  prev->Chapter 2 AE ĄĘ ae ąę
  up->Texinfo中文示例
 toplevel_directions:
  prev->Chapter 2 AE ĄĘ ae ąę
  up->Texinfo中文示例
';

$result_sectioning_root{'sample_utf8'} = 'level: -1
list:
 1|Texinfo中文示例
';

$result_headings_list{'sample_utf8'} = '';

$result_indices_sort_strings{'sample_utf8'} = 'cp:
 ĄĘ ae ąę
 chapter, first
 é Â
 另一个，index entry
';

$result_converted_sort_strings{'file_html'}->{'sample_utf8'} = 'cp:
 ĄĘ ae ąę
 chapter, first
 é Â
 另一个，index entry
';

$result_converted_sort_strings{'file_info'}->{'sample_utf8'} = 'cp:
 ĄĘ ae ąę
 chapter, first
 é Â
 另一个，index entry
';

1;
