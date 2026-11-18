use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodes_after_top_before_chapter_nodes'} = 'U0 unit{C2}{N:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
NodeNext: [U1]
NodeForward: [U1]
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
    {Top}
    {spaces_after_argument:\\n}
  *paragraph C1
   {Top node\\n}
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
     {second node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{third-node}
     {third node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C1}{N:second node}
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
 *@node C4 l8 {second node}
 |EXTRA
 |identifier:{second-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {second node}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{third-node}
    {spaces_before_argument: }
    {third node}
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {Top}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {second node\\n}
  {empty_line:\\n}
U2 unit{C2}{N:third node}{s:@chapter 1 chapter}
unit_directions:D[prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
NodePrev: [U1]
NodeUp: [U0]
NodeBack: [U1]
 *@node C1 l12 {third node}
 |EXTRA
 |identifier:{third-node}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {third node}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{second-node}
    {second node}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {Top}
    {spaces_after_argument:\\n}
 *@chapter C1 l13 {chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter}
    {spaces_after_argument:\\n}
';


$result_texis{'nodes_after_top_before_chapter_nodes'} = '@node Top
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


$result_texts{'nodes_after_top_before_chapter_nodes'} = 'Top node
* second node::
* third node::


second node

1 chapter
*********
';

$result_errors{'nodes_after_top_before_chapter_nodes'} = '';

$result_nodes_list{'nodes_after_top_before_chapter_nodes'} = '1|Top
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

$result_sections_list{'nodes_after_top_before_chapter_nodes'} = '1|chapter
 associated_anchor_command: third node
 associated_node: third node
';

$result_sectioning_root{'nodes_after_top_before_chapter_nodes'} = 'level: 0
list:
 1|chapter
';

$result_headings_list{'nodes_after_top_before_chapter_nodes'} = '';


$result_converted{'info'}->{'nodes_after_top_before_chapter_nodes'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: second node,  Up: (dir)

Top node
* Menu:

* second node::
* third node::


File: ,  Node: second node,  Next: third node,  Prev: Top,  Up: Top

second node


File: ,  Node: third node,  Prev: second node,  Up: Top

1 chapter
*********


Tag Table:
Node: Top27
Node: second node131
Node: third node215

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'nodes_after_top_before_chapter_nodes'} = '<!DOCTYPE html>
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#second-node" accesskey="n" rel="next">second node</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<p>Top node
</p>
<hr>
<a class="node-id" id="second-node"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#third-node" accesskey="n" rel="next">chapter</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>second node<a class="copiable-link" href="#second-node"> &para;</a></span></h4>

<p>second node
</p>
<hr>
<div class="chapter-level-extent" id="third-node">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#second-node" accesskey="p" rel="prev">second node</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chapter"><span>1 chapter<a class="copiable-link" href="#chapter"> &para;</a></span></h2>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'nodes_after_top_before_chapter_nodes'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'nodes_after_top_before_chapter_nodes'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> second node</nodenext></node>
<para>Top node
</para><menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>second node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>third node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="second-node"><nodename> second node</nodename><nodenext> third node</nodenext><nodeprev>Top</nodeprev><nodeup>Top</nodeup></node>

<para>second node
</para>
<node identifier="third-node"><nodename> third node</nodename><nodenext></nodenext><nodeprev>second node</nodeprev><nodeup>Top</nodeup></node>
<chapter><sectiontitle> chapter</sectiontitle>
</chapter>
';

1;
