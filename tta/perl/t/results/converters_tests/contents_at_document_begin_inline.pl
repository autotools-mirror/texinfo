use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'contents_at_document_begin_inline'} = '*document_root C6
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@contents C1 contents_at_document_begin.texi:l3
   |EXTRA
   |global_command_number:{1}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 contents_at_document_begin.texi:l5 {Top}
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
 *@top C6 contents_at_document_begin.texi:l6 {Contents at beginning}
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
    {Contents at beginning}
  {empty_line:\\n}
  *paragraph C1
   {Content at the beginning.\\n}
  {empty_line:\\n}
  *@menu C3 contents_at_document_begin.texi:l10
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
   *menu_entry C4 contents_at_document_begin.texi:l11
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
   *@end C1 contents_at_document_begin.texi:l12
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
 *@node C1 contents_at_document_begin.texi:l14 {chapter}
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
 *@chapter C4 contents_at_document_begin.texi:l15 {Chapter 1}
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
    {Chapter 1}
  {empty_line:\\n}
  *paragraph C1
   {The chapter\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'contents_at_document_begin_inline'} = '\\input texinfo @c -*-texinfo-*-

@contents

@node Top
@top Contents at beginning

Content at the beginning.

@menu 
* chapter::
@end menu

@node chapter
@chapter Chapter 1

The chapter

@bye
';


$result_texts{'contents_at_document_begin_inline'} = '
Contents at beginning
*********************

Content at the beginning.

* chapter::

1 Chapter 1
***********

The chapter

';

$result_errors{'contents_at_document_begin_inline'} = '';

$result_nodes_list{'contents_at_document_begin_inline'} = '1|Top
 associated_section: Contents at beginning
 associated_title_command: Contents at beginning
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chapter 1
 associated_title_command: 1 Chapter 1
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'contents_at_document_begin_inline'} = '1|Contents at beginning
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter 1
 section_children:
  1|Chapter 1
2|Chapter 1
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->Contents at beginning
 toplevel_directions:
  prev->Contents at beginning
  up->Contents at beginning
';

$result_sectioning_root{'contents_at_document_begin_inline'} = 'level: -1
list:
 1|Contents at beginning
';

$result_headings_list{'contents_at_document_begin_inline'} = '';


$result_converted{'plaintext'}->{'contents_at_document_begin_inline'} = 'Contents at beginning
1 Chapter 1

Contents at beginning
*********************

Content at the beginning.

1 Chapter 1
***********

The chapter

';


$result_converted{'html'}->{'contents_at_document_begin_inline'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Contents at beginning</title>

<meta name="description" content="Contents at beginning">
<meta name="keywords" content="Contents at beginning">
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

<body lang="">
<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">

<ul class="toc-numbered-mark">
  <li><a id="toc-Chapter-1" href="#chapter">1 Chapter 1</a></li>
</ul>
</div>
</div>

<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chapter" rel="next">Chapter 1</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h1 class="top" id="Contents-at-beginning"><span>Contents at beginning<a class="copiable-link" href="#Contents-at-beginning"> &para;</a></span></h1>

<p>Content at the beginning.
</p>

<ul class="mini-toc">
<li><a href="#chapter">Chapter 1</a></li>
</ul>
<hr style="height: 6px;">
<div class="chapter-level-extent" id="chapter">
<div class="nav-panel">
<p>
Previous: <a href="#Top" rel="prev">Contents at beginning</a>, Up: <a href="#Top" rel="up">Contents at beginning</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h2 class="chapter" id="Chapter-1"><span>1 Chapter 1<a class="copiable-link" href="#Chapter-1"> &para;</a></span></h2>

<p>The chapter
</p>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'contents_at_document_begin_inline'} = '<preamblebeforebeginning>\\input texinfo @c -*-texinfo-*-

</preamblebeforebeginning><contents></contents>

<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chapter</nodenext></node>
<top spaces=" "><sectiontitle>Contents at beginning</sectiontitle>

<para>Content at the beginning.
</para>
<menu endspaces=" "> 
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="chapter" spaces=" "><nodename>chapter</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chapter 1</sectiontitle>

<para>The chapter
</para>
</chapter>
<bye></bye>
';


$result_converted{'docbook'}->{'contents_at_document_begin_inline'} = '<chapter label="1" id="chapter">
<title>Chapter 1</title>

<para>The chapter
</para>
</chapter>
';


$result_converted{'latex_text'}->{'contents_at_document_begin_inline'} = '\\tableofcontents\\newpage

\\begin{document}
\\label{anchor:Top}%
\\chapter{{Chapter 1}}
\\label{anchor:chapter}%

The chapter

';


$result_converted{'info'}->{'contents_at_document_begin_inline'} = 'This is , produced from contents_at_document_begin.texi.


File: ,  Node: Top,  Next: chapter,  Up: (dir)

Contents at beginning
*********************

Content at the beginning.

* Menu:

* chapter::


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 Chapter 1
***********

The chapter


Tag Table:
Node: Top58
Node: chapter202

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
