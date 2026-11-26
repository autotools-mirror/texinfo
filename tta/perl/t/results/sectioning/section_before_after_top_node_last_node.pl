use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'section_before_after_top_node_last_node'} = '*document_root C6
 *before_node_section C1
  *preamble
 *normal_command@unnumbered C2 l1 {before}
 |identifier:{before}
 |is_target:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:before}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l4 {top section}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C4 l6 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
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
   {normal_text:in chapter\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {node after}
 |identifier:{node-after}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node after}
    {spaces_after_argument:\\n}
';


$result_texis{'section_before_after_top_node_last_node'} = '@unnumbered before

@node Top
@top top section

@chapter Chapter

in chapter

@node node after
';


$result_texts{'section_before_after_top_node_last_node'} = 'before
******

top section
***********

1 Chapter
*********

in chapter

';

$result_errors{'section_before_after_top_node_last_node'} = '* W l4|lowering the section level of @top appearing after a lower element
 warning: lowering the section level of @top appearing after a lower element

* W l10|node `node after\' not in menu
 warning: node `node after\' not in menu

';

$result_nodes_list{'section_before_after_top_node_last_node'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->node after
2|node after
 node_directions:
  prev->Top
';

$result_sections_list{'section_before_after_top_node_last_node'} = '1|before
 section_directions:
  next->top section
 toplevel_directions:
  next->top section
2|top section
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->Chapter
  prev->before
 toplevel_directions:
  next->Chapter
  prev->before
3|Chapter
 section_directions:
  prev->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'section_before_after_top_node_last_node'} = 'level: 0
list:
 1|before
 2|top section
 3|Chapter
';

$result_headings_list{'section_before_after_top_node_last_node'} = '';


$result_converted{'info'}->{'section_before_after_top_node_last_node'} = Encode::encode('utf-8', 'This is , produced from section_before_after_top_node_last_node.texi.

before
******


File: ,  Node: Top,  Next: node after,  Up: (dir)

top section
***********

1 Chapter
*********

in chapter


File: ,  Node: node after,  Prev: Top


Tag Table:
Ref: before71
Node: Top86
Ref: Chapter164
Node: node after197

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'section_before_after_top_node_last_node'} = '* W l1|@unnumbered outside of any node
 warning: @unnumbered outside of any node

';


$result_converted{'html'}->{'section_before_after_top_node_last_node'} = '<!DOCTYPE html>
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

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<div class="unnumbered-level-extent" id="before">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#node-after" accesskey="n" rel="next">node after</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="unnumbered"><span>before<a class="copiable-link" href="#before"> &para;</a></span></h2>

</div>
<div class="unnumbered-level-extent" id="Top">
<h2 class="unnumbered top-level-set-unnumbered" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h2>

</div>
<div class="chapter-level-extent" id="Chapter">
<h2 class="chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<p>in chapter
</p>
<hr>
<a class="node-id" id="node-after"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top section</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>node after<a class="copiable-link" href="#node-after"> &para;</a></span></h4>
</div>



</body>
</html>
';


$result_converted{'docbook'}->{'section_before_after_top_node_last_node'} = '<chapter label="" id="before">
<title>before</title>

</chapter>
<anchor id="node-after"/>
';


$result_converted{'latex_text'}->{'section_before_after_top_node_last_node'} = '\\begin{document}
\\Texinfounnumberedchapter{{before}}
\\label{anchor:before}%

\\label{anchor:Top}%
\\label{anchor:Chapter}%
\\label{anchor:node-after}%
';

1;
