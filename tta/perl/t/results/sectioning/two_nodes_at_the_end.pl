use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'two_nodes_at_the_end'} = 'U0 unit{S:top}{n:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
NodeNext: [U1]
NodeForward: [U1]
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
  *@menu C5 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter 1}
    |normalized:{chapter-1}
     {chapter 1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{node after chapter 1}
    |normalized:{node-after-chapter-1}
     {node after chapter 1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{last node in chapter 1}
    |normalized:{last-node-in-chapter-1}
     {last node in chapter 1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l8
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
U1 unit{S:1 chapter c1}{n:chapter 1}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
FastBack: [U0]
Up: [U0]
NodeNext: [U1]
NodePrev: [U0]
NodeUp: [U0]
NodeForward: [U1]
NodeBack: [U0]
 *@node C1 l10 {chapter 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chapter-1}
  *arguments_line C4
   *line_arg C1
    {chapter 1}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{node after chapter 1}
   |normalized:{node-after-chapter-1}
    {node after chapter 1}
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
 *@chapter C2 l11 {chapter c1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter c1}
  {empty_line:\\n}
 *@node C4 l13 {node after chapter 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{node-after-chapter-1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {node after chapter 1}
  {empty_line:\\n}
  *paragraph C1
   {in node after chapter 1\\n}
  {empty_line:\\n}
 *@node C1 l17 {last node in chapter 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{last-node-in-chapter-1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {last node in chapter 1}
';


$result_texis{'two_nodes_at_the_end'} = '@node Top
@top top

@menu
* chapter 1::
* node after chapter 1::
* last node in chapter 1::
@end menu

@node chapter 1, node after chapter 1, Top, Top
@chapter chapter c1

@node node after chapter 1

in node after chapter 1

@node last node in chapter 1
';


$result_texts{'two_nodes_at_the_end'} = 'top
***

* chapter 1::
* node after chapter 1::
* last node in chapter 1::

1 chapter c1
************


in node after chapter 1

';

$result_errors{'two_nodes_at_the_end'} = '* W l7|unexpected node `last node in chapter 1\' in menu
 warning: unexpected node `last node in chapter 1\' in menu

';

$result_nodes_list{'two_nodes_at_the_end'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter 1
  node after chapter 1
  last node in chapter 1
 node_directions:
  next->chapter 1
2|chapter 1
 associated_section: 1 chapter c1
 associated_title_command: 1 chapter c1
 node_directions:
  next->node after chapter 1
  prev->Top
  up->Top
3|node after chapter 1
 node_directions:
  next->last node in chapter 1
  prev->chapter 1
  up->Top
4|last node in chapter 1
 node_directions:
  prev->node after chapter 1
  up->Top
';

$result_sections_list{'two_nodes_at_the_end'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter c1
 section_children:
  1|chapter c1
2|chapter c1
 associated_anchor_command: chapter 1
 associated_node: chapter 1
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'two_nodes_at_the_end'} = 'level: -1
list:
 1|top
';

$result_headings_list{'two_nodes_at_the_end'} = '';


$result_converted{'plaintext'}->{'two_nodes_at_the_end'} = 'top
***

1 chapter c1
************

in node after chapter 1

';


$result_converted{'html'}->{'two_nodes_at_the_end'} = '<!DOCTYPE html>
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
Next: <a href="#chapter-1" accesskey="n" rel="next">chapter c1</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<ul class="mini-toc">
<li><a href="#chapter-1" accesskey="1">chapter c1</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter-1">
<div class="nav-panel">
<p>
Next: <a href="#node-after-chapter-1" accesskey="n" rel="next">node after chapter 1</a>, Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="chapter-c1"><span>1 chapter c1<a class="copiable-link" href="#chapter-c1"> &para;</a></span></h2>

<hr>
<a class="node-id" id="node-after-chapter-1"></a><div class="nav-panel">
<p>
Next: <a href="#last-node-in-chapter-1" accesskey="n" rel="next">last node in chapter 1</a>, Previous: <a href="#chapter-1" accesskey="p" rel="prev">chapter c1</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h4 class="node"><span>node after chapter 1<a class="copiable-link" href="#node-after-chapter-1"> &para;</a></span></h4>

<p>in node after chapter 1
</p>
<hr>
<a class="node-id" id="last-node-in-chapter-1"></a><div class="nav-panel">
<p>
Previous: <a href="#node-after-chapter-1" accesskey="p" rel="prev">node after chapter 1</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h4 class="node"><span>last node in chapter 1<a class="copiable-link" href="#last-node-in-chapter-1"> &para;</a></span></h4>
</div>
</div>



</body>
</html>
';


$result_converted{'latex_text'}->{'two_nodes_at_the_end'} = '\\begin{document}
\\label{anchor:Top}%
\\chapter{{chapter c1}}
\\label{anchor:chapter-1}%

\\label{anchor:node-after-chapter-1}%

in node after chapter 1

\\label{anchor:last-node-in-chapter-1}%
';

1;
