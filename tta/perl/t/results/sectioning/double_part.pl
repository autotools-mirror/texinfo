use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'double_part'} = 'U0 unit{S:top}{n:Top}
unit_directions:D[next->[U1]|page->[U0]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U2]
Next: [U1]
NodeNext: [U2]
NodeForward: [U2]
 *before_node_section C1
  *preamble_before_content
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
  *@menu C3 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{node chapter}
    |normalized:{node-chapter}
     {node chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l6
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
U1 unit{S:part first}
unit_directions:D[next->[U2]|prev->[U0]|page->[U1]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U2]
Next: [U2]
Prev: [U0]
 *@part C3 l8 {part first}
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
    {part first}
  {empty_line:\\n}
  *paragraph C1
   {Text part first.\\n}
U2 unit{S:1 chapter after 2 parts}{n:node chapter}
unit_directions:D[prev->[U1]|page->[U2]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
FastBack: [U1]
NodePrev: [U0]
NodeUp: [U0]
NodeBack: [U0]
 *@part C3 l11 {part second}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{2}
 |section_level:{0}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {part second}
  *paragraph C1
   {Text part second.\\n}
  {empty_line:\\n}
 *@node C1 l14 {node chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{node-chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {node chapter}
 *@chapter C2 l15 {chapter after 2 parts}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter after 2 parts}
  {empty_line:\\n}
';


$result_texis{'double_part'} = '@node Top
@top top

@menu
* node chapter::
@end menu

@part part first

Text part first.
@part part second
Text part second.

@node node chapter
@chapter chapter after 2 parts

';


$result_texts{'double_part'} = 'top
***

* node chapter::

part first
**********

Text part first.
part second
***********
Text part second.

1 chapter after 2 parts
***********************

';

$result_errors{'double_part'} = '* W l8|no sectioning command associated with @part
 warning: no sectioning command associated with @part

* W l8|@part not empty
 warning: @part not empty

* W l11|@part not empty
 warning: @part not empty

';

$result_nodes_list{'double_part'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  node chapter
 node_directions:
  next->node chapter
2|node chapter
 associated_section: 1 chapter after 2 parts
 node_preceding_part: part second
 associated_title_command: 1 chapter after 2 parts
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'double_part'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->part first
 toplevel_directions:
  next->chapter after 2 parts
2|part first
 section_directions:
  next->part second
  prev->top
3|part second
 part_following_node: node chapter
 part_associated_section: 1 chapter after 2 parts
 section_directions:
  prev->part first
 section_children:
  1|chapter after 2 parts
4|chapter after 2 parts
 associated_anchor_command: node chapter
 associated_node: node chapter
 associated_part: part second
 section_directions:
  up->part second
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'double_part'} = 'level: -1
list:
 1|top
 2|part first
 3|part second
';

$result_headings_list{'double_part'} = '';


$result_converted{'plaintext'}->{'double_part'} = 'top
***

Text part first.
Text part second.

1 chapter after 2 parts
***********************

';


$result_converted{'html'}->{'double_part'} = '<!DOCTYPE html>
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
Next: <a href="#node-chapter" accesskey="n" rel="next">chapter after 2 parts</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<hr>
</div>
<div class="part-level-extent" id="part-first">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h1 class="part"><span>part first<a class="copiable-link" href="#part-first"> &para;</a></span></h1>
<hr>

<p>Text part first.
</p></div>
<div class="part-level-extent" id="part-second">
<h1 class="part"><span>part second<a class="copiable-link" href="#part-second"> &para;</a></span></h1>
<hr>
<p>Text part second.
</p>
<ul class="mini-toc">
<li><a href="#node-chapter" accesskey="1">chapter after 2 parts</a></li>
</ul>
<div class="chapter-level-extent" id="node-chapter">
<h2 class="chapter" id="chapter-after-2-parts"><span>1 chapter after 2 parts<a class="copiable-link" href="#chapter-after-2-parts"> &para;</a></span></h2>

</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'double_part'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">node chapter</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>node chapter</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<part spaces=" "><sectiontitle>part first</sectiontitle>

<para>Text part first.
</para></part>
<part spaces=" "><sectiontitle>part second</sectiontitle>
<para>Text part second.
</para>
<node identifier="node-chapter" spaces=" "><nodename>node chapter</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>chapter after 2 parts</sectiontitle>

</chapter>
</part>
';

1;
