use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'appendix_and_associated_part_in_generated_menu'} = '*document_root C13
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
 *@node C1 l4 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
 *@chapter C2 l5 {Chap}
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
  {empty_line:\\n}
 *@node C1 l7 {sec}
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
 *@appendixsec C2 l8 {Sec}
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
    {Sec}
  {empty_line:\\n}
 *@part C2 l10 {P1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {P1}
  {empty_line:\\n}
 *@node C1 l12 {chap2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{chap2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap2}
 *@chapter C2 l13 {Chap 2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chap 2}
  {empty_line:\\n}
 *@part C2 l15 {Final}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{2}
 |section_level:{0}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Final}
  {empty_line:\\n}
 *@node C1 l17 {app}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{app}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {app}
 *@appendix C1 l18 {GGG}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {GGG}
';


$result_texis{'appendix_and_associated_part_in_generated_menu'} = '@node Top
@top top

@node chapter
@chapter Chap

@node sec
@appendixsec Sec

@part P1

@node chap2
@chapter Chap 2

@part Final

@node app
@appendix GGG
';


$result_texts{'appendix_and_associated_part_in_generated_menu'} = 'top
***

1 Chap
******

1.1 Sec
=======

P1
**

2 Chap 2
********

Final
*****

Appendix A GGG
**************
';

$result_errors{'appendix_and_associated_part_in_generated_menu'} = '';

$result_nodes_list{'appendix_and_associated_part_in_generated_menu'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  next->chap2
  prev->Top
  up->Top
3|sec
 associated_section: 1.1 Sec
 associated_title_command: 1.1 Sec
 node_directions:
  up->chapter
4|chap2
 associated_section: 2 Chap 2
 node_preceding_part: P1
 associated_title_command: 2 Chap 2
 node_directions:
  next->app
  prev->chapter
  up->Top
5|app
 associated_section: A GGG
 node_preceding_part: Final
 associated_title_command: A GGG
 node_directions:
  prev->chap2
  up->Top
';

$result_sections_list{'appendix_and_associated_part_in_generated_menu'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->P1
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  next->Chap 2
  prev->top
  up->top
 section_children:
  1|Sec
3|Sec
 associated_anchor_command: sec
 associated_node: sec
 section_directions:
  up->Chap
4|P1
 part_following_node: chap2
 part_associated_section: 2 Chap 2
 section_directions:
  next->Final
  prev->top
 section_children:
  1|Chap 2
5|Chap 2
 associated_anchor_command: chap2
 associated_node: chap2
 associated_part: P1
 section_directions:
  up->P1
 toplevel_directions:
  next->GGG
  prev->Chap
  up->top
6|Final
 part_following_node: app
 part_associated_section: A GGG
 section_directions:
  prev->P1
 section_children:
  1|GGG
7|GGG
 associated_anchor_command: app
 associated_node: app
 associated_part: Final
 section_directions:
  up->Final
 toplevel_directions:
  prev->Chap 2
  up->top
';

$result_sectioning_root{'appendix_and_associated_part_in_generated_menu'} = 'level: -1
list:
 1|top
 2|P1
 3|Final
';

$result_headings_list{'appendix_and_associated_part_in_generated_menu'} = '';


$result_converted{'plaintext'}->{'appendix_and_associated_part_in_generated_menu'} = 'top
***

* Menu:

* chapter::

Part: P1

* chap2::

Part: Final

Appendices

* app::

 -- The Detailed Node Listing --

Chap

* sec::

1 Chap
******

* Menu:

* sec::

1.1 Sec
=======

2 Chap 2
********

Appendix A GGG
**************

';


$result_converted{'html'}->{'appendix_and_associated_part_in_generated_menu'} = '<!DOCTYPE html>
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

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chapter" accesskey="n" rel="next">Chap</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#chapter" accesskey="1">chapter</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

Part: P1

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#chap2" accesskey="2">chap2</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

Part: Final

</pre></th></tr><tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">Appendices

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#app" accesskey="3">app</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted"> &mdash; The Detailed Node Listing &mdash;

Chap

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#sec" accesskey="4">sec</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="chapter-level-extent" id="chapter">
<div class="nav-panel">
<p>
Next: <a href="#chap2" accesskey="n" rel="next">Chap 2</a>, Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#sec" accesskey="1">sec</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="appendixsec-level-extent" id="sec">
<div class="nav-panel">
<p>
Up: <a href="#chapter" accesskey="u" rel="up">Chap</a> &nbsp; </p>
</div>
<h3 class="appendixsec" id="Sec"><span>1.1 Sec<a class="copiable-link" href="#Sec"> &para;</a></span></h3>

<hr>
</div>
</div>
</div>
<div class="part-level-extent" id="P1">
<div class="nav-panel">
<p>
Next: <a href="#app" accesskey="n" rel="next">GGG</a>, Previous: <a href="#chapter" accesskey="p" rel="prev">Chap</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h1 class="part"><span>P1<a class="copiable-link" href="#P1"> &para;</a></span></h1>
<hr>

<div class="chapter-level-extent" id="chap2">
<h2 class="chapter" id="Chap-2"><span>2 Chap 2<a class="copiable-link" href="#Chap-2"> &para;</a></span></h2>

<hr>
</div>
</div>
<div class="part-level-extent" id="Final">
<div class="nav-panel">
<p>
Previous: <a href="#chap2" accesskey="p" rel="prev">Chap 2</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h1 class="part"><span>Final<a class="copiable-link" href="#Final"> &para;</a></span></h1>
<hr>

<div class="appendix-level-extent" id="app">
<h2 class="appendix" id="GGG"><span>Appendix A GGG<a class="copiable-link" href="#GGG"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'appendix_and_associated_part_in_generated_menu'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chapter</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

</top>
<node identifier="chapter" spaces=" "><nodename>chapter</nodename><nodenext automatic="on">chap2</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chap</sectiontitle>

<node identifier="sec" spaces=" "><nodename>sec</nodename><nodeup automatic="on">chapter</nodeup></node>
<appendixsec spaces=" "><sectiontitle>Sec</sectiontitle>

</appendixsec>
</chapter>
<part spaces=" "><sectiontitle>P1</sectiontitle>

<node identifier="chap2" spaces=" "><nodename>chap2</nodename><nodenext automatic="on">app</nodenext><nodeprev automatic="on">chapter</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chap 2</sectiontitle>

</chapter>
</part>
<part spaces=" "><sectiontitle>Final</sectiontitle>

<node identifier="app" spaces=" "><nodename>app</nodename><nodeprev automatic="on">chap2</nodeprev><nodeup automatic="on">Top</nodeup></node>
<appendix spaces=" "><sectiontitle>GGG</sectiontitle>
</appendix>
</part>
';


$result_converted{'info'}->{'appendix_and_associated_part_in_generated_menu'} = 'This is , produced from .


File: ,  Node: Top,  Next: chapter,  Up: (dir)

top
***

* Menu:

* chapter::

Part: P1

* chap2::

Part: Final

Appendices

* app::

 -- The Detailed Node Listing --

Chap

* sec::


File: ,  Node: chapter,  Next: chap2,  Prev: Top,  Up: Top

1 Chap
******

* Menu:

* sec::


File: ,  Node: sec,  Up: chapter

1.1 Sec
=======


File: ,  Node: chap2,  Next: app,  Prev: chapter,  Up: Top

2 Chap 2
********


File: ,  Node: app,  Prev: chap2,  Up: Top

Appendix A GGG
**************


Tag Table:
Node: Top27
Node: chapter212
Node: sec307
Node: chap2360
Node: app441

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
