use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'complex'} = 'U0 unit{C3}{S:@top}{n:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
NodeNext: [U1]
NodePrev: (dir)
NodeForward: [U1]
 *before_node_section C1
  *preamble_before_content
 *@node C1 complex_sectioning_case.texi:l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C3
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{First-node}
    {normal_text:First node}
   *line_arg C4
   |EXTRA
   |manual_content:A{1|1}
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {spaces_after_argument:\\n}
 *@top C3 complex_sectioning_case.texi:l2
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  *@menu C8 complex_sectioning_case.texi:l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 complex_sectioning_case.texi:l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{First-node}
     {normal_text:First node}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 complex_sectioning_case.texi:l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{between-node}
     {normal_text:between node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 complex_sectioning_case.texi:l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Second-node}
     {normal_text:Second node}
    {menu_entry_separator:::   }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:node 2\\n}
   *menu_entry C4 complex_sectioning_case.texi:l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Third-node-unnumbered}
     {normal_text:Third node unnumbered}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:unnumbered in Top menu\\n}
   *menu_entry C4 complex_sectioning_case.texi:l8
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{continuity}
     {normal_text:continuity}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 complex_sectioning_case.texi:l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Last-node-no-description}
     {normal_text:Last node no description}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 complex_sectioning_case.texi:l10
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C2}{S:@chapter 1 first node chapter}{n:First node}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U10]
FastBack: [U0]
Next: [U10]
Up: [U0]
NodePrev: [U0]
NodeUp: [U0]
NodeForward: [U2]
NodeBack: [U0]
 *@node C1 complex_sectioning_case.texi:l12 {First node}
 |EXTRA
 |identifier:{First-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:First node}
   *line_arg
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
 *@chapter C5 complex_sectioning_case.texi:l13 {first node chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first node chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:first node chapter text\\n}
  *@menu C6 complex_sectioning_case.texi:l16
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 complex_sectioning_case.texi:l17
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{unnumbered}
     {normal_text:unnumbered}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:un\\n}
   *menu_entry C4 complex_sectioning_case.texi:l18
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{unnumbered2}
     {normal_text:unnumbered2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:un2\\n}
   *menu_entry C4 complex_sectioning_case.texi:l19
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{numbered}
     {normal_text:numbered}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:nu\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@end C1 complex_sectioning_case.texi:l21
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U2 unit{C2}{S:@unnumberedsec unnumbered section}{n:unnumbered}
unit_directions:D[next->[U3]|prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Forward: [U3]
Back: [U1]
FastForward: [U10]
FastBack: [U1]
Next: [U7]
Up: [U1]
NodeNext: [U7]
NodeUp: [U1]
NodeForward: [U3]
NodeBack: [U1]
 *@node C1 complex_sectioning_case.texi:l23 {unnumbered}
 |EXTRA
 |identifier:{unnumbered}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered}
    {spaces_after_argument:\\n}
 *@unnumberedsec C4 complex_sectioning_case.texi:l24 {unnumbered section}
 |EXTRA
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C6 complex_sectioning_case.texi:l26
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 complex_sectioning_case.texi:l27
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{unnumbered-sub}
     {normal_text:unnumbered sub}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:un\\n}
   *menu_entry C4 complex_sectioning_case.texi:l28
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{numbered-sub}
     {normal_text:numbered sub}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:nu\\n}
   *menu_entry C4 complex_sectioning_case.texi:l29
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{unnumbered-sub2}
     {normal_text:unnumbered sub2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:un2\\n}
   *menu_entry C4 complex_sectioning_case.texi:l30
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{numbered-sub2}
     {normal_text:numbered sub2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:nu2\\n}
   *@end C1 complex_sectioning_case.texi:l31
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U3 unit{C2}{S:@unnumberedsubsec unnumbered subsection}{n:unnumbered sub}
unit_directions:D[next->[U4]|prev->[U2]]
UNIT_DIRECTIONS
This: [U3]
Forward: [U4]
Back: [U2]
FastForward: [U10]
FastBack: [U1]
Next: [U4]
Up: [U2]
NodeNext: [U4]
NodeUp: [U2]
NodeForward: [U4]
NodeBack: [U2]
 *@node C1 complex_sectioning_case.texi:l33 {unnumbered sub}
 |EXTRA
 |identifier:{unnumbered-sub}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered sub}
    {spaces_after_argument:\\n}
 *@unnumberedsubsec C2 complex_sectioning_case.texi:l34 {unnumbered subsection}
 |EXTRA
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U4 unit{C2}{S:@subsection numbered subsection}{n:numbered sub}
unit_directions:D[next->[U5]|prev->[U3]]
UNIT_DIRECTIONS
This: [U4]
Forward: [U5]
Back: [U3]
FastForward: [U10]
FastBack: [U1]
Next: [U5]
Prev: [U3]
Up: [U2]
NodeNext: [U5]
NodePrev: [U3]
NodeUp: [U2]
NodeForward: [U5]
NodeBack: [U3]
 *@node C1 complex_sectioning_case.texi:l36 {numbered sub}
 |EXTRA
 |identifier:{numbered-sub}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered sub}
    {spaces_after_argument:\\n}
 *@subsection C2 complex_sectioning_case.texi:l37 {numbered subsection}
 |EXTRA
 |section_level:{3}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U5 unit{C2}{S:@unnumberedsubsec unnumbered subsection2}{n:unnumbered sub2}
