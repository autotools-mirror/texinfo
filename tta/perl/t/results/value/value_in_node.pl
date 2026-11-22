use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'value_in_node'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@set C1
   |EXTRA
   |misc_args:A{node1|Node 1}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:node1 Node 1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C4
   |EXTRA
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
   *line_arg C4
   |EXTRA
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
   *line_arg C5
   |EXTRA
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l4 {Expansion in Node Names}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Expansion in Node Names}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{Node-1}
     {normal_text:Node 1}
     >SOURCEMARKS
     >value_expansion<start;1>{Node 1}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:node1}
     >value_expansion<end;1><p:6>
     {space_at_end_menu_node:  }
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l8
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {Node 1}
 |EXTRA
 |identifier:{Node-1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;2><p:1>{Node 1}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:node1}
    {normal_text:Node 1}
    >SOURCEMARKS
    >value_expansion<end;2><p:6>
   *line_arg
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 l11 {Chapter 1}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@set C1
  |EXTRA
  |misc_args:A{sec1|Section 1.1}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:sec1 Section 1.1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l15
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l16
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Section-1_002e1}
     {normal_text:Section 1.1}
     >SOURCEMARKS
     >value_expansion<start;3>{Section 1.1}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:sec1}
     >value_expansion<end;3><p:11>
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l17
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C3 l19 {Section 1.1}
 |EXTRA
 |identifier:{Section-1_002e1}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Section 1.1}
   *line_arg C1
    {spaces_before_argument: }
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Node-1}
    {spaces_before_argument: }
    {normal_text:Node 1}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Node-1}
    {spaces_before_argument: }
    {normal_text:Node 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l21
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Node-1}
     {normal_text:Node 1}
     >SOURCEMARKS
     >value_expansion<start;4>{Node 1}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:node1}
     >value_expansion<end;4><p:6>
   {normal_text:.\\n}
';


$result_texis{'value_in_node'} = '@set node1 Node 1

@node Top, (dir), (dir), (dir)
@top Expansion in Node Names

@menu
* Node 1  ::
@end menu

@node Node 1,, Top, Top
@chapter Chapter 1

@set sec1 Section 1.1

@menu
* Section 1.1::
@end menu

@node Section 1.1, , Node 1, Node 1

@xref{Node 1}.
';


$result_texts{'value_in_node'} = '
Expansion in Node Names
***********************

* Node 1::

1 Chapter 1
***********


* Section 1.1::


Node 1.
';

$result_errors{'value_in_node'} = '';

$result_nodes_list{'value_in_node'} = '1|Top
 associated_section: Expansion in Node Names
 associated_title_command: Expansion in Node Names
 menus:
  Node 1  
 node_directions:
  next-> (dir)
  prev-> (dir)
  up-> (dir)

2|Node 1
 associated_section: 1 Chapter 1
 associated_title_command: 1 Chapter 1
 menus:
  Section 1.1
 node_directions:
  prev->Top
  up->Top
3|Section 1.1
 node_directions:
  prev->Node 1
  up->Node 1
';

$result_sections_list{'value_in_node'} = '1|Expansion in Node Names
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter 1
 section_children:
  1|Chapter 1
2|Chapter 1
 associated_anchor_command: Node 1
 associated_node: Node 1
 section_directions:
  up->Expansion in Node Names
 toplevel_directions:
  prev->Expansion in Node Names
  up->Expansion in Node Names
';

$result_sectioning_root{'value_in_node'} = 'level: -1
list:
 1|Expansion in Node Names
';

$result_headings_list{'value_in_node'} = '';

1;
