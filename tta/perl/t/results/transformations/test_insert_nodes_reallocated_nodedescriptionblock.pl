use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'test_insert_nodes_reallocated_nodedescriptionblock'} = '*document_root C9
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
 *@node C1 {Sec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Sec}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sec}
 *@section C5 l7 {Sec}
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
  *@nodedescriptionblock C3 l8
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {D1\\n}
   *@end C1 l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{nodedescriptionblock}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {nodedescriptionblock}
  {empty_line:\\n}
  *@nodedescriptionblock C3 l12
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {D2\\n}
   *@end C1 l14
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{nodedescriptionblock}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {nodedescriptionblock}
  {empty_line:\\n}
 *@node C1 {Subsec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{Subsec}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Subsec}
 *@subsection C2 l16 {Subsec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Subsec}
  {empty_line:\\n}
';


$result_texis{'test_insert_nodes_reallocated_nodedescriptionblock'} = '@node Top
@top top

@node chap
@chapter Chap

@node Sec
@section Sec
@nodedescriptionblock
D1
@end nodedescriptionblock

@nodedescriptionblock
D2
@end nodedescriptionblock

@node Subsec
@subsection Subsec

';


$result_texts{'test_insert_nodes_reallocated_nodedescriptionblock'} = 'top
***

1 Chap
******

1.1 Sec
=======


1.1.1 Subsec
------------

';

$result_errors{'test_insert_nodes_reallocated_nodedescriptionblock'} = '* W l12|multiple node @nodedescriptionblock
 warning: multiple node @nodedescriptionblock

';

$result_nodes_list{'test_insert_nodes_reallocated_nodedescriptionblock'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
3|Sec
 associated_section: 1.1 Sec
 node_long_description: @nodedescriptionblock
 node_directions:
  up->chap
4|Subsec
 associated_section: 1.1.1 Subsec
 node_directions:
  up->Sec
';

$result_sections_list{'test_insert_nodes_reallocated_nodedescriptionblock'} = '1|top
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
  1|Sec
3|Sec
 associated_node: Sec
 section_directions:
  up->Chap
 section_children:
  1|Subsec
4|Subsec
 associated_node: Subsec
 section_directions:
  up->Sec
';

$result_sectioning_root{'test_insert_nodes_reallocated_nodedescriptionblock'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_insert_nodes_reallocated_nodedescriptionblock'} = '';


$result_converted{'html'}->{'test_insert_nodes_reallocated_nodedescriptionblock'} = '<!DOCTYPE html>
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
Next: <a href="#chap" accesskey="n" rel="next">Chap</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#chap" accesskey="1">chap</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted"> &mdash; The Detailed Node Listing &mdash;

Chap

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#Sec" accesskey="2">Sec</a>:</td><td class="menu-entry-description">D1
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

Sec

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#Subsec" accesskey="3">Subsec</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="chapter-level-extent" id="chap">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#Sec" accesskey="1">Sec</a>:</td><td class="menu-entry-description">D1
</td></tr>
</table>
<hr>
<div class="section-level-extent" id="Sec">
<div class="nav-panel">
<p>
Up: <a href="#chap" accesskey="u" rel="up">Chap</a> &nbsp; </p>
</div>
<h4 class="node"><span>Sec<a class="copiable-link" href="#Sec"> &para;</a></span></h4>
<h3 class="section" id="Sec-1"><span>1.1 Sec<a class="copiable-link" href="#Sec-1"> &para;</a></span></h3>


<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#Subsec" accesskey="1">Subsec</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="subsection-level-extent" id="Subsec">
<div class="nav-panel">
<p>
Up: <a href="#Sec" accesskey="u" rel="up">Sec</a> &nbsp; </p>
</div>
<h4 class="node"><span>Subsec<a class="copiable-link" href="#Subsec"> &para;</a></span></h4>
<h4 class="subsection" id="Subsec-1"><span>1.1.1 Subsec<a class="copiable-link" href="#Subsec-1"> &para;</a></span></h4>

</div>
</div>
</div>
</div>



</body>
</html>
';


$result_converted{'info'}->{'test_insert_nodes_reallocated_nodedescriptionblock'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)

top
***

* Menu:

* chap::

 -- The Detailed Node Listing --

Chap

* Sec::                        D1

Sec

* Subsec::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 Chap
******

* Menu:

* Sec::                        D1


File: ,  Node: Sec,  Up: chap

1.1 Sec
=======

* Menu:

* Subsec::


File: ,  Node: Subsec,  Up: Sec

1.1.1 Subsec
------------


Tag Table:
Node: Top27
Node: chap194
Node: Sec298
Node: Subsec369

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
