use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodes_after_top_before_chapter_texi2html'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C4 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Top node\\n}
  *@menu C4 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{second-node}
     {normal_text:second node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{third-node}
     {normal_text:third node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C4 l8 {second node}
 |EXTRA
 |identifier:{second-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:second node}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{third-node}
    {spaces_before_argument: }
    {normal_text:third node}
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:second node\\n}
  {empty_line:\\n}
 *@node C1 l12 {third node}
 |EXTRA
 |identifier:{third-node}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:third node}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{second-node}
    {normal_text:second node}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@chapter C1 l13 {chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
';


$result_texis{'nodes_after_top_before_chapter_texi2html'} = '@node Top
Top node
@menu
* second node::
* third node::
@end menu

@node second node, third node,Top,Top

second node

@node third node,,second node,Top
@chapter chapter
';


$result_texts{'nodes_after_top_before_chapter_texi2html'} = 'Top node
* second node::
* third node::


second node

1 chapter
*********
';

$result_errors{'nodes_after_top_before_chapter_texi2html'} = '';

$result_nodes_list{'nodes_after_top_before_chapter_texi2html'} = '1|Top
 menus:
  second node
  third node
 node_directions:
  next->second node
2|second node
 node_directions:
  next->third node
  prev->Top
  up->Top
3|third node
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->second node
  up->Top
';

$result_sections_list{'nodes_after_top_before_chapter_texi2html'} = '1|chapter
 associated_anchor_command: third node
 associated_node: third node
';

$result_sectioning_root{'nodes_after_top_before_chapter_texi2html'} = 'level: 0
list:
 1|chapter
';

$result_headings_list{'nodes_after_top_before_chapter_texi2html'} = '';

$result_converted_errors{'file_html'}->{'nodes_after_top_before_chapter_texi2html'} = '* W nodes_after_top_before_chapter_texi2html.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
