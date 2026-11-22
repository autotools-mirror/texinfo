use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodes_before_top'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C4 l1 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:first}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C1
    {spaces_before_argument: }
   *line_arg C4
   |manual_content:A{1|1}
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node-in-menu-before-top}
     {normal_text:node in menu before top}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l5
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C2 l7 {node in menu before top}
 |identifier:{node-in-menu-before-top}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:node in menu before top}
   *line_arg
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{first}
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C3
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{first}
    {normal_text:first}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l10 {top section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument: \\n}
  {empty_line:\\n}
  *normal_command@menu C3 l12
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l13
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{second-node}
     {normal_text:second node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l14
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l16 {second node}
 |identifier:{second-node}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:second node}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l17 {a chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a chapter}
    {spaces_after_argument:\\n}
';


$result_texis{'nodes_before_top'} = '@node first, Top, ,(dir)

@menu
* node in menu before top::
@end menu

@node node in menu before top,,,first

@node Top,,first
@top top section 

@menu
* second node::
@end menu

@node second node
@chapter a chapter
';


$result_texts{'nodes_before_top'} = '
* node in menu before top::


top section
***********

* second node::

1 a chapter
***********
';

$result_errors{'nodes_before_top'} = '* W l1|node `first\' not in menu
 warning: node `first\' not in menu

';

$result_nodes_list{'nodes_before_top'} = '1|first
 menus:
  node in menu before top
 node_directions:
  next->Top
  up->(dir)

2|node in menu before top
 node_directions:
  up->first
3|Top
 associated_section: top section
 associated_title_command: top section
 menus:
  second node
 node_directions:
  prev->first
4|second node
 associated_section: 1 a chapter
 associated_title_command: 1 a chapter
 node_directions:
  up->Top
';

$result_sections_list{'nodes_before_top'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->a chapter
 section_children:
  1|a chapter
2|a chapter
 associated_anchor_command: second node
 associated_node: second node
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'nodes_before_top'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'nodes_before_top'} = '';


$result_converted{'latex_text'}->{'nodes_before_top'} = '\\begin{document}
\\label{anchor:first}%


\\label{anchor:node-in-menu-before-top}%

\\label{anchor:Top}%
\\Texinfochapter{{a chapter}}
\\label{anchor:second-node}%
';

1;
