use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'two_nodes_between_chapters'} = 'U0 unit{C3}{S:@top top}{n:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C5 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter-1}
     {normal_text:chapter 1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node-between-chapters}
     {normal_text:node between chapters}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter-2}
     {normal_text:chapter 2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l8
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C3}{S:@chapter 1 chapter c1}{n:chapter 1}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U2]
FastBack: [U0]
Next: [U2]
Up: [U0]
NodeNext: [U1]
NodePrev: [U0]
NodeUp: [U0]
NodeForward: [U1]
NodeBack: [U0]
 *normal_command@node C1 l10 {chapter 1}
 |identifier:{chapter-1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chapter 1}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{node-between-chapters}
    {spaces_before_argument: }
    {normal_text:node between chapters}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l11 {chapter c1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter c1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C2 l13 {node between chapters}
 |identifier:{node-between-chapters}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node between chapters}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U2 unit{C2}{S:@chapter 2 chapter c2}{n:chapter 2}
unit_directions:D[prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
FastBack: [U1]
Prev: [U1]
Up: [U0]
NodePrev: [U1]
NodeUp: [U0]
 *normal_command@node C1 l15 {chapter 2}
 |identifier:{chapter-2}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter 2}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l16 {chapter c2}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter c2}
    {spaces_after_argument:\\n}
';


$result_texis{'two_nodes_between_chapters'} = '@node Top
@top top

@menu
* chapter 1::
* node between chapters::
* chapter 2::
@end menu

@node chapter 1, node between chapters, Top, Top
@chapter chapter c1

@node node between chapters

@node chapter 2
@chapter chapter c2
';


$result_texts{'two_nodes_between_chapters'} = 'top
***

* chapter 1::
* node between chapters::
* chapter 2::

1 chapter c1
************


2 chapter c2
************
';

$result_errors{'two_nodes_between_chapters'} = '';

$result_nodes_list{'two_nodes_between_chapters'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter 1
  node between chapters
  chapter 2
 node_directions:
  next->chapter 1
2|chapter 1
 associated_section: 1 chapter c1
 associated_title_command: 1 chapter c1
 node_directions:
  next->node between chapters
  prev->Top
  up->Top
3|node between chapters
 node_directions:
  next->chapter 2
  prev->chapter 1
  up->Top
4|chapter 2
 associated_section: 2 chapter c2
 associated_title_command: 2 chapter c2
 node_directions:
  prev->chapter 1
  up->Top
';

$result_sections_list{'two_nodes_between_chapters'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter c1
 section_children:
  1|chapter c1
  2|chapter c2
2|chapter c1
 associated_anchor_command: chapter 1
 associated_node: chapter 1
 section_directions:
  next->chapter c2
  up->top
 toplevel_directions:
  next->chapter c2
  prev->top
  up->top
3|chapter c2
 associated_anchor_command: chapter 2
 associated_node: chapter 2
 section_directions:
  prev->chapter c1
  up->top
 toplevel_directions:
  prev->chapter c1
  up->top
';

$result_sectioning_root{'two_nodes_between_chapters'} = 'level: -1
list:
 1|top
';

$result_headings_list{'two_nodes_between_chapters'} = '';


$result_converted{'plaintext'}->{'two_nodes_between_chapters'} = 'top
***

1 chapter c1
************

2 chapter c2
************

';


$result_converted{'html'}->{'two_nodes_between_chapters'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
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
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter-1" accesskey="n" rel="next">chapter c1</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<ul class="mini-toc">
<li><a href="#chapter-1" accesskey="1">chapter c1</a></li>
<li><a href="#chapter-2" accesskey="2">chapter c2</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter-1">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#node-between-chapters" accesskey="n" rel="next">node between chapters</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chapter-c1"><span>1 chapter c1<a class="copiable-link" href="#chapter-c1"> &para;</a></span></h2>

<hr>
<a class="node-id" id="node-between-chapters"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter-2" accesskey="n" rel="next">chapter c2</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chapter-1" accesskey="p" rel="prev">chapter c1</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>node between chapters<a class="copiable-link" href="#node-between-chapters"> &para;</a></span></h4>

<hr>
</div>
<div class="chapter-level-extent" id="chapter-2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chapter-1" accesskey="p" rel="prev">chapter c1</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chapter-c2"><span>2 chapter c2<a class="copiable-link" href="#chapter-c2"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'two_nodes_between_chapters'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter 1</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter 1</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>node between chapters</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter 2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="chapter-1"><nodename> chapter 1</nodename><nodenext> node between chapters</nodenext><nodeprev> Top</nodeprev><nodeup> Top</nodeup></node>
<chapter><sectiontitle> chapter c1</sectiontitle>

</chapter>
<node identifier="node-between-chapters"><nodename> node between chapters</nodename><nodenext automatic="on"> chapter 2</nodenext><nodeprev automatic="on"> chapter 1</nodeprev><nodeup automatic="on"> Top</nodeup></node>

<node identifier="chapter-2"><nodename> chapter 2</nodename><nodeprev automatic="on"> chapter 1</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chapter c2</sectiontitle>
</chapter>
';

1;
