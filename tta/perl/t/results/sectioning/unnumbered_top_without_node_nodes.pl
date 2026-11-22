use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unnumbered_top_without_node_nodes'} = 'U0 unit{C4}{N:a node}{s:@unnumbered unnumbered}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U0]
FastBack: [U0]
NodeUp: (dir)
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {a node}
 |identifier:{a-node}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:a node}
   *line_arg
   *line_arg
   *line_arg C4
   |manual_content:A{1|1}
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {spaces_after_argument:\\n}
 *normal_command@unnumbered C4 l2 {unnumbered}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in unnumbered\\n}
  {empty_line:\\n}
 *normal_command@top C3 l6 {top section}
 |identifier:{top-section}
 |is_target:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Top section\\n}
  {empty_line:\\n}
U1 unit{C2}{N:second}{s:@chapter 1 Chapter}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
Prev: [U0]
NodeUp: (dir)
 *normal_command@node C1 l9 {second}
 |identifier:{second}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:second}
   *line_arg
   *line_arg
   *line_arg C4
   |manual_content:A{1|1}
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l10 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Text of chapter\\n}
';


$result_texis{'unnumbered_top_without_node_nodes'} = '@node a node,,,(dir)
@unnumbered unnumbered

in unnumbered

@top top section
Top section

@node second,,,(dir)
@chapter Chapter

Text of chapter
';


$result_texts{'unnumbered_top_without_node_nodes'} = 'unnumbered
**********

in unnumbered

top section
***********
Top section

1 Chapter
*********

Text of chapter
';

$result_errors{'unnumbered_top_without_node_nodes'} = '* W l6|lowering the section level of @top appearing after a lower element
 warning: lowering the section level of @top appearing after a lower element

* W l1|node `a node\' not in menu
 warning: node `a node\' not in menu

* W l9|node `second\' unreferenced
 warning: node `second\' unreferenced

';

$result_nodes_list{'unnumbered_top_without_node_nodes'} = '1|a node
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

$result_sections_list{'unnumbered_top_without_node_nodes'} = '1|unnumbered
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

$result_sectioning_root{'unnumbered_top_without_node_nodes'} = 'level: 0
list:
 1|unnumbered
 2|top section
 3|Chapter
';

$result_headings_list{'unnumbered_top_without_node_nodes'} = '';


$result_converted{'info'}->{'unnumbered_top_without_node_nodes'} = Encode::encode('utf-8', 'This is , produced from .


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
Ref: top section102
Node: second140

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'unnumbered_top_without_node_nodes'} = '* W |document without Top node
 warning: document without Top node

';


$result_converted{'html'}->{'unnumbered_top_without_node_nodes'} = '<!DOCTYPE html>
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

<body>
<div class="unnumbered-level-extent" id="a-node">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="dir.html#Top" accesskey="u" rel="up">(dir)</a></span></span><span class="nav-button"> &nbsp; </span></p>
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
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="dir.html#Top" accesskey="u" rel="up">(dir)</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<p>Text of chapter
</p></div>



</body>
</html>
';

1;