unit_directions:D[next->[U6]|prev->[U4]]
UNIT_DIRECTIONS
This: [U5]
Forward: [U6]
Back: [U4]
FastForward: [U10]
FastBack: [U1]
Next: [U6]
Prev: [U4]
Up: [U2]
NodeNext: [U6]
NodePrev: [U4]
NodeUp: [U2]
NodeForward: [U6]
NodeBack: [U4]
 *@node C1 complex_sectioning_case.texi:l39 {unnumbered sub2}
 |EXTRA
 |identifier:{unnumbered-sub2}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered sub2}
    {spaces_after_argument:\\n}
 *@unnumberedsubsec C2 complex_sectioning_case.texi:l40 {unnumbered subsection2}
 |EXTRA
 |section_level:{3}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered subsection2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U6 unit{C2}{S:@subsection numbered subsection2}{n:numbered sub2}
unit_directions:D[next->[U7]|prev->[U5]]
UNIT_DIRECTIONS
This: [U6]
Forward: [U7]
Back: [U5]
FastForward: [U10]
FastBack: [U1]
Prev: [U5]
Up: [U2]
NodePrev: [U5]
NodeUp: [U2]
NodeForward: [U7]
NodeBack: [U5]
 *@node C1 complex_sectioning_case.texi:l42 {numbered sub2}
 |EXTRA
 |identifier:{numbered-sub2}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered sub2}
    {spaces_after_argument:\\n}
 *@subsection C2 complex_sectioning_case.texi:l43 {numbered subsection2}
 |EXTRA
 |section_level:{3}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered subsection2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U7 unit{C2}{S:@unnumberedsec unnumbered section2}{n:unnumbered2}
unit_directions:D[next->[U8]|prev->[U6]]
UNIT_DIRECTIONS
This: [U7]
Forward: [U8]
Back: [U6]
FastForward: [U10]
FastBack: [U1]
Next: [U9]
Prev: [U2]
Up: [U1]
NodeNext: [U9]
NodePrev: [U2]
NodeUp: [U1]
NodeForward: [U8]
NodeBack: [U6]
 *@node C1 complex_sectioning_case.texi:l45 {unnumbered2}
 |EXTRA
 |identifier:{unnumbered2}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered2}
    {spaces_after_argument:\\n}
 *@unnumberedsec C4 complex_sectioning_case.texi:l46 {unnumbered section2}
 |EXTRA
 |section_level:{2}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered section2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 complex_sectioning_case.texi:l48
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 complex_sectioning_case.texi:l49
    {menu_entry_leading_text:*  }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{numbered-sub3}
     {normal_text:numbered sub3}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 complex_sectioning_case.texi:l50
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U8 unit{C2}{S:@subsection numbered subsection3}{n:numbered sub3}
unit_directions:D[next->[U9]|prev->[U7]]
UNIT_DIRECTIONS
This: [U8]
Forward: [U9]
Back: [U7]
FastForward: [U10]
FastBack: [U1]
Up: [U7]
NodeUp: [U7]
NodeForward: [U9]
NodeBack: [U7]
 *@node C1 complex_sectioning_case.texi:l52 {numbered sub3}
 |EXTRA
 |identifier:{numbered-sub3}
 |is_target:{1}
 |node_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered sub3}
    {spaces_after_argument:\\n}
 *@subsection C3 complex_sectioning_case.texi:l53 {numbered subsection3}
 |EXTRA
 |section_level:{3}
 |section_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered subsection3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
