use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'node_part_chapter_after_chapter'} = 'U0 unit{C3}{S:@top top}{n:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
Next: [U2]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C4 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter-node}
     {normal_text:chapter node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{part-chapter-node}
     {normal_text:part chapter node}
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
U1 unit{C2}{S:@chapter 1 chapter node}{n:chapter node}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U2]
FastBack: [U0]
Up: [U0]
NodeNext: [U2]
NodePrev: [U0]
NodeUp: [U0]
NodeForward: [U2]
NodeBack: [U0]
 *@node C2 l9 {chapter node}
 |EXTRA
 |identifier:{chapter-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@chapter C2 l11 {chapter node}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U2 unit{C3}{S:@chapter 2 chapter with part node}{n:part chapter node}
unit_directions:D[prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
FastBack: [U1]
NodePrev: [U1]
NodeUp: [U0]
NodeBack: [U1]
 *@node C1 l13 {part chapter node}
 |EXTRA
 |identifier:{part-chapter-node}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part chapter node}
    {spaces_after_argument:\\n}
 *@part C2 l14 {part}
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@chapter C3 l16 {chapter with part node}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter with part node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@contents C1 l18
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'node_part_chapter_after_chapter'} = '@node Top
@top top

@menu
* chapter node::
* part chapter node::
@end menu

@node chapter node

@chapter chapter node

@node part chapter node
@part part

@chapter chapter with part node

@contents
';


$result_texts{'node_part_chapter_after_chapter'} = 'top
***

* chapter node::
* part chapter node::


1 chapter node
**************

part
****

2 chapter with part node
************************

';

$result_errors{'node_part_chapter_after_chapter'} = '* W l14|@node precedes @part, but parts may not be associated with nodes
 warning: @node precedes @part, but parts may not be associated with nodes

* W l6|unexpected node `part chapter node\' in menu
 warning: unexpected node `part chapter node\' in menu

';

$result_nodes_list{'node_part_chapter_after_chapter'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter node
  part chapter node
 node_directions:
  next->chapter node
2|chapter node
 associated_section: 1 chapter node
 associated_title_command: 1 chapter node
 node_directions:
  next->part chapter node
  prev->Top
  up->Top
3|part chapter node
 associated_section: 2 chapter with part node
 associated_title_command: 2 chapter with part node
 node_directions:
  prev->chapter node
  up->Top
';

$result_sections_list{'node_part_chapter_after_chapter'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->part
 toplevel_directions:
  next->chapter node
 section_children:
  1|chapter node
2|chapter node
 associated_anchor_command: chapter node
 associated_node: chapter node
 section_directions:
  up->top
 toplevel_directions:
  next->chapter with part node
  prev->top
  up->top
3|part
 part_associated_section: 2 chapter with part node
 section_directions:
  prev->top
 section_children:
  1|chapter with part node
4|chapter with part node
 associated_anchor_command: part chapter node
 associated_node: part chapter node
 associated_part: part
 section_directions:
  up->part
 toplevel_directions:
  prev->chapter node
  up->top
';

$result_sectioning_root{'node_part_chapter_after_chapter'} = 'level: -1
list:
 1|top
 2|part
';

$result_headings_list{'node_part_chapter_after_chapter'} = '';


$result_converted{'plaintext'}->{'node_part_chapter_after_chapter'} = 'top
***

1 chapter node
**************

2 chapter with part node
************************

top
1 chapter node
part
2 chapter with part node
';


$result_converted{'info'}->{'node_part_chapter_after_chapter'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chapter node,  Up: (dir)

top
***

* Menu:

* chapter node::
* part chapter node::


File: ,  Node: chapter node,  Next: part chapter node,  Prev: Top,  Up: Top

1 chapter node
**************


File: ,  Node: part chapter node,  Prev: chapter node,  Up: Top

2 chapter with part node
************************


Tag Table:
Node: Top27
Node: chapter node140
Node: part chapter node250

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'node_part_chapter_after_chapter'} = '<!DOCTYPE html>
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
<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter-node" accesskey="n" rel="next">chapter node</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">
<ul class="toc-numbered-mark">
<li>
<ul class="toc-numbered-mark">
  <li><a id="toc-chapter-node" href="#chapter-node">1 chapter node</a></li>
</ul></li>
<li><a id="toc-part" href="#part">part</a>
<ul class="toc-numbered-mark">
  <li><a id="toc-chapter-with-part-node" href="#part-chapter-node">2 chapter with part node</a></li>
</ul></li>

</ul>
</div>
</div>
<hr>
<div class="chapter-level-extent" id="chapter-node">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#part-chapter-node" accesskey="n" rel="next">chapter with part node</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>

<h2 class="chapter" id="chapter-node-1"><span>1 chapter node<a class="copiable-link" href="#chapter-node-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="part-chapter-node">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chapter-node" accesskey="p" rel="prev">chapter node</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>
</div>
</div>
<div class="part-level-extent" id="part">
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#part-chapter-node" accesskey="1">chapter with part node</a></li>
</ul>
<h2 class="chapter" id="chapter-with-part-node"><span>2 chapter with part node<a class="copiable-link" href="#chapter-with-part-node"> &para;</a></span></h2>

</div>



</body>
</html>
';


$result_converted{'xml'}->{'node_part_chapter_after_chapter'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter node</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>part chapter node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="chapter-node"><nodename> chapter node</nodename><nodenext automatic="on"> part chapter node</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>

<chapter><sectiontitle> chapter node</sectiontitle>

</chapter>
<node identifier="part-chapter-node"><nodename> part chapter node</nodename><nodeprev automatic="on"> chapter node</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<part><sectiontitle> part</sectiontitle>

<chapter><sectiontitle> chapter with part node</sectiontitle>

<contents></contents>
</chapter>
</part>
';


$result_converted{'docbook'}->{'node_part_chapter_after_chapter'} = '<chapter label="1" id="chapter-node">
<title>chapter node</title>


</chapter>
<part label="">
<title>part</title>
<chapter label="2" id="part-chapter-node">
<title>chapter with part node</title>


</chapter>
</part>
';

1;
