use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_chapter_before_top_nodes'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {section node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{section-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {section node}
 *@section C2 l2 {section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
    {section}
  {empty_line:\\n}
 *@node C1 l4 {chapter node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chapter-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter node}
 *@chapter C4 l5 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
  {empty_line:\\n}
  *@menu C3 l7
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{section node}
    |normalized:{section-node}
     {section node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l9
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
 *@node C1 l11 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C4 l12 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
  *@menu C3 l14
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l15
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter node}
    |normalized:{chapter-node}
     {chapter node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l16
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
';


$result_texis{'section_chapter_before_top_nodes'} = '@node section node
@section section 

@node chapter node
@chapter chapter

@menu
* section node::
@end menu

@node Top
@top top

@menu
* chapter node::
@end menu

';


$result_texts{'section_chapter_before_top_nodes'} = '1 section
=========

2 chapter
=========

* section node::

top
===

* chapter node::

';

$result_errors{'section_chapter_before_top_nodes'} = '* W l5|lowering the section level of @chapter appearing after a lower element
 warning: lowering the section level of @chapter appearing after a lower element

* W l12|lowering the section level of @top appearing after a lower element
 warning: lowering the section level of @top appearing after a lower element

* W l8|node `section node\' in menu in `chapter node\' but not under it in sectioning
 warning: node `section node\' in menu in `chapter node\' but not under it in sectioning

* W l15|node `chapter node\' in menu in `Top\' but not under it in sectioning
 warning: node `chapter node\' in menu in `Top\' but not under it in sectioning

';

$result_nodes_list{'section_chapter_before_top_nodes'} = '1|section node
 associated_section: 1 section
 associated_title_command: 1 section
 node_directions:
  next->chapter node
  up->chapter node
2|chapter node
 associated_section: 2 chapter
 associated_title_command: 2 chapter
 menus:
  section node
 node_directions:
  next->Top
  prev->section node
  up->Top
3|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter node
 node_directions:
  next->chapter node
';

$result_sections_list{'section_chapter_before_top_nodes'} = '1|section
 associated_anchor_command: section node
 associated_node: section node
 section_directions:
  next->chapter
 toplevel_directions:
  next->chapter
2|chapter
 associated_anchor_command: chapter node
 associated_node: chapter node
 section_directions:
  next->top
  prev->section
 toplevel_directions:
  next->top
  prev->section
3|top
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  prev->chapter
 toplevel_directions:
  prev->chapter
';

$result_sectioning_root{'section_chapter_before_top_nodes'} = 'level: 1
list:
 1|section
 2|chapter
 3|top
';

$result_headings_list{'section_chapter_before_top_nodes'} = '';


$result_converted{'info'}->{'section_chapter_before_top_nodes'} = 'This is , produced from section_chapter_before_top_nodes.texi.


File: ,  Node: section node,  Next: chapter node,  Up: chapter node

1 section
=========


File: ,  Node: chapter node,  Next: Top,  Prev: section node,  Up: Top

2 chapter
=========

* Menu:

* section node::


File: ,  Node: Top,  Next: chapter node,  Up: (dir)

top
===

* Menu:

* chapter node::


Tag Table:
Node: section node64
Node: chapter node156
Node: Top278

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'section_chapter_before_top_nodes'} = '<!DOCTYPE html>
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

<body lang="">
<div class="section-level-extent" id="section-node">
<div class="nav-panel">
<p>
Next: <a href="#chapter-node" accesskey="n" rel="next">chapter</a>, Up: <a href="#chapter-node" accesskey="u" rel="up">chapter</a> &nbsp; </p>
</div>
<h3 class="section" id="section"><span>1 section<a class="copiable-link" href="#section"> &para;</a></span></h3>

<hr>
</div>
<div class="section-level-extent" id="chapter-node">
<div class="nav-panel">
<p>
Next: <a href="#Top" accesskey="n" rel="next">top</a>, Previous: <a href="#section-node" accesskey="p" rel="prev">section</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h3 class="section chapter-level-set-section" id="chapter"><span>2 chapter<a class="copiable-link" href="#chapter"> &para;</a></span></h3>


<hr>
</div>
<div class="unnumberedsec-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chapter-node" accesskey="n" rel="next">chapter</a> &nbsp; </p>
</div>
<h3 class="unnumberedsec top-level-set-unnumberedsec" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h3>


</div>



</body>
</html>
';


$result_converted{'docbook'}->{'section_chapter_before_top_nodes'} = '<sect1 label="1" id="section-node">
<title>section</title>

</sect1>
<sect1 label="2" id="chapter-node">
<title>chapter</title>


</sect1>
';


$result_converted{'latex_text'}->{'section_chapter_before_top_nodes'} = '\\begin{document}
\\section{{section}}
\\label{anchor:section-node}%

\\chapter{{chapter}}
\\label{anchor:chapter-node}%


\\label{anchor:Top}%
';

1;