U9 unit{C3}{S:@section 1.1 numbered section}{n:numbered}
unit_directions:D[next->[U10]|prev->[U8]]
UNIT_DIRECTIONS
This: [U9]
Forward: [U10]
Back: [U8]
FastForward: [U10]
FastBack: [U1]
Prev: [U7]
Up: [U1]
NodePrev: [U7]
NodeUp: [U1]
NodeBack: [U8]
 *@node C1 complex_sectioning_case.texi:l56 {numbered}
 |EXTRA
 |identifier:{numbered}
 |is_target:{1}
 |node_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered}
    {spaces_after_argument:\\n}
 *@section C2 complex_sectioning_case.texi:l57 {numbered section}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument:  }
    {normal_text:numbered section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C4 complex_sectioning_case.texi:l59 {between node}
 |EXTRA
 |identifier:{between-node}
 |is_target:{1}
 |node_number:{11}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:between node}
   *line_arg
   *line_arg
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:between node, node without sectioning node\\n}
  {empty_line:\\n}
U10 unit{C2}{S:@chapter 2 second node chapter}{n:Second node}
unit_directions:D[next->[U11]|prev->[U9]]
UNIT_DIRECTIONS
This: [U10]
Forward: [U11]
Back: [U9]
FastForward: [U11]
FastBack: [U1]
Next: [U11]
Prev: [U1]
Up: [U0]
NodeNext: [U11]
NodeUp: [U0]
NodeForward: [U11]
 *@node C4 complex_sectioning_case.texi:l63 {Second node}
 |EXTRA
 |identifier:{Second-node}
 |is_target:{1}
 |node_number:{12}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Second node}
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Third-node-unnumbered}
    {normal_text:Third node unnumbered}
   *line_arg
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Second node text\\n}
  {empty_line:\\n}
 *@chapter C4 complex_sectioning_case.texi:l67 {second node chapter}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{11}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:second node chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:second node chapter text.\\n}
  {empty_line:\\n}
U11 unit{C2}{S:@unnumbered unnumbered chapter}{n:Third node unnumbered}
unit_directions:D[next->[U12]|prev->[U10]]
UNIT_DIRECTIONS
This: [U11]
Forward: [U12]
Back: [U10]
FastForward: [U12]
FastBack: [U10]
Next: [U12]
Prev: [U10]
Up: [U0]
NodeNext: [U12]
NodePrev: [U10]
NodeUp: [U0]
NodeForward: [U12]
NodeBack: [U10]
 *@node C1 complex_sectioning_case.texi:l71 {Third node unnumbered}
 |EXTRA
 |identifier:{Third-node-unnumbered}
 |is_target:{1}
 |node_number:{13}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Third node unnumbered}
    {spaces_after_argument:\\n}
 *@unnumbered C4 complex_sectioning_case.texi:l72 {unnumbered chapter}
 |EXTRA
 |section_level:{1}
 |section_number:{12}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:unnumbered chapter text.\\n}
  {empty_line:\\n}
U12 unit{C4}{S:@unnumbered unnumbered continuity}{n:continuity}
unit_directions:D[prev->[U11]]
UNIT_DIRECTIONS
This: [U12]
Back: [U11]
FastBack: [U11]
Prev: [U11]
Up: [U0]
NodeNext: [U11]
NodePrev: [U12]
NodeUp: [U0]
NodeForward: [U11]
NodeBack: [U11]
 *@node C1 complex_sectioning_case.texi:l76 {continuity}
 |EXTRA
 |identifier:{continuity}
 |is_target:{1}
 |node_number:{14}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:continuity}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Third-node-unnumbered}
    {spaces_before_argument:  }
    {normal_text:Third node unnumbered}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Last-node-no-description}
    {spaces_before_argument: }
    {normal_text:Last node no description}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@unnumbered C4 complex_sectioning_case.texi:l77 {unnumbered continuity}
 |EXTRA
 |section_level:{1}
 |section_number:{13}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered continuity}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:Unumbered and node needed for continuity between automatic \\n}
   {normal_text:directions and lone node.\\n}
  {empty_line:\\n}
 *@node C3 complex_sectioning_case.texi:l82 {Last node no description}
 |EXTRA
 |identifier:{Last-node-no-description}
 |is_target:{1}
 |node_number:{15}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Last node no description}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{continuity}
    {normal_text:continuity}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@contents C1 complex_sectioning_case.texi:l84
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'complex'} = '@node Top,First node,(dir)
@top
@menu
* First node:: 
* between node::
* Second node::   node 2
* Third node unnumbered:: unnumbered in Top menu
* continuity::
* Last node no description::
@end menu

