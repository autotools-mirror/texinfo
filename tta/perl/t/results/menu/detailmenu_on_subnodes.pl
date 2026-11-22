use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'detailmenu_on_subnodes'} = '*document_root C13
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C4 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C8 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter-2}
     {normal_text:chapter 2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@detailmenu C3 l8
   |EXTRA
   |global_command_number:{1}
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_entry C4 l9
     {menu_entry_leading_text:* }
     *menu_entry_node C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{section}
      {normal_text:section}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {normal_text:\\n}
    *@end C1 l10
    |EXTRA
    |text_arg:{detailmenu}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:detailmenu}
      {spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C1
     {empty_line:\\n}
   *@detailmenu C5 l12
   |EXTRA
   |global_command_number:{2}
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_comment C1
     *preformatted C2
      {normal_text:Chap 2\\n}
      {empty_line:\\n}
    *menu_entry C4 l15
     {menu_entry_leading_text:* }
     *menu_entry_node C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{section-chap-2}
      {normal_text:section chap 2}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {normal_text:\\n}
    *menu_entry C4 l16
     {menu_entry_leading_text:* }
     *menu_entry_node C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{unnumberedsec}
      {normal_text:unnumberedsec}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {normal_text:\\n}
    *@end C1 l17
    |EXTRA
    |text_arg:{detailmenu}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:detailmenu}
      {spaces_after_argument:\\n}
   *@end C1 l18
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l20 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *@chapter C4 l21 {chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l23
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l24
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{section}
     {normal_text:section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l25
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l27 {section}
 |EXTRA
 |identifier:{section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
 *@section C2 l28 {section}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l30 {chapter 2}
 |EXTRA
 |identifier:{chapter-2}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter 2}
    {spaces_after_argument:\\n}
 *@chapter C4 l31 {chapter 2}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 l33
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l34
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{section-chap-2}
     {normal_text:section chap 2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l35
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{unnumberedsec}
     {normal_text:unnumberedsec}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l36
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l38 {section chap 2}
 |EXTRA
 |identifier:{section-chap-2}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section chap 2}
    {spaces_after_argument:\\n}
 *@section C2 l39 {section chap 2}
 |EXTRA
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section chap 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l41 {unnumberedsec}
 |EXTRA
 |identifier:{unnumberedsec}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumberedsec}
    {spaces_after_argument:\\n}
 *@unnumberedsec C1 l42 {unnumberedsec}
 |EXTRA
 |section_level:{2}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumberedsec}
    {spaces_after_argument:\\n}
';


$result_texis{'detailmenu_on_subnodes'} = '@node Top
@top top

@menu
* chapter::
* chapter 2::

@detailmenu
* section::
@end detailmenu

@detailmenu
Chap 2

* section chap 2::
* unnumberedsec::
@end detailmenu
@end menu

@node chapter
@chapter chapter

@menu
* section::
@end menu

@node section
@section section

@node chapter 2
@chapter chapter 2

@menu
* section chap 2::
* unnumberedsec::
@end menu

@node section chap 2
@section section chap 2

@node unnumberedsec
@unnumberedsec unnumberedsec
';


$result_texts{'detailmenu_on_subnodes'} = 'top
***

* chapter::
* chapter 2::

* section::

Chap 2

* section chap 2::
* unnumberedsec::

1 chapter
*********

* section::

1.1 section
===========

2 chapter 2
***********

* section chap 2::
* unnumberedsec::

2.1 section chap 2
==================

unnumberedsec
=============
';

$result_errors{'detailmenu_on_subnodes'} = '';

