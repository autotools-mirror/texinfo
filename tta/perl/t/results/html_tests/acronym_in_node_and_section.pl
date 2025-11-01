use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'acronym_in_node_and_section'} = '*document_root C9
 *before_node_section
 *@node C1 l1 {top}
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
    {top}
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
 *@chapter C2 l5 {chap}
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
    {chap}
  {empty_line:\\n}
 *@node C1 l7 {sec define}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{sec-define}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sec define}
 *@section C4 l8 {define}
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
    {define}
  {empty_line:\\n}
  *paragraph C2
   *@acronym C2 l10
    *brace_arg C1
     {GHJ}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Good Hypo Jolly}
   {\\n}
  {empty_line:\\n}
 *@node C1 l12 {sec here is @acronym{GHJ}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{sec-here-is-GHJ}
  *arguments_line C1
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sec here is }
    *@acronym C1 l12
     *brace_arg C1
      {GHJ}
 *@section C3 l13 {here is @acronym{GHJ}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {here is }
    *@acronym C1 l13
     *brace_arg C1
      {GHJ}
  {empty_line:\\n}
  *paragraph C3
   {In text }
   *@acronym C1 l15
    *brace_arg C1
     {GHJ}
   {.\\n}
';


$result_texis{'acronym_in_node_and_section'} = '@node top
@top top

@node chap
@chapter chap

@node sec define
@section define

@acronym{GHJ, Good Hypo Jolly}

@node sec here is @acronym{GHJ}
@section here is @acronym{GHJ}

In text @acronym{GHJ}.
';


$result_texts{'acronym_in_node_and_section'} = 'top
***

1 chap
******

1.1 define
==========

GHJ (Good Hypo Jolly)

1.2 here is GHJ
===============

In text GHJ.
';

$result_errors{'acronym_in_node_and_section'} = '';

$result_nodes_list{'acronym_in_node_and_section'} = '1|top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->top
  up->top
3|sec define
 associated_section: 1.1 define
 associated_title_command: 1.1 define
 node_directions:
  next->sec here is @acronym{GHJ}
  up->chap
4|sec here is @acronym{GHJ}
 associated_section: 1.2 here is @acronym{GHJ}
 associated_title_command: 1.2 here is @acronym{GHJ}
 node_directions:
  prev->sec define
  up->chap
';

$result_sections_list{'acronym_in_node_and_section'} = '1|top
 associated_anchor_command: top
 associated_node: top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|define
  2|here is @acronym{GHJ}
3|define
 associated_anchor_command: sec define
 associated_node: sec define
 section_directions:
  next->here is @acronym{GHJ}
  up->chap
4|here is @acronym{GHJ}
 associated_anchor_command: sec here is @acronym{GHJ}
 associated_node: sec here is @acronym{GHJ}
 section_directions:
  prev->define
  up->chap
';

$result_sectioning_root{'acronym_in_node_and_section'} = 'level: -1
list:
 1|top
';

$result_headings_list{'acronym_in_node_and_section'} = '';


$result_converted{'html'}->{'acronym_in_node_and_section'} = '<!DOCTYPE html>
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

<link href="#Top" rel="start" title="top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chap" accesskey="n" rel="next">chap</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap" accesskey="1">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="chap-1"><span>1 chap<a class="copiable-link" href="#chap-1"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#sec-define" accesskey="1">define</a></li>
<li><a href="#sec-here-is-GHJ" accesskey="2">here is <abbr class="acronym">GHJ</abbr></a></li>
</ul>
<hr>
<div class="section-level-extent" id="sec-define">
<div class="nav-panel">
<p>
Next: <a href="#sec-here-is-GHJ" accesskey="n" rel="next">here is <abbr class="acronym">GHJ</abbr></a>, Up: <a href="#chap" accesskey="u" rel="up">chap</a> &nbsp; </p>
</div>
<h3 class="section" id="define"><span>1.1 define<a class="copiable-link" href="#define"> &para;</a></span></h3>

<p><abbr class="acronym" title="Good Hypo Jolly">GHJ</abbr> (Good Hypo Jolly)
</p>
<hr>
</div>
<div class="section-level-extent" id="sec-here-is-GHJ">
<div class="nav-panel">
<p>
Previous: <a href="#sec-define" accesskey="p" rel="prev">define</a>, Up: <a href="#chap" accesskey="u" rel="up">chap</a> &nbsp; </p>
</div>
<h3 class="section" id="here-is-GHJ"><span>1.2 here is <abbr class="acronym" title="Good Hypo Jolly">GHJ</abbr><a class="copiable-link" href="#here-is-GHJ"> &para;</a></span></h3>

<p>In text <abbr class="acronym" title="Good Hypo Jolly">GHJ</abbr>.
</p></div>
</div>
</div>



</body>
</html>
';

1;
