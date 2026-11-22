use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'lone_Top_node'} = 'U0 unit{C4}{S:@chapter 1 chap}{n:First}
UNIT_DIRECTIONS
This: [U0]
NodePrev: [U0]
NodeUp: [U0]
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C4 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
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
    |normalized:{First}
     {normal_text:First}
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
 *normal_command@node C1 l7 {First}
 |identifier:{First}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:First}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l8 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
';


$result_texis{'lone_Top_node'} = '@node Top

@menu
* First::
@end menu

@node First
@chapter chap
';


$result_texts{'lone_Top_node'} = '
* First::

1 chap
******
';

$result_errors{'lone_Top_node'} = '* W l4|node `First\' in menu in `Top\' but not under it in sectioning
 warning: node `First\' in menu in `Top\' but not under it in sectioning

';

$result_nodes_list{'lone_Top_node'} = '1|Top
 menus:
  First
 node_directions:
  next->First
2|First
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'lone_Top_node'} = '1|chap
 associated_anchor_command: First
 associated_node: First
';

$result_sectioning_root{'lone_Top_node'} = 'level: 0
list:
 1|chap
';

$result_headings_list{'lone_Top_node'} = '';


$result_converted{'latex_text'}->{'lone_Top_node'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{chap}}
\\label{anchor:First}%
';

1;
