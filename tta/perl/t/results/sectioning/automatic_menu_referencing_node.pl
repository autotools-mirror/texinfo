use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'automatic_menu_referencing_node'} = '*document_root C7
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
 *@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {Chapter}
 |EXTRA
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *@chapter C2 l5 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l7 {section}
 |EXTRA
 |identifier:{section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
 *@section C1 l8 {sec}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec}
    {spaces_after_argument:\\n}
';


$result_texis{'automatic_menu_referencing_node'} = '@node Top
@top top

@node Chapter
@chapter chap

@node section
@section sec
';


$result_texts{'automatic_menu_referencing_node'} = 'top
***

1 chap
******

1.1 sec
=======
';

$result_errors{'automatic_menu_referencing_node'} = '';

$result_nodes_list{'automatic_menu_referencing_node'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chapter
2|Chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
3|section
 associated_section: 1.1 sec
 associated_title_command: 1.1 sec
 node_directions:
  up->Chapter
';

$result_sections_list{'automatic_menu_referencing_node'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: Chapter
 associated_node: Chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|sec
3|sec
 associated_anchor_command: section
 associated_node: section
 section_directions:
  up->chap
';

$result_sectioning_root{'automatic_menu_referencing_node'} = 'level: -1
list:
 1|top
';

$result_headings_list{'automatic_menu_referencing_node'} = '';


$result_converted{'info'}->{'automatic_menu_referencing_node'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: Chapter,  Up: (dir)

top
***

* Menu:

* Chapter::

 -- The Detailed Node Listing --

chap

* section::


File: ,  Node: Chapter,  Prev: Top,  Up: Top

1 chap
******

* Menu:

* section::


File: ,  Node: section,  Up: Chapter

1.1 sec
=======


Tag Table:
Node: Top27
Node: Chapter161
Node: section246

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'automatic_menu_referencing_node'} = '<!DOCTYPE html>
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#Chapter" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#Chapter" accesskey="1">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="Chapter">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#section" accesskey="1">sec</a></li>
</ul>
<hr>
<div class="section-level-extent" id="section">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Chapter" accesskey="u" rel="up">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="sec"><span>1.1 sec<a class="copiable-link" href="#sec"> &para;</a></span></h3>
</div>
</div>
</div>



</body>
</html>
';

1;
