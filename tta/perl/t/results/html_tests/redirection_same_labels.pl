use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'redirection_same_labels'} = 'U0 unit{C3}{S:@top the top}{n:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l2 {the top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:the top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C5 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C3
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:* @"i::}
       {spaces_after_argument:\\n}
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:* @~{@dotless{i}}::}
       {spaces_after_argument:\\n}
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:* @^i::}
       {spaces_after_argument:\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{umlaut}
     {normal_text:umlaut}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{circumflex}
     {normal_text:circumflex}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l10
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C4}{S:@chapter 1 umlaut}{n:umlaut}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U2]
FastBack: [U0]
Next: [U2]
Up: [U0]
NodeNext: [U2]
NodePrev: [U0]
NodeUp: [U0]
NodeForward: [U1]
NodeBack: [U0]
 *normal_command@node C1 l12 {umlaut}
 |EXTRA
 |identifier:{umlaut}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:umlaut}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l13 {umlaut}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:umlaut}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 l15
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l16
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_00ef}
     *normal_command@" C1 l16
      *following_arg C1
       {normal_text:i}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l17
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0129}
     *normal_command@~ C1 l17
      *brace_container C1
       *normal_command@dotless C1 l17
        *brace_container C1
         {normal_text:i}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l18
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C2 l20 {@"i}
 |EXTRA
 |identifier:{_00ef}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@" C1 l20
     *following_arg C1
      {normal_text:i}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C2 l22 {@~{@dotless{i}}}
 |EXTRA
 |identifier:{_0129}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@~ C1 l22
     *brace_container C1
      *normal_command@dotless C1 l22
       *brace_container C1
        {normal_text:i}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U2 unit{C3}{S:@chapter 2 circumflex}{n:circumflex}
unit_directions:D[prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
FastBack: [U1]
Prev: [U1]
Up: [U0]
NodePrev: [U1]
NodeUp: [U0]
NodeForward: [U2]
NodeBack: [U2]
 *normal_command@node C1 l24 {circumflex}
 |EXTRA
 |identifier:{circumflex}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:circumflex}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l25 {circumflex}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:circumflex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l27
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l28
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_00ee}
     *normal_command@^ C1 l28
      *following_arg C1
       {normal_text:i}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l29
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l31 {@^i}
 |EXTRA
 |identifier:{_00ee}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@^ C1 l31
     *following_arg C1
      {normal_text:i}
    {spaces_after_argument:\\n}
';


$result_texis{'redirection_same_labels'} = '@node Top
@top the top

@menu
@c * @"i::
@c * @~{@dotless{i}}::
@c * @^i::
* umlaut::
* circumflex::
@end menu

@node umlaut
@chapter umlaut

@menu
* @"i::
* @~{@dotless{i}}::
@end menu

@node @"i

@node @~{@dotless{i}}

@node circumflex
@chapter circumflex

@menu
* @^i::
@end menu

@node @^i
';


$result_texts{'redirection_same_labels'} = 'the top
*******

* umlaut::
* circumflex::

1 umlaut
********

* i"::
* i~::



2 circumflex
************

* i^::

';

$result_errors{'redirection_same_labels'} = '';

$result_nodes_list{'redirection_same_labels'} = '1|Top
 associated_section: the top
 associated_title_command: the top
 menus:
  umlaut
  circumflex
 node_directions:
  next->umlaut
2|umlaut
 associated_section: 1 umlaut
 associated_title_command: 1 umlaut
 menus:
  @"i
  @~{@dotless{i}}
 node_directions:
  next->circumflex
  prev->Top
  up->Top
3|@"i
 node_directions:
  next->@~{@dotless{i}}
  up->umlaut
4|@~{@dotless{i}}
 node_directions:
  prev->@"i
  up->umlaut
5|circumflex
 associated_section: 2 circumflex
 associated_title_command: 2 circumflex
 menus:
  @^i
 node_directions:
  prev->umlaut
  up->Top
6|@^i
 node_directions:
  up->circumflex
';

$result_sections_list{'redirection_same_labels'} = '1|the top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->umlaut
 section_children:
  1|umlaut
  2|circumflex
2|umlaut
 associated_anchor_command: umlaut
 associated_node: umlaut
 section_directions:
  next->circumflex
  up->the top
 toplevel_directions:
  next->circumflex
  prev->the top
  up->the top
3|circumflex
 associated_anchor_command: circumflex
 associated_node: circumflex
 section_directions:
  prev->umlaut
  up->the top
 toplevel_directions:
  prev->umlaut
  up->the top
';

$result_sectioning_root{'redirection_same_labels'} = 'level: -1
list:
 1|the top
';

$result_headings_list{'redirection_same_labels'} = '';

1;
