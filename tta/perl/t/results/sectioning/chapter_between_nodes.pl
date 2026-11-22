use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'chapter_between_nodes'} = '*document_root C6
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
 *normal_command@top C5 l2 {top section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Top node\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{section-node}
     {normal_text:section node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l7
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C4 l9 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In chapter\\n}
  {empty_line:\\n}
 *normal_command@node C1 l13 {section node}
 |identifier:{section-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:section node}
   *line_arg
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@section C5 l14 {section}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:section.\\n}
  {empty_line:\\n}
  *normal_command@contents C1 l18
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'chapter_between_nodes'} = '@node Top
@top top section
Top node

@menu
* section node::
@end menu

@chapter Chapter

In chapter

@node section node,,,Top
@section section

section.

@contents
';


$result_texts{'chapter_between_nodes'} = 'top section
***********
Top node

* section node::

1 Chapter
*********

In chapter

1.1 section
===========

section.

';

$result_errors{'chapter_between_nodes'} = '';

$result_nodes_list{'chapter_between_nodes'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 menus:
  section node
 node_directions:
  next->section node
2|section node
 associated_section: 1.1 section
 associated_title_command: 1.1 section
 node_directions:
  up->Top
';

$result_sections_list{'chapter_between_nodes'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
 section_children:
  1|section
3|section
 associated_anchor_command: section node
 associated_node: section node
 section_directions:
  up->Chapter
';

$result_sectioning_root{'chapter_between_nodes'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'chapter_between_nodes'} = '';


$result_converted{'info'}->{'chapter_between_nodes'} = Encode::encode('utf-8', 'This is , produced from chapter_between_nodes.texi.


File: ,  Node: Top,  Next: section node,  Up: (dir)

top section
***********

Top node

* Menu:

* section node::

1 Chapter
*********

In chapter


File: ,  Node: section node,  Up: Top

1.1 section
===========

section.


Tag Table:
Node: Top53
Ref: Chapter170
Node: section node203

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'chapter_between_nodes'} = '<!DOCTYPE html>
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
<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#section-node" accesskey="n" rel="next">section</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h1>
<p>Top node
</p>

<ul class="mini-toc">
<li><a href="#Chapter" accesskey="1">Chapter</a></li>
</ul>
<div class="chapter-level-extent" id="Chapter">
<h2 class="chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<p>In chapter
</p>
<ul class="mini-toc">
<li><a href="#section-node" accesskey="1">section</a></li>
</ul>
<hr>
<div class="section-level-extent" id="section-node">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top section</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>
<h3 class="section" id="section"><span>1.1 section<a class="copiable-link" href="#section"> &para;</a></span></h3>

<p>section.
</p>
<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">

<ul class="toc-numbered-mark">
  <li><a id="toc-Chapter" href="#Chapter">1 Chapter</a>
  <ul class="toc-numbered-mark">
    <li><a id="toc-section" href="#section-node">1.1 section</a></li>
  </ul></li>
</ul>
</div>
</div>
</div>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'chapter_between_nodes'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> section node</nodenext></node>
<top><sectiontitle> top section</sectiontitle>
<para>Top node
</para>
<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>section node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<chapter><sectiontitle> Chapter</sectiontitle>

<para>In chapter
</para>
<node identifier="section-node"><nodename> section node</nodename><nodenext></nodenext><nodeprev></nodeprev><nodeup>Top</nodeup></node>
<section><sectiontitle> section</sectiontitle>

<para>section.
</para>
<contents></contents>
</section>
</chapter>
';


$result_converted{'docbook'}->{'chapter_between_nodes'} = '<sect1 label="1.1" id="section-node">
<title>section</title>

<para>section.
</para>
</sect1>
</chapter>
';


$result_converted{'latex_text'}->{'chapter_between_nodes'} = '\\begin{document}
\\label{anchor:Top}%
\\label{anchor:Chapter}%
\\section{{section}}
\\label{anchor:section-node}%

section.

\\tableofcontents\\newpage
';

1;
