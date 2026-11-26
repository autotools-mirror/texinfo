use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodes_after_top_before_section_nodes'} = 'U0 unit{C2}{N:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section C1
  *preamble
 *normal_command@node C4 l1 {Top}
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
  *normal_command@menu C4 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chap-node}
     {normal_text:chap node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{third-node}
     {normal_text:third node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l6
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C1}{N:chap node}
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
 *normal_command@node C4 l8 {chap node}
 |identifier:{chap-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chap node}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{third-node}
    {spaces_before_argument: }
    {normal_text:third node}
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:second node\\n}
  {empty_line:\\n}
U2 unit{C2}{N:third node}{s:@subsection 1 subsection}
unit_directions:D[prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
NodePrev: [U1]
NodeUp: [U0]
NodeBack: [U1]
 *normal_command@node C1 l12 {third node}
 |identifier:{third-node}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:third node}
   *line_arg
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{chap-node}
    {normal_text:chap node}
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@subsection C1 l13 {subsection}
 |section_heading_number:{1}
 |section_level:{3}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subsection}
    {spaces_after_argument:\\n}
';


$result_texis{'nodes_after_top_before_section_nodes'} = '@node Top
Top node
@menu
* chap node::
* third node::
@end menu

@node chap node, third node,Top,Top

second node

@node third node,,chap node,Top
@subsection subsection
';


$result_texts{'nodes_after_top_before_section_nodes'} = 'Top node
* chap node::
* third node::


second node

1 subsection
------------
';

$result_errors{'nodes_after_top_before_section_nodes'} = '';

$result_nodes_list{'nodes_after_top_before_section_nodes'} = '1|Top
 menus:
  chap node
  third node
 node_directions:
  next->chap node
2|chap node
 node_directions:
  next->third node
  prev->Top
  up->Top
3|third node
 associated_section: 1 subsection
 associated_title_command: 1 subsection
 node_directions:
  prev->chap node
  up->Top
';

$result_sections_list{'nodes_after_top_before_section_nodes'} = '1|subsection
 associated_anchor_command: third node
 associated_node: third node
';

$result_sectioning_root{'nodes_after_top_before_section_nodes'} = 'level: 2
list:
 1|subsection
';

$result_headings_list{'nodes_after_top_before_section_nodes'} = '';


$result_converted{'info'}->{'nodes_after_top_before_section_nodes'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap node,  Up: (dir)

Top node
* Menu:

* chap node::
* third node::


File: ,  Node: chap node,  Next: third node,  Prev: Top,  Up: Top

second node


File: ,  Node: third node,  Prev: chap node,  Up: Top

1 subsection
------------


Tag Table:
Node: Top27
Node: chap node127
Node: third node209

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'nodes_after_top_before_section_nodes'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap-node" accesskey="n" rel="next">chap node</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<p>Top node
</p>
<hr>
<a class="node-id" id="chap-node"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#third-node" accesskey="n" rel="next">subsection</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap node<a class="copiable-link" href="#chap-node"> &para;</a></span></h4>

<p>second node
</p>
<hr>
<div class="subsection-level-extent" id="third-node">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chap-node" accesskey="p" rel="prev">chap node</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="subsection" id="subsection"><span>1 subsection<a class="copiable-link" href="#subsection"> &para;</a></span></h4>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'nodes_after_top_before_section_nodes'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
