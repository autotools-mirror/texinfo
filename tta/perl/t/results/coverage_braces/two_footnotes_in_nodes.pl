use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'two_footnotes_in_nodes'} = '*document_root C5
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
 *@top C8 l2 {2 footnotes in 2 nodes}
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
    {2 footnotes in 2 nodes}
  {empty_line:\\n}
  *paragraph C3
   {A}
   *@footnote C1 l4
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C3
     *paragraph C1
      {Footnote Top/1\\n}
     {empty_line:\\n}
     *paragraph C1
      {para2}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {B}
   *@footnote C1 l8
   |EXTRA
   |global_command_number:{2}
    *brace_command_context C3
     *paragraph C1
      {Footnote Top/2\\n}
     {empty_line:\\n}
     *paragraph C1
      {para2}
   {\\n}
  {empty_line:\\n}
  *@menu C3 l12
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l13
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter}
    |normalized:{chapter}
     {chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l14
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
 *@node C1 l16 {chapter}
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
 *@chapter C6 l17 {chapter}
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
    {chapter}
  {empty_line:\\n}
  *paragraph C3
   {C}
   *@footnote C1 l19
   |EXTRA
   |global_command_number:{3}
    *brace_command_context C3
     *paragraph C1
      {Footnote chapter/1\\n}
     {empty_line:\\n}
     *paragraph C1
      {para2}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {D}
   *@footnote C1 l23
   |EXTRA
   |global_command_number:{4}
    *brace_command_context C3
     *paragraph C1
      {Footnote chapter/2\\n}
     {empty_line:\\n}
     *paragraph C1
      {para2}
   {\\n}
  {empty_line:\\n}
';


$result_texis{'two_footnotes_in_nodes'} = '@node Top
@top 2 footnotes in 2 nodes

A@footnote{Footnote Top/1

para2}

B@footnote{Footnote Top/2

para2}

@menu
* chapter::
@end menu

@node chapter
@chapter chapter

C@footnote{Footnote chapter/1

para2}

D@footnote{Footnote chapter/2

para2}

';


$result_texts{'two_footnotes_in_nodes'} = '2 footnotes in 2 nodes
**********************

A

B

* chapter::

1 chapter
*********

C

D

';

$result_errors{'two_footnotes_in_nodes'} = '';

$result_nodes_list{'two_footnotes_in_nodes'} = '1|Top
 associated_section: 2 footnotes in 2 nodes
 associated_title_command: 2 footnotes in 2 nodes
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'two_footnotes_in_nodes'} = '1|2 footnotes in 2 nodes
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->2 footnotes in 2 nodes
 toplevel_directions:
  prev->2 footnotes in 2 nodes
  up->2 footnotes in 2 nodes
';

$result_sectioning_root{'two_footnotes_in_nodes'} = 'level: -1
list:
 1|2 footnotes in 2 nodes
';

$result_headings_list{'two_footnotes_in_nodes'} = '';


$result_converted{'html'}->{'two_footnotes_in_nodes'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>2 footnotes in 2 nodes</title>

<meta name="description" content="2 footnotes in 2 nodes">
<meta name="keywords" content="2 footnotes in 2 nodes">
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
Next: <a href="#chapter" accesskey="n" rel="next">chapter</a> &nbsp; </p>
</div>
<h1 class="top" id="g_t2-footnotes-in-2-nodes"><span>2 footnotes in 2 nodes<a class="copiable-link" href="#g_t2-footnotes-in-2-nodes"> &para;</a></span></h1>

<p>A<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>
</p>
<p>B<a class="footnote" id="DOCF2" href="#FOOT2"><sup>2</sup></a>
</p>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">2 footnotes in 2 nodes</a>, Up: <a href="#Top" accesskey="u" rel="up">2 footnotes in 2 nodes</a> &nbsp; </p>
</div>
<h2 class="chapter" id="chapter-1"><span>1 chapter<a class="copiable-link" href="#chapter-1"> &para;</a></span></h2>

<p>C<a class="footnote" id="DOCF3" href="#FOOT3"><sup>3</sup></a>
</p>
<p>D<a class="footnote" id="DOCF4" href="#FOOT4"><sup>4</sup></a>
</p>
</div>
</div>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>Footnote Top/1
</p>
<p>para2</p>
<h5 class="footnote-body-heading"><a id="FOOT2" href="#DOCF2">(2)</a></h5>
<p>Footnote Top/2
</p>
<p>para2</p>
<h5 class="footnote-body-heading"><a id="FOOT3" href="#DOCF3">(3)</a></h5>
<p>Footnote chapter/1
</p>
<p>para2</p>
<h5 class="footnote-body-heading"><a id="FOOT4" href="#DOCF4">(4)</a></h5>
<p>Footnote chapter/2
</p>
<p>para2</p>
</div>



</body>
</html>
';


$result_converted{'info'}->{'two_footnotes_in_nodes'} = 'This is , produced from .


File: ,  Node: Top,  Next: chapter,  Up: (dir)

2 footnotes in 2 nodes
**********************

A(1)

   B(2)

* Menu:

* chapter::

   ---------- Footnotes ----------

   (1) Footnote Top/1

   para2

   (2) Footnote Top/2

   para2


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 chapter
*********

C(1)

   D(2)

   ---------- Footnotes ----------

   (1) Footnote chapter/1

   para2

   (2) Footnote chapter/2

   para2


Tag Table:
Node: Top27
Ref: Top-Footnote-1197
Ref: Top-Footnote-2230
Node: chapter263
Ref: chapter-Footnote-1383
Ref: chapter-Footnote-2420

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'two_footnotes_in_nodes'} = '2 footnotes in 2 nodes
**********************

A(1)

   B(2)

   ---------- Footnotes ----------

   (1) Footnote Top/1

   para2

   (2) Footnote Top/2

   para2

1 chapter
*********

C(1)

   D(2)

   ---------- Footnotes ----------

   (1) Footnote chapter/1

   para2

   (2) Footnote chapter/2

   para2

';


$result_converted{'latex_text'}->{'two_footnotes_in_nodes'} = '\\begin{document}
\\label{anchor:Top}%
\\chapter{{chapter}}
\\label{anchor:chapter}%

C\\footnote{Footnote chapter/1

para2}

D\\footnote{Footnote chapter/2

para2}

';


$result_converted{'docbook'}->{'two_footnotes_in_nodes'} = '<chapter label="1" id="chapter">
<title>chapter</title>

<para>C<footnote><para>Footnote chapter/1
</para>
<para>para2</para></footnote>
</para>
<para>D<footnote><para>Footnote chapter/2
</para>
<para>para2</para></footnote>
</para>
</chapter>
';

1;