@node First node,,Top,Top
@chapter first node chapter

first node chapter text
@menu
* unnumbered:: un
* unnumbered2:: un2
* numbered:: nu

@end menu

@node unnumbered
@unnumberedsec unnumbered section

@menu
* unnumbered sub:: un
* numbered sub:: nu
* unnumbered sub2:: un2
* numbered sub2:: nu2
@end menu

@node unnumbered sub
@unnumberedsubsec unnumbered subsection

@node numbered sub
@subsection numbered subsection

@node unnumbered sub2
@unnumberedsubsec unnumbered subsection2

@node numbered sub2
@subsection numbered subsection2

@node unnumbered2
@unnumberedsec unnumbered section2

@menu
*  numbered sub3::
@end menu

@node numbered sub3
@subsection numbered subsection3


@node numbered
@section  numbered section

@node between node,,,Top

between node, node without sectioning node

@node Second node,Third node unnumbered,,Top

Second node text

@chapter second node chapter

second node chapter text.

@node Third node unnumbered
@unnumbered unnumbered chapter

unnumbered chapter text.

@node continuity,  Third node unnumbered, Last node no description, Top
@unnumbered unnumbered continuity

Unumbered and node needed for continuity between automatic 
directions and lone node.

@node Last node no description,,continuity,Top

@contents
@bye
';


$result_texts{'complex'} = '* First node:: 
* between node::
* Second node::   node 2
* Third node unnumbered:: unnumbered in Top menu
* continuity::
* Last node no description::

1 first node chapter
********************

first node chapter text
* unnumbered:: un
* unnumbered2:: un2
* numbered:: nu


unnumbered section
==================

* unnumbered sub:: un
* numbered sub:: nu
* unnumbered sub2:: un2
* numbered sub2:: nu2

unnumbered subsection
---------------------

numbered subsection
-------------------

unnumbered subsection2
----------------------

numbered subsection2
--------------------

unnumbered section2
===================

*  numbered sub3::

numbered subsection3
--------------------


1.1 numbered section
====================


between node, node without sectioning node


Second node text

2 second node chapter
*********************

second node chapter text.

unnumbered chapter
******************

unnumbered chapter text.

unnumbered continuity
*********************

Unumbered and node needed for continuity between automatic 
directions and lone node.


';

$result_errors{'complex'} = '* W complex_sectioning_case.texi:l5|node `between node\' in menu where `Second node\' expected
 warning: node `between node\' in menu where `Second node\' expected

* W complex_sectioning_case.texi:l9|unexpected node `Last node no description\' in menu
 warning: unexpected node `Last node no description\' in menu

* W complex_sectioning_case.texi:l8|node prev pointer for `continuity\' is `Last node no description\' but prev is `Third node unnumbered\' in menu
 warning: node prev pointer for `continuity\' is `Last node no description\' but prev is `Third node unnumbered\' in menu

* W complex_sectioning_case.texi:l9|node next pointer for `continuity\' is `Third node unnumbered\' but next is `Last node no description\' in menu
 warning: node next pointer for `continuity\' is `Third node unnumbered\' but next is `Last node no description\' in menu

';

$result_nodes_list{'complex'} = '1|Top
 associated_section
 associated_title_command
 menus:
  First node
  between node
  Second node
  Third node unnumbered
  continuity
  Last node no description
 node_directions:
  next->First node
  prev->(dir)

2|First node
 associated_section: 1 first node chapter
 associated_title_command: 1 first node chapter
 menus:
  unnumbered
  unnumbered2
  numbered
 node_directions:
  prev->Top
  up->Top
3|unnumbered
 associated_section: unnumbered section
 associated_title_command: unnumbered section
 menus:
  unnumbered sub
  numbered sub
  unnumbered sub2
  numbered sub2
 node_directions:
  next->unnumbered2
  up->First node
4|unnumbered sub
 associated_section: unnumbered subsection
 associated_title_command: unnumbered subsection
 node_directions:
  next->numbered sub
  up->unnumbered
5|numbered sub
 associated_section: numbered subsection
 associated_title_command: numbered subsection
 node_directions:
  next->unnumbered sub2
  prev->unnumbered sub
  up->unnumbered
