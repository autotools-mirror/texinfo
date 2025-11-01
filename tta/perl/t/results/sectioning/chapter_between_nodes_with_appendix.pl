use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'chapter_between_nodes_with_appendix'} = '*document_root C6
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
 *@top C1 l2 {top section}
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
    {top section}
 *@chapter C5 l3 {Main}
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
    {Main}
  *paragraph C1
   {Top node\\n}
  {empty_line:\\n}
  *@menu C3 l6
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Additional}
    |normalized:{Additional}
     {Additional}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l8
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
 *@node C1 l10 {Additional}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Additional}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Additional}
 *@appendix C1 l11 {Annex}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Annex}
';


$result_texis{'chapter_between_nodes_with_appendix'} = '@node Top
@top top section
@chapter Main
Top node

@menu
* Additional::
@end menu

@node Additional
@appendix Annex
';


$result_texts{'chapter_between_nodes_with_appendix'} = 'top section
***********
1 Main
******
Top node

* Additional::

Appendix A Annex
****************
';

$result_errors{'chapter_between_nodes_with_appendix'} = '';

$result_nodes_list{'chapter_between_nodes_with_appendix'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 menus:
  Additional
 node_directions:
  next->Additional
2|Additional
 associated_section: A Annex
 associated_title_command: A Annex
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'chapter_between_nodes_with_appendix'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Main
 section_children:
  1|Main
  2|Annex
2|Main
 section_directions:
  next->Annex
  up->top section
 toplevel_directions:
  next->Annex
  prev->top section
  up->top section
3|Annex
 associated_anchor_command: Additional
 associated_node: Additional
 section_directions:
  prev->Main
  up->top section
 toplevel_directions:
  prev->Main
  up->top section
';

$result_sectioning_root{'chapter_between_nodes_with_appendix'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'chapter_between_nodes_with_appendix'} = '';


$result_converted{'info'}->{'chapter_between_nodes_with_appendix'} = 'This is , produced from .


File: ,  Node: Top,  Next: Additional,  Up: (dir)

top section
***********

* Menu:

Appendices

* Additional::

1 Main
******

Top node

* Menu:

* Additional::


File: ,  Node: Additional,  Prev: Top,  Up: Top

Appendix A Annex
****************


Tag Table:
Node: Top27
Node: Additional192

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'chapter_between_nodes_with_appendix'} = '<!DOCTYPE html>
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

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#Additional" accesskey="n" rel="next">Annex</a> &nbsp; </p>
</div>
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h1>
<ul class="mini-toc">
<li><a href="#Main" accesskey="1">Main</a></li>
<li><a href="#Additional" accesskey="2">Annex</a></li>
</ul>
<div class="chapter-level-extent" id="Main">
<h2 class="chapter"><span>1 Main<a class="copiable-link" href="#Main"> &para;</a></span></h2>
<p>Top node
</p>

<hr>
</div>
<div class="appendix-level-extent" id="Additional">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top section</a>, Up: <a href="#Top" accesskey="u" rel="up">top section</a> &nbsp; </p>
</div>
<h2 class="appendix" id="Annex"><span>Appendix A Annex<a class="copiable-link" href="#Annex"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';

1;
