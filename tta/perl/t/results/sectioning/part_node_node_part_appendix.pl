use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'part_node_node_part_appendix'} = 'U0 unit{C3}{S:@top top}{n:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
Next: [U1]
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
 *normal_command@top C4 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 l4
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
    |normalized:{appendix-part}
     {normal_text:appendix part}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l7
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C3}{S:@chapter 1 chapter}{n:chapter node}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U2]
FastBack: [U0]
NodeNext: [U2]
NodePrev: [U0]
NodeUp: [U0]
NodeForward: [U2]
NodeBack: [U0]
 *normal_command@part C2 l9 {Part 1}
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Part 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l11 {chapter node}
 |EXTRA
 |identifier:{chapter-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter node}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l12 {chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U2 unit{C3}{S:@appendix A Appendix}{n:appendix part}
unit_directions:D[prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
FastBack: [U1]
NodePrev: [U1]
NodeUp: [U0]
NodeBack: [U1]
 *normal_command@node C1 l14 {appendix part}
 |EXTRA
 |identifier:{appendix-part}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:appendix part}
    {spaces_after_argument:\\n}
 *normal_command@part C2 l15 {Part Appendix}
 |EXTRA
 |global_command_number:{2}
 |section_level:{0}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Part Appendix}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@appendix C1 l17 {Appendix}
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Appendix}
    {spaces_after_argument:\\n}
';


$result_texis{'part_node_node_part_appendix'} = '@node Top
@top top

@menu
* chapter node::
* appendix part::
@end menu

@part Part 1

@node chapter node
@chapter chapter

@node appendix part
@part Part Appendix

@appendix Appendix
';


$result_texts{'part_node_node_part_appendix'} = 'top
***

* chapter node::
* appendix part::

Part 1
******

1 chapter
*********

Part Appendix
*************

Appendix A Appendix
*******************
';

$result_errors{'part_node_node_part_appendix'} = '* W l15|@node precedes @part, but parts may not be associated with nodes
 warning: @node precedes @part, but parts may not be associated with nodes

';

$result_nodes_list{'part_node_node_part_appendix'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter node
  appendix part
 node_directions:
  next->chapter node
2|chapter node
 associated_section: 1 chapter
 node_preceding_part: Part 1
 associated_title_command: 1 chapter
 node_directions:
  next->appendix part
  prev->Top
  up->Top
3|appendix part
 associated_section: A Appendix
 associated_title_command: A Appendix
 node_directions:
  prev->chapter node
  up->Top
';

$result_sections_list{'part_node_node_part_appendix'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->Part 1
 toplevel_directions:
  next->chapter
2|Part 1
 part_following_node: chapter node
 part_associated_section: 1 chapter
 section_directions:
  next->Part Appendix
  prev->top
 section_children:
  1|chapter
3|chapter
 associated_anchor_command: chapter node
 associated_node: chapter node
 associated_part: Part 1
 section_directions:
  up->Part 1
 toplevel_directions:
  next->Appendix
  prev->top
  up->top
4|Part Appendix
 part_associated_section: A Appendix
 section_directions:
  prev->Part 1
 section_children:
  1|Appendix
5|Appendix
 associated_anchor_command: appendix part
 associated_node: appendix part
 associated_part: Part Appendix
 section_directions:
  up->Part Appendix
 toplevel_directions:
  prev->chapter
  up->top
';

$result_sectioning_root{'part_node_node_part_appendix'} = 'level: -1
list:
 1|top
 2|Part 1
 3|Part Appendix
';

$result_headings_list{'part_node_node_part_appendix'} = '';


$result_converted{'info'}->{'part_node_node_part_appendix'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chapter node,  Up: (dir)

top
***

* Menu:

* chapter node::
* appendix part::


File: ,  Node: chapter node,  Next: appendix part,  Prev: Top,  Up: Top

1 chapter
*********


File: ,  Node: appendix part,  Prev: chapter node,  Up: Top

Appendix A Appendix
*******************


Tag Table:
Node: Top27
Node: chapter node136
Node: appendix part232

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'part_node_node_part_appendix'} = '<!DOCTYPE html>
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter-node" accesskey="n" rel="next">chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<hr>
</div>
<div class="part-level-extent" id="Part-1">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#appendix-part" accesskey="n" rel="next">Appendix</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="part"><span>Part 1<a class="copiable-link" href="#Part-1"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#chapter-node" accesskey="1">chapter</a></li>
</ul>
<div class="chapter-level-extent" id="chapter-node">
<h2 class="chapter" id="chapter"><span>1 chapter<a class="copiable-link" href="#chapter"> &para;</a></span></h2>

<hr>
</div>
<div class="appendix-level-extent" id="appendix-part">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chapter-node" accesskey="p" rel="prev">chapter</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
</div>
</div>
<div class="part-level-extent" id="Part-Appendix">
<h1 class="part"><span>Part Appendix<a class="copiable-link" href="#Part-Appendix"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#appendix-part" accesskey="1">Appendix</a></li>
</ul>
<h2 class="appendix" id="Appendix"><span>Appendix A Appendix<a class="copiable-link" href="#Appendix"> &para;</a></span></h2>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'part_node_node_part_appendix'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter node</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>appendix part</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<part><sectiontitle> Part 1</sectiontitle>

<node identifier="chapter-node"><nodename> chapter node</nodename><nodenext automatic="on"> appendix part</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chapter</sectiontitle>

</chapter>
</part>
<node identifier="appendix-part"><nodename> appendix part</nodename><nodeprev automatic="on"> chapter node</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<part><sectiontitle> Part Appendix</sectiontitle>

<appendix><sectiontitle> Appendix</sectiontitle>
</appendix>
</part>
';

1;
