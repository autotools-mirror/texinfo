use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'node_footnote_end'} = '*document_root C8
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:test footnotes with nodes only}
   {empty_line:\\n}
 *@node C4 node_footnote.texi:l5 {Top}
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
  {empty_line:\\n}
  *@menu C6 node_footnote.texi:l7
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 node_footnote.texi:l8
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{@\'a}
    |normalized:{_00e1}
     *@\' C1 node_footnote.texi:l8
      *following_arg C1
       {a}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 node_footnote.texi:l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{@^a}
    |normalized:{_00e2}
     *@^ C1 node_footnote.texi:l9
      *following_arg C1
       {a}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 node_footnote.texi:l10
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
   *menu_entry C4 node_footnote.texi:l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{@`a}
    |normalized:{_00e0}
     *@` C1 node_footnote.texi:l11
      *following_arg C1
       {a}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 node_footnote.texi:l12
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
 *@node C4 node_footnote.texi:l14 {@\'a}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{_00e1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@\' C1 node_footnote.texi:l14
     *following_arg C1
      {a}
  {empty_line:\\n}
  *paragraph C6
   {node }
   *@\' C1 node_footnote.texi:l16
    *following_arg C1
     {a}
   {,\\n}
   {Footnote 1}
   *@footnote C1 node_footnote.texi:l17
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C2
      {foot 1 }
      *@\' C1 node_footnote.texi:l17
       *following_arg C1
        {a}
   {.\\n}
  {empty_line:\\n}
 *@node C4 node_footnote.texi:l19 {@^a}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{_00e2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@^ C1 node_footnote.texi:l19
     *following_arg C1
      {a}
  {empty_line:\\n}
  *paragraph C6
   {node }
   *@^ C1 node_footnote.texi:l21
    *following_arg C1
     {a}
   {,\\n}
   {Footnote 2}
   *@footnote C1 node_footnote.texi:l22
   |EXTRA
   |global_command_number:{2}
    *brace_command_context C1
     *paragraph C2
      {foot 2 }
      *@^ C1 node_footnote.texi:l22
       *following_arg C1
        {a}
   {.\\n}
  {empty_line:\\n}
 *@node C1 node_footnote.texi:l24 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
 *@chapter C4 node_footnote.texi:l25 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
  {empty_line:\\n}
  *@menu C3 node_footnote.texi:l27
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 node_footnote.texi:l28
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{@`a}
    |normalized:{_00e0}
     *@` C1 node_footnote.texi:l28
      *following_arg C1
       {a}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 node_footnote.texi:l29
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
 *@node C4 node_footnote.texi:l31 {@`a}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{_00e0}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@` C1 node_footnote.texi:l31
     *following_arg C1
      {a}
  {empty_line:\\n}
  *paragraph C6
   {node }
   *@` C1 node_footnote.texi:l33
    *following_arg C1
     {a}
   {,\\n}
   {Footnote 3}
   *@footnote C1 node_footnote.texi:l34
   |EXTRA
   |global_command_number:{3}
    *brace_command_context C1
     *paragraph C2
      {foot 3 }
      *@` C1 node_footnote.texi:l34
       *following_arg C1
        {a}
   {.\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'node_footnote_end'} = '\\input texinfo @c -*-texinfo-*-

@c test footnotes with nodes only

@node Top

@menu
* @\'a::
* @^a::
* chapter::
* @`a::
@end menu

@node @\'a

node @\'a,
Footnote 1@footnote{foot 1 @\'a}.

@node @^a

node @^a,
Footnote 2@footnote{foot 2 @^a}.

@node chapter
@chapter chapter

@menu
* @`a::
@end menu

@node @`a

node @`a,
Footnote 3@footnote{foot 3 @`a}.

@bye
';


$result_texts{'node_footnote_end'} = '

* a\'::
* a^::
* chapter::
* a`::


node a\',
Footnote 1.


node a^,
Footnote 2.

1 chapter
*********

* a`::


node a`,
Footnote 3.

';

$result_errors{'node_footnote_end'} = '* W node_footnote.texi:l10|node `chapter\' in menu in `Top\' but not under it in sectioning
 warning: node `chapter\' in menu in `Top\' but not under it in sectioning

';

$result_nodes_list{'node_footnote_end'} = '1|Top
 menus:
  @\'a
  @^a
  chapter
  @`a
 node_directions:
  next->@\'a
2|@\'a
 node_directions:
  next->@^a
  prev->Top
  up->Top
3|@^a
 node_directions:
  next->chapter
  prev->@\'a
  up->Top
4|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 menus:
  @`a
 node_directions:
  next->@`a
  prev->@^a
  up->Top
5|@`a
 node_directions:
  prev->chapter
  up->Top
';

$result_sections_list{'node_footnote_end'} = '1|chapter
 associated_anchor_command: chapter
 associated_node: chapter
';

$result_sectioning_root{'node_footnote_end'} = 'level: 0
list:
 1|chapter
';

$result_headings_list{'node_footnote_end'} = '';

$result_converted_errors{'file_html'}->{'node_footnote_end'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'file_name' => 'node_footnote.texi',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
