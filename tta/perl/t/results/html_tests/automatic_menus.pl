use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'automatic_menus'} = '*document_root C9
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l5 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  *normal_command@nodedescription C1 l6
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Here we begin}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l8 {sec}
 |identifier:{sec}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec}
    {spaces_after_argument:\\n}
 *normal_command@section C3 l9 {A section}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:A section}
    {spaces_after_argument:\\n}
  *normal_command@nodedescription C1 l10
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Here in section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l12 {sec after}
 |identifier:{sec-after}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec after}
    {spaces_after_argument:\\n}
 *normal_command@section C1 l13 {Sec after}
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Sec after}
    {spaces_after_argument:\\n}
';


$result_texis{'automatic_menus'} = '@node Top
@top top

@node chap
@chapter Chap
@nodedescription Here we begin

@node sec
@section A section
@nodedescription Here in section

@node sec after
@section Sec after
';


$result_texts{'automatic_menus'} = 'top
***

1 Chap
******

1.1 A section
=============

1.2 Sec after
=============
';

$result_errors{'automatic_menus'} = '';

$result_nodes_list{'automatic_menus'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_descriptions:
  @nodedescription Here we begin
 node_directions:
  prev->Top
  up->Top
3|sec
 associated_section: 1.1 A section
 associated_title_command: 1.1 A section
 node_descriptions:
  @nodedescription Here in section
 node_directions:
  next->sec after
  up->chap
4|sec after
 associated_section: 1.2 Sec after
 associated_title_command: 1.2 Sec after
 node_directions:
  prev->sec
  up->chap
';

$result_sections_list{'automatic_menus'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|A section
  2|Sec after
3|A section
 associated_anchor_command: sec
 associated_node: sec
 section_directions:
  next->Sec after
  up->Chap
4|Sec after
 associated_anchor_command: sec after
 associated_node: sec after
 section_directions:
  prev->A section
  up->Chap
';

$result_sectioning_root{'automatic_menus'} = 'level: -1
list:
 1|top
';

$result_headings_list{'automatic_menus'} = '';


$result_converted{'html'}->{'automatic_menus'} = '<!DOCTYPE html>
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
pre.menu-comment-preformatted {font-family: serif}
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
th.menu-comment {text-align:left}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">Chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#chap" accesskey="1">chap</a>:</td><td class="menu-entry-description">Here we begin</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted"> &mdash; The Detailed Node Listing &mdash;

Chap

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#sec" accesskey="2">sec</a>:</td><td class="menu-entry-description">Here in section</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#sec-after" accesskey="3">sec after</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#sec" accesskey="1">sec</a>:</td><td class="menu-entry-description">Here in section</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#sec-after" accesskey="2">sec after</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="section-level-extent" id="sec">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#sec-after" accesskey="n" rel="next">Sec after</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#chap" accesskey="u" rel="up">Chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="A-section"><span>1.1 A section<a class="copiable-link" href="#A-section"> &para;</a></span></h3>

<hr>
</div>
<div class="section-level-extent" id="sec-after">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#sec" accesskey="p" rel="prev">A section</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#chap" accesskey="u" rel="up">Chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="Sec-after"><span>1.2 Sec after<a class="copiable-link" href="#Sec-after"> &para;</a></span></h3>
</div>
</div>
</div>



</body>
</html>
';

1;
