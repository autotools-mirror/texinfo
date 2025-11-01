use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'part_node_chapter_after_top'} = 'U0 unit{S:top}{n:Top}
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
    |node_content:{a node after part}
    |normalized:{a-node-after-part}
     {a node after part}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter}
    |normalized:{chapter}
     {chapter}
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
U1 unit{S:1 chapter}{n:chapter}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
FastBack: [U0]
NodeNext: [U1]
NodeUp: [U0]
NodeForward: [U1]
NodeBack: [U0]
 *@part C2 l9 {part}
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
    {part}
  {empty_line:\\n}
 *@node C3 l11 {a node after part}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{a-node-after-part}
  *arguments_line C4
   *line_arg C1
    {a node after part}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{chapter}
   |normalized:{chapter}
    {chapter}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
  *paragraph C1
   {After a node after part\\n}
  {empty_line:\\n}
 *@node C1 l14 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{chapter}
  *arguments_line C4
   *line_arg C1
    {chapter}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{a node after part}
   |normalized:{a-node-after-part}
    {a node after part}
   *line_arg
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
 *@chapter C1 l15 {chapter}
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
    |{spaces_after_argument: \\n}
    {chapter}
';


$result_texis{'part_node_chapter_after_top'} = '@node Top
@top top

@menu
* a node after part::
* chapter::
@end menu

@part part

@node a node after part, chapter, Top, Top
After a node after part

@node chapter, a node after part,, Top
@chapter chapter 
';


$result_texts{'part_node_chapter_after_top'} = 'top
***

* a node after part::
* chapter::

part
****

After a node after part

1 chapter
*********
';

$result_errors{'part_node_chapter_after_top'} = '';

$result_nodes_list{'part_node_chapter_after_top'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  a node after part
  chapter
 node_directions:
  next->a node after part
2|a node after part
 node_preceding_part: part
 node_directions:
  next->chapter
  prev->Top
  up->Top
3|chapter
 associated_section: 1 chapter
 node_preceding_part: part
 associated_title_command: 1 chapter
 node_directions:
  next->a node after part
  up->Top
';

$result_sections_list{'part_node_chapter_after_top'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->part
 toplevel_directions:
  next->chapter
2|part
 part_following_node: chapter
 part_associated_section: 1 chapter
 section_directions:
  prev->top
 section_children:
  1|chapter
3|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 associated_part: part
 section_directions:
  up->part
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'part_node_chapter_after_top'} = 'level: -1
list:
 1|top
 2|part
';

$result_headings_list{'part_node_chapter_after_top'} = '';


$result_converted{'info'}->{'part_node_chapter_after_top'} = 'This is , produced from .


File: ,  Node: Top,  Next: a node after part,  Up: (dir)

top
***

* Menu:

* a node after part::
* chapter::


File: ,  Node: a node after part,  Next: chapter,  Prev: Top,  Up: Top

After a node after part


File: ,  Node: chapter,  Next: a node after part,  Up: Top

1 chapter
*********


Tag Table:
Node: Top27
Node: a node after part140
Node: chapter239

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'part_node_chapter_after_top'} = '<!DOCTYPE html>
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
Next: <a href="#a-node-after-part" accesskey="n" rel="next">a node after part</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<hr>
</div>
<div class="part-level-extent" id="part">
<div class="nav-panel">
<p>
Next: <a href="#chapter" accesskey="n" rel="next">chapter</a>, Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">chapter</a></li>
</ul>
<h4 class="node" id="a-node-after-part"><span>a node after part<a class="copiable-link" href="#a-node-after-part"> &para;</a></span></h4>
<p>After a node after part
</p>
<hr>
<div class="chapter-level-extent" id="chapter">
<div class="nav-panel">
<p>
Next: <a href="#a-node-after-part" accesskey="n" rel="next">a node after part</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="chapter-1"><span>1 chapter<a class="copiable-link" href="#chapter-1"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'part_node_chapter_after_top'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">a node after part</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>a node after part</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<part spaces=" "><sectiontitle>part</sectiontitle>

<node identifier="a-node-after-part" spaces=" "><nodename>a node after part</nodename><nodenext spaces=" ">chapter</nodenext><nodeprev spaces=" ">Top</nodeprev><nodeup spaces=" ">Top</nodeup></node>
<para>After a node after part
</para>
<node identifier="chapter" spaces=" "><nodename>chapter</nodename><nodenext spaces=" ">a node after part</nodenext><nodeprev></nodeprev><nodeup spaces=" ">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>chapter </sectiontitle>
</chapter>
</part>
';

1;
