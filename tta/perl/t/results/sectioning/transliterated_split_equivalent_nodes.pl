use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'transliterated_split_equivalent_nodes'} = 'U0 unit{C2}{N:top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section C1
  *preamble_before_content
 *@node C4 l1 {top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_00e3}
     *@~ C1 l4
      *following_arg C1
       {normal_text:a}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{n}
     {normal_text:n}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_00e2}
     *@^ C1 l6
      *following_arg C1
       {normal_text:a}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C2}{N:@~a}{s:@unnumbered @~a}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
NodeNext: [U2]
NodePrev: [U0]
NodeUp: [U0]
NodeForward: [U2]
NodeBack: [U0]
 *@node C1 l9 {@~a}
 |EXTRA
 |identifier:{_00e3}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *@~ C1 l9
     *following_arg C1
      {normal_text:a}
    {spaces_after_argument:\\n}
 *@unnumbered C2 l10 {@~a}
 |EXTRA
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *@~ C1 l10
     *following_arg C1
      {normal_text:a}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U2 unit{C1}{N:n}
unit_directions:D[next->[U3]|prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Forward: [U3]
Back: [U1]
FastBack: [U1]
NodeNext: [U3]
NodePrev: [U1]
NodeUp: [U0]
NodeForward: [U3]
NodeBack: [U1]
 *@node C2 l12 {n}
 |EXTRA
 |identifier:{n}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:n}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U3 unit{C1}{N:@^a}
unit_directions:D[prev->[U2]]
UNIT_DIRECTIONS
This: [U3]
Back: [U2]
FastBack: [U1]
NodePrev: [U2]
NodeUp: [U0]
NodeBack: [U2]
 *@node C1 l14 {@^a}
 |EXTRA
 |identifier:{_00e2}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *@^ C1 l14
     *following_arg C1
      {normal_text:a}
    {spaces_after_argument:\\n}
';


$result_texis{'transliterated_split_equivalent_nodes'} = '@node top

@menu
* @~a::
* n::
* @^a::
@end menu

@node @~a
@unnumbered @~a

@node n

@node @^a
';


$result_texts{'transliterated_split_equivalent_nodes'} = '
* a~::
* n::
* a^::

a~
**


';

$result_errors{'transliterated_split_equivalent_nodes'} = '* W l4|node `@~a\' in menu in `top\' but not under it in sectioning
 warning: node `@~a\' in menu in `top\' but not under it in sectioning

';

$result_nodes_list{'transliterated_split_equivalent_nodes'} = '1|top
 menus:
  @~a
  n
  @^a
 node_directions:
  next->@~a
2|@~a
 associated_section: @~a
 associated_title_command: @~a
 node_directions:
  next->n
  prev->top
  up->top
3|n
 node_directions:
  next->@^a
  prev->@~a
  up->top
4|@^a
 node_directions:
  prev->n
  up->top
';

$result_sections_list{'transliterated_split_equivalent_nodes'} = '1|@~a
 associated_anchor_command: @~a
 associated_node: @~a
';

$result_sectioning_root{'transliterated_split_equivalent_nodes'} = 'level: 0
list:
 1|@~a
';

$result_headings_list{'transliterated_split_equivalent_nodes'} = '';

$result_converted_errors{'file_html'}->{'transliterated_split_equivalent_nodes'} = '* W transliterated_split_equivalent_nodes.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
