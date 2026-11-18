use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'character_and_spaces_in_refs_out'} = 'U0 unit{C3}{N:Top}{s:@top Test refs}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section C1
  *preamble_before_content
 *@node C1 character_and_spaces_in_refs_text.texi:l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C4 character_and_spaces_in_refs_text.texi:l2 {Test refs}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Test refs}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 character_and_spaces_in_refs_text.texi:l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{node-to-avoid-DocBook-or-LaTeX-ignored}
     {node to avoid DocBook or LaTeX ignored}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{other-nodes}
     {other nodes}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 character_and_spaces_in_refs_text.texi:l7
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C2}{N:node to avoid DocBook or LaTeX ignored}{s:@chapter 1 first chapter}
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
NodeForward: [U2]
NodeBack: [U0]
 *@node C1 character_and_spaces_in_refs_text.texi:l9 {node to avoid DocBook or LaTeX ignored}
 |EXTRA
 |identifier:{node-to-avoid-DocBook-or-LaTeX-ignored}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {node to avoid DocBook or LaTeX ignored}
    {spaces_after_argument:\\n}
 *@chapter C13 character_and_spaces_in_refs_text.texi:l10 {first chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {first chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@subheading C1 character_and_spaces_in_refs_text.texi:l12
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {Testing distant nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C8
   *@ref C4 character_and_spaces_in_refs_text.texi:l14
    *brace_arg C3
    |EXTRA
    |node_content:A{1|1}
     {spaces_before_argument: }
     {a  node}
     {spaces_after_argument: }
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {manual}
   {\\n}
   *@ref C4 character_and_spaces_in_refs_text.texi:l15
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     {:}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@ref C4 character_and_spaces_in_refs_text.texi:l16
    *brace_arg C3
    |EXTRA
    |node_content:A{1|1}
     {spaces_before_argument: }
     {top}
     {spaces_after_argument: }
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {manual}
   {\\n}
   *@ref C4 character_and_spaces_in_refs_text.texi:l17
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     {node}
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {../manual/doc}
   {\\n}
  {empty_line:\\n}
  *@subheading C1 character_and_spaces_in_refs_text.texi:l19
  |EXTRA
  |global_command_number:{2}
  |heading_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {Testing local nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C10
   *@ref C1 character_and_spaces_in_refs_text.texi:l21
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
     {!_"#$%&\'()*+-.}
   {\\n}
   *@ref C1 character_and_spaces_in_refs_text.texi:l22
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
     {/;<=>?[\\]^_`|~}
   {\\n}
   *@ref C1 character_and_spaces_in_refs_text.texi:l23
    *brace_arg C2
    |EXTRA
    |node_content:A{1|1}
    |normalized:{Top}
     {spaces_before_argument: }
     {Top}
   {\\n}
   *@ref C1 character_and_spaces_in_refs_text.texi:l24
    *brace_arg C2
    |EXTRA
    |node_content:A{1|1}
    |normalized:{local-node}
     {spaces_before_argument:  }
     {local   node}
   {\\n}
   *@ref C1 character_and_spaces_in_refs_text.texi:l25
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0028texinfo_0029Cross-References}
     {(texinfo)Cross References}
   {\\n}
  {empty_line:\\n}
  *@anchor C1 character_and_spaces_in_refs_text.texi:l27
  |EXTRA
  |identifier:{_0028texinfo_0029Cross-References}
  |is_target:{1}
   *brace_arg C1
    {(texinfo)Cross References}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
U2 unit{C2}{N:other nodes}{s:@chapter 2 Chapter with nodes}
unit_directions:D[next->[U3]|prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Forward: [U3]
Back: [U1]
FastBack: [U1]
Prev: [U1]
Up: [U0]
NodeNext: [U3]
NodePrev: [U1]
NodeUp: [U0]
NodeForward: [U3]
NodeBack: [U1]
 *@node C1 character_and_spaces_in_refs_text.texi:l29 {other nodes}
 |EXTRA
 |identifier:{other-nodes}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {other nodes}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
    {spaces_before_argument: }
    {!_"#$%&\'()*+-.}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{node-to-avoid-DocBook-or-LaTeX-ignored}
    {spaces_before_argument: }
    {node to avoid DocBook or LaTeX ignored}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@chapter C4 character_and_spaces_in_refs_text.texi:l30 {Chapter with nodes}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chapter with nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 character_and_spaces_in_refs_text.texi:l32
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l33
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
     {!_"#$%&\'()*+-.}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l34
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
     {/;<=>?[\\]^_`|~}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l35
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{local-node}
     {local node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 character_and_spaces_in_refs_text.texi:l36
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U3 unit{C1}{N:!_"#$%&\'()*+-.}
unit_directions:D[next->[U4]|prev->[U2]]
UNIT_DIRECTIONS
This: [U3]
Forward: [U4]
Back: [U2]
FastBack: [U2]
NodeNext: [U4]
NodePrev: [U2]
NodeUp: [U2]
NodeForward: [U4]
NodeBack: [U2]
 *@node C2 character_and_spaces_in_refs_text.texi:l38 {!_"#$%&\'()*+-.}
 |EXTRA
 |identifier:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {!_"#$%&\'()*+-.}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
    {spaces_before_argument: }
    {/;<=>?[\\]^_`|~}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{other-nodes}
    {spaces_before_argument: }
    {other nodes}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{other-nodes}
    {spaces_before_argument: }
    {other nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U4 unit{C1}{N:/;<=>?[\\]^_`|~}
unit_directions:D[next->[U5]|prev->[U3]]
UNIT_DIRECTIONS
This: [U4]
Forward: [U5]
Back: [U3]
FastBack: [U2]
NodeNext: [U5]
NodePrev: [U3]
NodeUp: [U2]
NodeForward: [U5]
NodeBack: [U3]
 *@node C2 character_and_spaces_in_refs_text.texi:l40 {/;<=>?[\\]^_`|~}
 |EXTRA
 |identifier:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {/;<=>?[\\]^_`|~}
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{local-node}
    {local   node}
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
    {!_"#$%&\'()*+-.}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{other-nodes}
    {spaces_before_argument: }
    {other nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U5 unit{C2}{N:local   node}
unit_directions:D[prev->[U4]]
UNIT_DIRECTIONS
This: [U5]
Back: [U4]
FastBack: [U2]
NodePrev: [U4]
NodeUp: [U2]
NodeForward: [U3]
NodeBack: [U4]
 *@node C2 character_and_spaces_in_refs_text.texi:l42 {local   node}
 |EXTRA
 |identifier:{local-node}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument:  }
    {local   node}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
    {/;<=>?[\\]^_`|~}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{other-nodes}
    {other nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'character_and_spaces_in_refs_out'} = '@node Top
@top Test refs

@menu
* node to avoid DocBook or LaTeX ignored::
* other nodes::
@end menu

@node node to avoid DocBook or LaTeX ignored
@chapter first chapter

@subheading Testing distant nodes

@ref{ a  node ,,, manual}
@ref{:,,,manual}
@ref{ top ,,, manual}
@ref{node,,, ../manual/doc}

@subheading Testing local nodes

@ref{!_"#$%&\'()*+-.}
@ref{/;<=>?[\\]^_`|~}
@ref{ Top}
@ref{  local   node}
@ref{(texinfo)Cross References}

@anchor{(texinfo)Cross References}

@node other nodes, !_"#$%&\'()*+-., node to avoid DocBook or LaTeX ignored, Top
@chapter Chapter with nodes

@menu
* !_"#$%&\'()*+-.::
* /;<=>?[\\]^_`|~::
* local node::
@end menu

@node !_"#$%&\'()*+-., /;<=>?[\\]^_`|~, other nodes, other nodes

@node /;<=>?[\\]^_`|~,local   node,!_"#$%&\'()*+-., other nodes

@node  local   node,,/;<=>?[\\]^_`|~,other nodes

@bye
';


$result_texts{'character_and_spaces_in_refs_out'} = 'Test refs
*********

* node to avoid DocBook or LaTeX ignored::
* other nodes::

1 first chapter
***************

Testing distant nodes
---------------------

a  node
:
top
node

Testing local nodes
-------------------

!_"#$%&\'()*+-.
/;<=>?[\\]^_`|~
Top
local   node
(texinfo)Cross References


2 Chapter with nodes
********************

* !_"#$%&\'()*+-.::
* /;<=>?[\\]^_`|~::
* local node::




';

$result_errors{'character_and_spaces_in_refs_out'} = '* E character_and_spaces_in_refs_text.texi:l27|syntax for an external node used for `(texinfo)Cross References\'
 syntax for an external node used for `(texinfo)Cross References\'

';

$result_nodes_list{'character_and_spaces_in_refs_out'} = '1|Top
 associated_section: Test refs
 associated_title_command: Test refs
 menus:
  node to avoid DocBook or LaTeX ignored
  other nodes
 node_directions:
  next->node to avoid DocBook or LaTeX ignored
2|node to avoid DocBook or LaTeX ignored
 associated_section: 1 first chapter
 associated_title_command: 1 first chapter
 node_directions:
  next->other nodes
  prev->Top
  up->Top
3|other nodes
 associated_section: 2 Chapter with nodes
 associated_title_command: 2 Chapter with nodes
 menus:
  !_"#$%&\'()*+-.
  /;<=>?[\\]^_`|~
  local node
 node_directions:
  next->!_"#$%&\'()*+-.
  prev->node to avoid DocBook or LaTeX ignored
  up->Top
4|!_"#$%&\'()*+-.
 node_directions:
  next->/;<=>?[\\]^_`|~
  prev->other nodes
  up->other nodes
5|/;<=>?[\\]^_`|~
 node_directions:
  next->local   node
  prev->!_"#$%&\'()*+-.
  up->other nodes
6|local   node
 node_directions:
  prev->/;<=>?[\\]^_`|~
  up->other nodes
';

$result_sections_list{'character_and_spaces_in_refs_out'} = '1|Test refs
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->first chapter
 section_children:
  1|first chapter
  2|Chapter with nodes
2|first chapter
 associated_anchor_command: node to avoid DocBook or LaTeX ignored
 associated_node: node to avoid DocBook or LaTeX ignored
 section_directions:
  next->Chapter with nodes
  up->Test refs
 toplevel_directions:
  next->Chapter with nodes
  prev->Test refs
  up->Test refs
3|Chapter with nodes
 associated_anchor_command: other nodes
 associated_node: other nodes
 section_directions:
  prev->first chapter
  up->Test refs
 toplevel_directions:
  prev->first chapter
  up->Test refs
';

$result_sectioning_root{'character_and_spaces_in_refs_out'} = 'level: -1
list:
 1|Test refs
';

$result_headings_list{'character_and_spaces_in_refs_out'} = '1|Testing distant nodes
2|Testing local nodes
';

1;
