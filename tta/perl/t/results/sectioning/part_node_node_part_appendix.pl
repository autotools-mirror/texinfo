use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'part_node_node_part_appendix'} = 'U0 unit{S:top}{n:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
Next: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C4 l2 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
  *@menu C4 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter node}
    |normalized:{chapter-node}
     {chapter node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{appendix part}
    |normalized:{appendix-part}
     {appendix part}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
U1 unit{S:1 chapter}{n:chapter node}
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
 *@part C2 l9 {Part 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Part 1}
  {empty_line:\\n}
 *@node C1 l11 {chapter node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chapter-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter node}
 *@chapter C2 l12 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
  {empty_line:\\n}
U2 unit{S:A Appendix}{n:appendix part}
unit_directions:D[prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
FastBack: [U1]
NodePrev: [U1]
NodeUp: [U0]
NodeBack: [U1]
 *@node C1 l14 {appendix part}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{appendix-part}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {appendix part}
 *@part C2 l15 {Part Appendix}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{2}
 |section_level:{0}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Part Appendix}
  {empty_line:\\n}
 *@appendix C1 l17 {Appendix}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Appendix}
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


$result_converted{'info'}->{'part_node_node_part_appendix'} = 'This is , produced from .


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
';


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

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chapter-node" accesskey="n" rel="next">chapter</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<hr>
</div>
<div class="part-level-extent" id="Part-1">
<div class="nav-panel">
<p>
Next: <a href="#appendix-part" accesskey="n" rel="next">Appendix</a>, Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
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
<div class="nav-panel">
<p>
Previous: <a href="#chapter-node" accesskey="p" rel="prev">chapter</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
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


$result_converted{'xml'}->{'part_node_node_part_appendix'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chapter node</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>appendix part</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<part spaces=" "><sectiontitle>Part 1</sectiontitle>

<node identifier="chapter-node" spaces=" "><nodename>chapter node</nodename><nodenext automatic="on">appendix part</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>chapter</sectiontitle>

</chapter>
</part>
<node identifier="appendix-part" spaces=" "><nodename>appendix part</nodename><nodeprev automatic="on">chapter node</nodeprev><nodeup automatic="on">Top</nodeup></node>
<part spaces=" "><sectiontitle>Part Appendix</sectiontitle>

<appendix spaces=" "><sectiontitle>Appendix</sectiontitle>
</appendix>
</part>
';

1;
