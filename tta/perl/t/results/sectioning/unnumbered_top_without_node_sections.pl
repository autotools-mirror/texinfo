use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'unnumbered_top_without_node_sections'} = 'U0 unit{S:unnumbered}{n:a node}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
Next: [U1]
NodeUp: (dir)
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {a node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{a-node}
  *arguments_line C4
   *line_arg C1
    {a node}
   *line_arg
   *line_arg
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |manual_content:{dir}
    {(}
    {dir}
    {)}
 *@unnumbered C4 l2 {unnumbered}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {unnumbered}
  {empty_line:\\n}
  *paragraph C1
   {in unnumbered\\n}
  {empty_line:\\n}
U1 unit{S:top section}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U2]
FastBack: [U0]
Next: [U2]
Prev: [U0]
 *@top C3 l6 {top section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top section}
  *paragraph C1
   {Top section\\n}
  {empty_line:\\n}
U2 unit{S:1 Chapter}{n:second}
unit_directions:D[prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
FastBack: [U1]
Prev: [U1]
NodeUp: (dir)
 *@node C1 l9 {second}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{second}
  *arguments_line C4
   *line_arg C1
    {second}
   *line_arg
   *line_arg
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |manual_content:{dir}
    {(}
    {dir}
    {)}
 *@chapter C3 l10 {Chapter}
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
    {Chapter}
  {empty_line:\\n}
  *paragraph C1
   {Text of chapter\\n}
';


$result_texis{'unnumbered_top_without_node_sections'} = '@node a node,,,(dir)
@unnumbered unnumbered

in unnumbered

@top top section
Top section

@node second,,,(dir)
@chapter Chapter

Text of chapter
';


$result_texts{'unnumbered_top_without_node_sections'} = 'unnumbered
**********

in unnumbered

top section
***********
Top section

1 Chapter
*********

Text of chapter
';

$result_errors{'unnumbered_top_without_node_sections'} = '* W l6|lowering the section level of @top appearing after a lower element
 warning: lowering the section level of @top appearing after a lower element

* W l1|node `a node\' not in menu
 warning: node `a node\' not in menu

* W l9|node `second\' unreferenced
 warning: node `second\' unreferenced

';

$result_nodes_list{'unnumbered_top_without_node_sections'} = '1|a node
 associated_section: unnumbered
 associated_title_command: unnumbered
 node_directions:
  up->(dir)

2|second
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  up->(dir)

';

$result_sections_list{'unnumbered_top_without_node_sections'} = '1|unnumbered
 associated_anchor_command: a node
 associated_node: a node
 section_directions:
  next->top section
 toplevel_directions:
  next->top section
2|top section
 section_directions:
  next->Chapter
  prev->unnumbered
 toplevel_directions:
  next->Chapter
  prev->unnumbered
3|Chapter
 associated_anchor_command: second
 associated_node: second
 section_directions:
  prev->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'unnumbered_top_without_node_sections'} = 'level: 0
list:
 1|unnumbered
 2|top section
 3|Chapter
';

$result_headings_list{'unnumbered_top_without_node_sections'} = '';


$result_converted{'info'}->{'unnumbered_top_without_node_sections'} = 'This is , produced from .


File: ,  Node: a node,  Up: (dir)

unnumbered
**********

in unnumbered

top section
***********

Top section


File: ,  Node: second,  Up: (dir)

1 Chapter
*********

Text of chapter


Tag Table:
Node: a node27
Node: second140

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'unnumbered_top_without_node_sections'} = [
  {
    'error_line' => 'warning: document without Top node
',
    'text' => 'document without Top node',
    'type' => 'warning'
  }
];



$result_converted{'html'}->{'unnumbered_top_without_node_sections'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top section</title>

<meta name="description" content="top section">
<meta name="keywords" content="top section">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#a-node" rel="start" title="a node">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">
<div class="unnumbered-level-extent" id="a-node">
<div class="nav-panel">
<p>
Up: <a href="dir.html#Top" accesskey="u" rel="up">(dir)</a> &nbsp; </p>
</div>
<h2 class="unnumbered" id="unnumbered"><span>unnumbered<a class="copiable-link" href="#unnumbered"> &para;</a></span></h2>

<p>in unnumbered
</p>
</div>
<div class="unnumbered-level-extent" id="top-section">
<h2 class="unnumbered top-level-set-unnumbered"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h2>
<p>Top section
</p>
<hr>
</div>
<div class="chapter-level-extent" id="second">
<div class="nav-panel">
<p>
Up: <a href="dir.html#Top" accesskey="u" rel="up">(dir)</a> &nbsp; </p>
</div>
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<p>Text of chapter
</p></div>



</body>
</html>
';


$result_converted{'latex_text'}->{'unnumbered_top_without_node_sections'} = '\\begin{document}
\\chapter*{{unnumbered}}
\\label{anchor:a-node}%

in unnumbered

\\part*{{top section}}
Top section

\\chapter{{Chapter}}
\\label{anchor:second}%

Text of chapter
';

1;