$result_nodes_list{'detailmenu_on_subnodes'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter
  chapter 2
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 menus:
  section
 node_directions:
  next->chapter 2
  prev->Top
  up->Top
3|section
 associated_section: 1.1 section
 associated_title_command: 1.1 section
 node_directions:
  up->chapter
4|chapter 2
 associated_section: 2 chapter 2
 associated_title_command: 2 chapter 2
 menus:
  section chap 2
  unnumberedsec
 node_directions:
  prev->chapter
  up->Top
5|section chap 2
 associated_section: 2.1 section chap 2
 associated_title_command: 2.1 section chap 2
 node_directions:
  next->unnumberedsec
  up->chapter 2
6|unnumberedsec
 associated_section: unnumberedsec
 associated_title_command: unnumberedsec
 node_directions:
  prev->section chap 2
  up->chapter 2
';

$result_sections_list{'detailmenu_on_subnodes'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
  2|chapter 2
2|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->chapter 2
  up->top
 toplevel_directions:
  next->chapter 2
  prev->top
  up->top
 section_children:
  1|section
3|section
 associated_anchor_command: section
 associated_node: section
 section_directions:
  up->chapter
4|chapter 2
 associated_anchor_command: chapter 2
 associated_node: chapter 2
 section_directions:
  prev->chapter
  up->top
 toplevel_directions:
  prev->chapter
  up->top
 section_children:
  1|section chap 2
  2|unnumberedsec
5|section chap 2
 associated_anchor_command: section chap 2
 associated_node: section chap 2
 section_directions:
  next->unnumberedsec
  up->chapter 2
6|unnumberedsec
 associated_anchor_command: unnumberedsec
 associated_node: unnumberedsec
 section_directions:
  prev->section chap 2
  up->chapter 2
';

$result_sectioning_root{'detailmenu_on_subnodes'} = 'level: -1
list:
 1|top
';

$result_headings_list{'detailmenu_on_subnodes'} = '';


$result_converted{'plaintext'}->{'detailmenu_on_subnodes'} = 'top
***

* Menu:

* chapter::
* chapter 2::

* section::

Chap 2

* section chap 2::
* unnumberedsec::

1 chapter
*********

* Menu:

* section::

1.1 section
===========

2 chapter 2
***********

* Menu:

* section chap 2::
* unnumberedsec::

2.1 section chap 2
==================

unnumberedsec
=============

';


$result_converted{'html'}->{'detailmenu_on_subnodes'} = '<!DOCTYPE html>
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

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#chapter" accesskey="1">chapter</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#chapter-2" accesskey="2">chapter 2</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#section" accesskey="3">section</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">Chap 2

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#section-chap-2" accesskey="4">section chap 2</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#unnumberedsec" accesskey="5">unnumberedsec</a>:</td><td class="menu-entry-description">
</td></tr>
</table>

<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter-2" accesskey="n" rel="next">chapter 2</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chapter-1"><span>1 chapter<a class="copiable-link" href="#chapter-1"> &para;</a></span></h2>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#section" accesskey="1">section</a>:</td><td class="menu-entry-description">
</td></tr>
</table>

<hr>
<div class="section-level-extent" id="section">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#chapter" accesskey="u" rel="up">chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="section-1"><span>1.1 section<a class="copiable-link" href="#section-1"> &para;</a></span></h3>

<hr>
</div>
</div>
<div class="chapter-level-extent" id="chapter-2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chapter" accesskey="p" rel="prev">chapter</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chapter-2-1"><span>2 chapter 2<a class="copiable-link" href="#chapter-2-1"> &para;</a></span></h2>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#section-chap-2" accesskey="1">section chap 2</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#unnumberedsec" accesskey="2">unnumberedsec</a>:</td><td class="menu-entry-description">
</td></tr>
</table>

<hr>
<div class="section-level-extent" id="section-chap-2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#unnumberedsec" accesskey="n" rel="next">unnumberedsec</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#chapter-2" accesskey="u" rel="up">chapter 2</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="section-chap-2-1"><span>2.1 section chap 2<a class="copiable-link" href="#section-chap-2-1"> &para;</a></span></h3>

<hr>
</div>
<div class="unnumberedsec-level-extent" id="unnumberedsec">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#section-chap-2" accesskey="p" rel="prev">section chap 2</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#chapter-2" accesskey="u" rel="up">chapter 2</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="unnumberedsec" id="unnumberedsec-1"><span>unnumberedsec<a class="copiable-link" href="#unnumberedsec-1"> &para;</a></span></h3>
</div>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'detailmenu_on_subnodes'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter 2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment><detailmenu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>section</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></detailmenu>
<menucomment><pre xml:space="preserve">
</pre></menucomment><detailmenu endspaces=" ">
<menucomment><pre xml:space="preserve">Chap 2

</pre></menucomment><menuentry><menuleadingtext>* </menuleadingtext><menunode>section chap 2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>unnumberedsec</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></detailmenu>
</menu>

</top>
<node identifier="chapter"><nodename> chapter</nodename><nodenext automatic="on"> chapter 2</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chapter</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>section</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="section"><nodename> section</nodename><nodeup automatic="on"> chapter</nodeup></node>
<section><sectiontitle> section</sectiontitle>

</section>
</chapter>
<node identifier="chapter-2"><nodename> chapter 2</nodename><nodeprev automatic="on"> chapter</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chapter 2</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>section chap 2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>unnumberedsec</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="section-chap-2"><nodename> section chap 2</nodename><nodenext automatic="on"> unnumberedsec</nodenext><nodeup automatic="on"> chapter 2</nodeup></node>
<section><sectiontitle> section chap 2</sectiontitle>

</section>
<node identifier="unnumberedsec"><nodename> unnumberedsec</nodename><nodeprev automatic="on"> section chap 2</nodeprev><nodeup automatic="on"> chapter 2</nodeup></node>
<unnumberedsec><sectiontitle> unnumberedsec</sectiontitle>
</unnumberedsec>
</chapter>
';

1;
