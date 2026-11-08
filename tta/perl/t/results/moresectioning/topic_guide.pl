use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'topic_guide'} = '*document_root C13
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo.tex\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 topic_guide.texi:l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C6 topic_guide.texi:l4 {An example of guide topic based manual}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {An example of guide topic based manual}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {This is an example of guide/topic based manual inspired by the Mallard\\n}
   {format.\\n}
  {empty_line:\\n}
  *@menu C4 topic_guide.texi:l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 topic_guide.texi:l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide1}
    |normalized:{guide1}
     {guide1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {the easy way\\n}
   *menu_entry C4 topic_guide.texi:l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide2}
    |normalized:{guide2}
     {guide2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {the perillous way\\n}
   *@end C1 topic_guide.texi:l12
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 topic_guide.texi:l14 {guide1}
 |EXTRA
 |identifier:{guide1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {guide1}
    {spaces_after_argument:\\n}
 *@chapter C6 topic_guide.texi:l15 {guide 1}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {guide 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {This is the guide for an easy use.\\n}
  {empty_line:\\n}
  *@menu C5 topic_guide.texi:l19
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 topic_guide.texi:l20
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{topic1}
    |normalized:{topic1}
     {topic1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {topic1 description\\n}
   *menu_entry C4 topic_guide.texi:l21
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{topic2}
    |normalized:{topic2}
     {topic2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {topic2 description\\n}
   *menu_entry C4 topic_guide.texi:l22
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{topic5}
    |normalized:{topic5}
     {topic5}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {topic5 description\\n}
   *@end C1 topic_guide.texi:l23
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C7 topic_guide.texi:l25 {topic1}
 |EXTRA
 |identifier:{topic1}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C2
   *line_arg C2
    {spaces_before_argument: }
    {topic1}
   *line_arg C3
   |EXTRA
   |node_content:{topic2}
   |normalized:{topic2}
    {spaces_before_argument: }
    {topic2}
    {spaces_after_argument:\\n}
  *@heading C1 topic_guide.texi:l26
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {Topic 1 title}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {This is topic 1.\\n}
  {empty_line:\\n}
  *@menu C4 topic_guide.texi:l30
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {More information\\n}
     {empty_line:\\n}
   *menu_entry C4 topic_guide.texi:l33
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide1}
    |normalized:{guide1}
     {guide1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {guide 1\\n}
   *@end C1 topic_guide.texi:l34
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C7 topic_guide.texi:l36 {topic2}
 |EXTRA
 |identifier:{topic2}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C3
   *line_arg C2
    {spaces_before_argument: }
    {topic2}
   *line_arg C2
   |EXTRA
   |node_content:{topic3}
   |normalized:{topic3}
    {spaces_before_argument: }
    {topic3}
   *line_arg C3
   |EXTRA
   |node_content:{topic1}
   |normalized:{topic1}
    {spaces_before_argument: }
    {topic1}
    {spaces_after_argument:\\n}
  *@heading C1 topic_guide.texi:l37
  |EXTRA
  |global_command_number:{2}
  |heading_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {Topic 2 title}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {This is topic 2\\n}
  {empty_line:\\n}
  *@menu C4 topic_guide.texi:l41
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {More information\\n}
     {empty_line:\\n}
   *menu_entry C4 topic_guide.texi:l44
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide1}
    |normalized:{guide1}
     {guide1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {guide 1\\n}
   *@end C1 topic_guide.texi:l45
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C7 topic_guide.texi:l47 {topic3}
 |EXTRA
 |identifier:{topic3}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C3
   *line_arg C2
    {spaces_before_argument: }
    {topic3}
   *line_arg C2
   |EXTRA
   |node_content:{topic5}
   |normalized:{topic5}
    {spaces_before_argument: }
    {topic5}
   *line_arg C3
   |EXTRA
   |node_content:{topic2}
   |normalized:{topic2}
    {spaces_before_argument: }
    {topic2}
    {spaces_after_argument:\\n}
  *@heading C1 topic_guide.texi:l48
  |EXTRA
  |global_command_number:{3}
  |heading_number:{3}
   *line_arg C3
    {spaces_before_argument: }
    {Topic 3 title}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {This is topic 3\\n}
  {empty_line:\\n}
  *@menu C3 topic_guide.texi:l52
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {More information\\n}
     {empty_line:\\n}
   *@end C1 topic_guide.texi:l55
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C7 topic_guide.texi:l57 {topic4}
 |EXTRA
 |identifier:{topic4}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {topic4}
    {spaces_after_argument:\\n}
  *@xrefname C1 topic_guide.texi:l58
  |EXTRA
  |global_command_number:{1}
  |heading_number:{4}
   *line_arg C3
    {spaces_before_argument: }
    {Topic 4 only gets a ref name, no title}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {This is topic 4\\n}
  {empty_line:\\n}
  *@menu C4 topic_guide.texi:l62
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {More information\\n}
     {empty_line:\\n}
   *menu_entry C4 topic_guide.texi:l65
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide2}
    |normalized:{guide2}
     {guide2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {guide 2\\n}
   *@end C1 topic_guide.texi:l66
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C7 topic_guide.texi:l68 {topic5}
 |EXTRA
 |identifier:{topic5}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C3
   *line_arg C2
    {spaces_before_argument: }
    {topic5}
   *line_arg C1
    {spaces_before_argument: }
   *line_arg C3
   |EXTRA
   |node_content:{topic3}
   |normalized:{topic3}
    {spaces_before_argument: }
    {topic3}
    {spaces_after_argument:\\n}
  *@heading C1 topic_guide.texi:l69
  |EXTRA
  |global_command_number:{4}
  |heading_number:{5}
   *line_arg C3
    {spaces_before_argument: }
    {Topic 5 title}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {This is topic 5\\n}
  {empty_line:\\n}
  *@menu C5 topic_guide.texi:l73
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {More information\\n}
     {empty_line:\\n}
   *menu_entry C4 topic_guide.texi:l76
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide1}
    |normalized:{guide1}
     {guide1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {guide 1\\n}
   *menu_entry C4 topic_guide.texi:l77
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{guide2}
    |normalized:{guide2}
     {guide2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {guide 2\\n}
   *@end C1 topic_guide.texi:l78
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 topic_guide.texi:l80 {guide2}
 |EXTRA
 |identifier:{guide2}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {guide2}
    {spaces_after_argument:\\n}
 *@chapter C6 topic_guide.texi:l81 {guide 2}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {guide 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {This is the guide for an in depth use\\n}
  {empty_line:\\n}
  *@menu C4 topic_guide.texi:l85
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 topic_guide.texi:l86
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{topic5}
    |normalized:{topic5}
     {topic5}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {topic5 description\\n}
   *menu_entry C4 topic_guide.texi:l87
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{topic4}
    |normalized:{topic4}
     {topic4}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {topic4 description\\n}
   *@end C1 topic_guide.texi:l88
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'topic_guide'} = '\\input texinfo.tex

@node Top
@top An example of guide topic based manual

This is an example of guide/topic based manual inspired by the Mallard
format.

@menu
* guide1:: the easy way
* guide2:: the perillous way
@end menu

@node guide1
@chapter guide 1

This is the guide for an easy use.

@menu
* topic1:: topic1 description
* topic2:: topic2 description
* topic5:: topic5 description
@end menu

@node topic1, topic2
@heading Topic 1 title

This is topic 1.

@menu
More information

* guide1:: guide 1
@end menu

@node topic2, topic3, topic1
@heading Topic 2 title

This is topic 2

@menu
More information

* guide1:: guide 1
@end menu

@node topic3, topic5, topic2
@heading Topic 3 title

This is topic 3

@menu
More information

@end menu

@node topic4
@xrefname Topic 4 only gets a ref name, no title

This is topic 4

@menu
More information

* guide2:: guide 2
@end menu

@node topic5, , topic3
@heading Topic 5 title

This is topic 5

@menu
More information

* guide1:: guide 1
* guide2:: guide 2
@end menu

@node guide2
@chapter guide 2

This is the guide for an in depth use

@menu
* topic5:: topic5 description
* topic4:: topic4 description
@end menu

@bye
';


$result_texts{'topic_guide'} = 'An example of guide topic based manual
**************************************

This is an example of guide/topic based manual inspired by the Mallard
format.

* guide1:: the easy way
* guide2:: the perillous way

1 guide 1
*********

This is the guide for an easy use.

* topic1:: topic1 description
* topic2:: topic2 description
* topic5:: topic5 description

Topic 1 title
=============

This is topic 1.

More information

* guide1:: guide 1

Topic 2 title
=============

This is topic 2

More information

* guide1:: guide 1

Topic 3 title
=============

This is topic 3

More information



This is topic 4

More information

* guide2:: guide 2

Topic 5 title
=============

This is topic 5

More information

* guide1:: guide 1
* guide2:: guide 2

2 guide 2
*********

This is the guide for an in depth use

* topic5:: topic5 description
* topic4:: topic4 description

';

$result_errors{'topic_guide'} = '';

$result_nodes_list{'topic_guide'} = '1|Top
 associated_section: An example of guide topic based manual
 associated_title_command: An example of guide topic based manual
 menus:
  guide1
  guide2
 node_directions:
  next->guide1
2|guide1
 associated_section: 1 guide 1
 associated_title_command: 1 guide 1
 menus:
  topic1
  topic2
  topic5
 node_directions:
  next->guide2
  prev->Top
  up->Top
3|topic1
 associated_title_command: @heading Topic 1 title
 menus:
  guide1
 node_directions:
  next->topic2
4|topic2
 associated_title_command: @heading Topic 2 title
 menus:
  guide1
 node_directions:
  next->topic3
  prev->topic1
5|topic3
 associated_title_command: @heading Topic 3 title
 menus:
 node_directions:
  next->topic5
  prev->topic2
6|topic4
 associated_title_command: @xrefname Topic 4 only gets a ref name, no title
 menus:
  guide2
 node_directions:
  prev->topic5
  up->guide2
7|topic5
 associated_title_command: @heading Topic 5 title
 menus:
  guide1
  guide2
 node_directions:
  prev->topic3
8|guide2
 associated_section: 2 guide 2
 associated_title_command: 2 guide 2
 menus:
  topic5
  topic4
 node_directions:
  prev->guide1
  up->Top
';

$result_sections_list{'topic_guide'} = '1|An example of guide topic based manual
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->guide 1
 section_children:
  1|guide 1
  2|guide 2
2|guide 1
 associated_anchor_command: guide1
 associated_node: guide1
 section_directions:
  next->guide 2
  up->An example of guide topic based manual
 toplevel_directions:
  next->guide 2
  prev->An example of guide topic based manual
  up->An example of guide topic based manual
3|guide 2
 associated_anchor_command: guide2
 associated_node: guide2
 section_directions:
  prev->guide 1
  up->An example of guide topic based manual
 toplevel_directions:
  prev->guide 1
  up->An example of guide topic based manual
';

$result_sectioning_root{'topic_guide'} = 'level: -1
list:
 1|An example of guide topic based manual
';

$result_headings_list{'topic_guide'} = '1|Topic 1 title
 associated_anchor_command: topic1
2|Topic 2 title
 associated_anchor_command: topic2
3|Topic 3 title
 associated_anchor_command: topic3
4|Topic 4 only gets a ref name, no title
 associated_anchor_command: topic4
5|Topic 5 title
 associated_anchor_command: topic5
';

1;