6|unnumbered sub2
 associated_section: unnumbered subsection2
 associated_title_command: unnumbered subsection2
 node_directions:
  next->numbered sub2
  prev->numbered sub
  up->unnumbered
7|numbered sub2
 associated_section: numbered subsection2
 associated_title_command: numbered subsection2
 node_directions:
  prev->unnumbered sub2
  up->unnumbered
8|unnumbered2
 associated_section: unnumbered section2
 associated_title_command: unnumbered section2
 menus:
  numbered sub3
 node_directions:
  next->numbered
  prev->unnumbered
  up->First node
9|numbered sub3
 associated_section: numbered subsection3
 associated_title_command: numbered subsection3
 node_directions:
  up->unnumbered2
10|numbered
 associated_section: 1.1 numbered section
 associated_title_command: 1.1 numbered section
 node_directions:
  prev->unnumbered2
  up->First node
11|between node
 node_directions:
  up->Top
12|Second node
 associated_section: 2 second node chapter
 associated_title_command: 2 second node chapter
 node_directions:
  next->Third node unnumbered
  up->Top
13|Third node unnumbered
 associated_section: unnumbered chapter
 associated_title_command: unnumbered chapter
 node_directions:
  next->continuity
  prev->Second node
  up->Top
14|continuity
 associated_section: unnumbered continuity
 associated_title_command: unnumbered continuity
 node_directions:
  next->Third node unnumbered
  prev->Last node no description
  up->Top
15|Last node no description
 node_directions:
  prev->continuity
  up->Top
';

$result_sections_list{'complex'} = '1
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->first node chapter
 section_children:
  1|first node chapter
  2|second node chapter
  3|unnumbered chapter
  4|unnumbered continuity
2|first node chapter
 associated_anchor_command: First node
 associated_node: First node
 section_directions:
  next->second node chapter
  up->
 toplevel_directions:
  next->second node chapter
  prev->
  up->
 section_children:
  1|unnumbered section
  2|unnumbered section2
  3|numbered section
3|unnumbered section
 associated_anchor_command: unnumbered
 associated_node: unnumbered
 section_directions:
  next->unnumbered section2
  up->first node chapter
 section_children:
  1|unnumbered subsection
  2|numbered subsection
  3|unnumbered subsection2
  4|numbered subsection2
4|unnumbered subsection
 associated_anchor_command: unnumbered sub
 associated_node: unnumbered sub
 section_directions:
  next->numbered subsection
  up->unnumbered section
5|numbered subsection
 associated_anchor_command: numbered sub
 associated_node: numbered sub
 section_directions:
  next->unnumbered subsection2
  prev->unnumbered subsection
  up->unnumbered section
6|unnumbered subsection2
 associated_anchor_command: unnumbered sub2
 associated_node: unnumbered sub2
 section_directions:
  next->numbered subsection2
  prev->numbered subsection
  up->unnumbered section
7|numbered subsection2
 associated_anchor_command: numbered sub2
 associated_node: numbered sub2
 section_directions:
  prev->unnumbered subsection2
  up->unnumbered section
8|unnumbered section2
 associated_anchor_command: unnumbered2
 associated_node: unnumbered2
 section_directions:
  next->numbered section
  prev->unnumbered section
  up->first node chapter
 section_children:
  1|numbered subsection3
9|numbered subsection3
 associated_anchor_command: numbered sub3
 associated_node: numbered sub3
 section_directions:
  up->unnumbered section2
10|numbered section
 associated_anchor_command: numbered
 associated_node: numbered
 section_directions:
  prev->unnumbered section2
  up->first node chapter
11|second node chapter
 associated_anchor_command: Second node
 associated_node: Second node
 section_directions:
  next->unnumbered chapter
  prev->first node chapter
  up->
 toplevel_directions:
  next->unnumbered chapter
  prev->first node chapter
  up->
12|unnumbered chapter
 associated_anchor_command: Third node unnumbered
 associated_node: Third node unnumbered
 section_directions:
  next->unnumbered continuity
  prev->second node chapter
  up->
 toplevel_directions:
  next->unnumbered continuity
  prev->second node chapter
  up->
13|unnumbered continuity
 associated_anchor_command: continuity
 associated_node: continuity
 section_directions:
  prev->unnumbered chapter
  up->
 toplevel_directions:
  prev->unnumbered chapter
  up->
';

$result_sectioning_root{'complex'} = 'level: -1
list:
 1|
';

$result_headings_list{'complex'} = '';

1;
