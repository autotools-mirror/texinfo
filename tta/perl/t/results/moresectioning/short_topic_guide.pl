use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'short_topic_guide'} = '*document_root C11
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo.tex\\n}
   {empty_line:\\n}
  *preamble
 *normal_command@node C1 short_topic_guide.texi:l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 short_topic_guide.texi:l4 {A short example of guide topic}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:A short example of guide topic}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 short_topic_guide.texi:l6 {guide1}
 |identifier:{guide1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:guide1}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 short_topic_guide.texi:l7 {guide 1 for an easy use}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:guide 1 for an easy use}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 short_topic_guide.texi:l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 short_topic_guide.texi:l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{topic1}
     {normal_text:topic1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:topic1 description\\n}
   *menu_entry C4 short_topic_guide.texi:l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{topic3}
     {normal_text:topic3}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:topic3 description\\n}
   *normal_command@end C1 short_topic_guide.texi:l12
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C5 short_topic_guide.texi:l14 {topic1}
 |identifier:{topic1}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C2
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:topic1}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{topic3}
    {spaces_before_argument: }
    {normal_text:topic3}
    {spaces_after_argument:\\n}
  *normal_command@heading C1 short_topic_guide.texi:l15
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Topic 1 title}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 short_topic_guide.texi:l17
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {normal_text:More information\\n}
     {empty_line:\\n}
   *menu_entry C4 short_topic_guide.texi:l20
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{guide1}
     {normal_text:guide1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:guide 1\\n}
   *normal_command@end C1 short_topic_guide.texi:l21
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C5 short_topic_guide.texi:l23 {topic3}
 |identifier:{topic3}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C3
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:topic3}
   *line_arg C1
    {spaces_before_argument: }
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{topic1}
    {spaces_before_argument: }
    {normal_text:topic1}
    {spaces_after_argument:\\n}
  *normal_command@heading C1 short_topic_guide.texi:l24
  |global_command_number:{2}
  |heading_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Topic 3 title}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C5 short_topic_guide.texi:l26
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {normal_text:More information\\n}
     {empty_line:\\n}
   *menu_entry C4 short_topic_guide.texi:l29
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{guide1}
     {normal_text:guide1}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:guide 1\\n}
   *menu_entry C4 short_topic_guide.texi:l30
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{guide2}
     {normal_text:guide2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:guide 2\\n}
   *normal_command@end C1 short_topic_guide.texi:l31
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C7 short_topic_guide.texi:l33 {topic4}
 |identifier:{topic4}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:topic4}
    {spaces_after_argument:\\n}
  *normal_command@xrefname C1 short_topic_guide.texi:l34
  |global_command_number:{1}
  |heading_number:{3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Topic 4 only gets a ref name, no title}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:This is topic 4\\n}
  {empty_line:\\n}
  *normal_command@menu C4 short_topic_guide.texi:l38
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C2
     {normal_text:More information\\n}
     {empty_line:\\n}
   *menu_entry C4 short_topic_guide.texi:l41
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{guide2}
     {normal_text:guide2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:guide 2\\n}
   *normal_command@end C1 short_topic_guide.texi:l42
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 short_topic_guide.texi:l44 {guide2}
 |identifier:{guide2}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:guide2}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 short_topic_guide.texi:l45 {guide 2 for an in depth use}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:guide 2 for an in depth use}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 short_topic_guide.texi:l47
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 short_topic_guide.texi:l48
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{topic3}
     {normal_text:topic3}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:topic3 description\\n}
   *menu_entry C4 short_topic_guide.texi:l49
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{topic4}
     {normal_text:topic4}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:topic4 description\\n}
   *normal_command@end C1 short_topic_guide.texi:l50
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'short_topic_guide'} = '\\input texinfo.tex

@node Top
@top A short example of guide topic

@node guide1
@chapter guide 1 for an easy use

@menu
* topic1:: topic1 description
* topic3:: topic3 description
@end menu

@node topic1, topic3
@heading Topic 1 title

@menu
More information

* guide1:: guide 1
@end menu

@node topic3, , topic1
@heading Topic 3 title

@menu
More information

* guide1:: guide 1
* guide2:: guide 2
@end menu

@node topic4
@xrefname Topic 4 only gets a ref name, no title

This is topic 4

@menu
More information

* guide2:: guide 2
@end menu

@node guide2
@chapter guide 2 for an in depth use

@menu
* topic3:: topic3 description
* topic4:: topic4 description
@end menu

@bye
';


$result_texts{'short_topic_guide'} = 'A short example of guide topic
******************************

1 guide 1 for an easy use
*************************

* topic1:: topic1 description
* topic3:: topic3 description

Topic 1 title
=============

More information

* guide1:: guide 1

Topic 3 title
=============

More information

* guide1:: guide 1
* guide2:: guide 2


This is topic 4

More information

* guide2:: guide 2

2 guide 2 for an in depth use
*****************************

* topic3:: topic3 description
* topic4:: topic4 description

';

$result_errors{'short_topic_guide'} = '';

$result_nodes_list{'short_topic_guide'} = '1|Top
 associated_section: A short example of guide topic
 associated_title_command: A short example of guide topic
 node_directions:
  next->guide1
2|guide1
 associated_section: 1 guide 1 for an easy use
 associated_title_command: 1 guide 1 for an easy use
 menus:
  topic1
  topic3
 node_directions:
  next->guide2
  prev->Top
  up->Top
3|topic1
 associated_title_command: @heading Topic 1 title
 menus:
  guide1
 node_directions:
  next->topic3
4|topic3
 associated_title_command: @heading Topic 3 title
 menus:
  guide1
  guide2
 node_directions:
  prev->topic1
5|topic4
 associated_title_command: @xrefname Topic 4 only gets a ref name, no title
 menus:
  guide2
 node_directions:
  prev->topic3
  up->guide2
6|guide2
 associated_section: 2 guide 2 for an in depth use
 associated_title_command: 2 guide 2 for an in depth use
 menus:
  topic3
  topic4
 node_directions:
  prev->guide1
  up->Top
';

$result_sections_list{'short_topic_guide'} = '1|A short example of guide topic
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->guide 1 for an easy use
 section_children:
  1|guide 1 for an easy use
  2|guide 2 for an in depth use
2|guide 1 for an easy use
 associated_anchor_command: guide1
 associated_node: guide1
 section_directions:
  next->guide 2 for an in depth use
  up->A short example of guide topic
 toplevel_directions:
  next->guide 2 for an in depth use
  prev->A short example of guide topic
  up->A short example of guide topic
3|guide 2 for an in depth use
 associated_anchor_command: guide2
 associated_node: guide2
 section_directions:
  prev->guide 1 for an easy use
  up->A short example of guide topic
 toplevel_directions:
  prev->guide 1 for an easy use
  up->A short example of guide topic
';

$result_sectioning_root{'short_topic_guide'} = 'level: -1
list:
 1|A short example of guide topic
';

$result_headings_list{'short_topic_guide'} = '1|Topic 1 title
 associated_anchor_command: topic1
2|Topic 3 title
 associated_anchor_command: topic3
3|Topic 4 only gets a ref name, no title
 associated_anchor_command: topic4
';

1;
