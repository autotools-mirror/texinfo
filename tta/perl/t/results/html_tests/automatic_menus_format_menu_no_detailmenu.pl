use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'automatic_menus_format_menu_no_detailmenu'} = '*document_root C9
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
 *@top C2 l2 {top}
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
 *@node C1 l4 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
 *@chapter C3 l5 {Chap}
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
    {Chap}
  *@nodedescription C1 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Here we begin}
  {empty_line:\\n}
 *@node C1 l8 {sec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{sec}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sec}
 *@section C3 l9 {A section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {A section}
  *@nodedescription C1 l10
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Here in section}
  {empty_line:\\n}
 *@node C1 l12 {sec after}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{sec-after}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sec after}
 *@section C1 l13 {Sec after}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sec after}
';


$result_texis{'automatic_menus_format_menu_no_detailmenu'} = '@node Top
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


$result_texts{'automatic_menus_format_menu_no_detailmenu'} = 'top
***

1 Chap
******

1.1 A section
=============

1.2 Sec after
=============
';

$result_errors{'automatic_menus_format_menu_no_detailmenu'} = '';

$result_nodes_list{'automatic_menus_format_menu_no_detailmenu'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_description: @nodedescription Here we begin
 node_directions:
  prev->Top
  up->Top
3|sec
 associated_section: 1.1 A section
 associated_title_command: 1.1 A section
 node_description: @nodedescription Here in section
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

$result_sections_list{'automatic_menus_format_menu_no_detailmenu'} = '1|top
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

$result_sectioning_root{'automatic_menus_format_menu_no_detailmenu'} = 'level: -1
list:
 1|top
';

$result_headings_list{'automatic_menus_format_menu_no_detailmenu'} = '';


$result_converted{'html'}->{'automatic_menus_format_menu_no_detailmenu'} = '<!DOCTYPE html>
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
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
</style>


</head>

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chap" accesskey="n" rel="next">Chap</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#chap" accesskey="1">chap</a>:</td><td class="menu-entry-description">Here we begin</td></tr>
</table>
<hr>
<div class="chapter-level-extent" id="chap">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#sec" accesskey="1">sec</a>:</td><td class="menu-entry-description">Here in section</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#sec-after" accesskey="2">sec after</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="section-level-extent" id="sec">
<div class="nav-panel">
<p>
Next: <a href="#sec-after" accesskey="n" rel="next">Sec after</a>, Up: <a href="#chap" accesskey="u" rel="up">Chap</a> &nbsp; </p>
</div>
<h3 class="section" id="A-section"><span>1.1 A section<a class="copiable-link" href="#A-section"> &para;</a></span></h3>

<hr>
</div>
<div class="section-level-extent" id="sec-after">
<div class="nav-panel">
<p>
Previous: <a href="#sec" accesskey="p" rel="prev">A section</a>, Up: <a href="#chap" accesskey="u" rel="up">Chap</a> &nbsp; </p>
</div>
<h3 class="section" id="Sec-after"><span>1.2 Sec after<a class="copiable-link" href="#Sec-after"> &para;</a></span></h3>
</div>
</div>
</div>



</body>
</html>
';

1;
