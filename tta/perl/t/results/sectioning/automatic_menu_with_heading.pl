use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'automatic_menu_with_heading'} = '*document_root C5
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
 *@top C6 l2 {top}
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
  *@xrefautomaticsectiontitle C1 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{on}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {on}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l6
    *brace_arg C1
    |EXTRA
    |node_content:{heading or chapter}
    |normalized:{heading-or-chapter}
     {heading or chapter}
   {.\\n}
  {empty_line:\\n}
 *@node C3 l8 {heading or chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{heading-or-chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {heading or chapter}
  *@heading C1 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Heading}
  {empty_line:\\n}
 *@chapter C2 l11 {Chapter}
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
    {Chapter}
  {empty_line:\\n}
';


$result_texis{'automatic_menu_with_heading'} = '@node Top
@top top

@xrefautomaticsectiontitle on

@xref{heading or chapter}.

@node heading or chapter
@heading Heading

@chapter Chapter

';


$result_texts{'automatic_menu_with_heading'} = 'top
***


heading or chapter.

Heading
=======

1 Chapter
*********

';

$result_errors{'automatic_menu_with_heading'} = '';

$result_nodes_list{'automatic_menu_with_heading'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->heading or chapter
2|heading or chapter
 associated_section: 1 Chapter
 associated_title_command: @heading Heading
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'automatic_menu_with_heading'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_node: heading or chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'automatic_menu_with_heading'} = 'level: -1
list:
 1|top
';

$result_headings_list{'automatic_menu_with_heading'} = '1|Heading
 associated_anchor_command: heading or chapter
';


$result_converted{'info'}->{'automatic_menu_with_heading'} = 'This is , produced from .


File: ,  Node: Top,  Next: heading or chapter,  Up: (dir)

top
***

*Note heading or chapter::.

* Menu:

* heading or chapter::


File: ,  Node: heading or chapter,  Prev: Top,  Up: Top

Heading
=======

1 Chapter
*********


Tag Table:
Node: Top27
Node: heading or chapter159

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'automatic_menu_with_heading'} = '<!DOCTYPE html>
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
Next: <a href="#heading-or-chapter" accesskey="n" rel="next">Chapter</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<p>See <a class="xref" href="#heading-or-chapter">Heading</a>.
</p>
<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#heading-or-chapter" accesskey="1">heading or chapter</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="chapter-level-extent" id="heading-or-chapter">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h3 class="heading" id="Heading"><span>Heading<a class="copiable-link" href="#Heading"> &para;</a></span></h3>

<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

</div>
</div>



</body>
</html>
';

1;
