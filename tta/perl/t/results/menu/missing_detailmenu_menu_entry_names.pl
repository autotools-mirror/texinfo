use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'missing_detailmenu_menu_entry_names'} = '*document_root C15
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
    {Top}
    {spaces_after_argument:\\n}
 *@top C4 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {text\\n}
  {empty_line:\\n}
 *@node C1 l6 {C1}
 |EXTRA
 |identifier:{C1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C1}
    {spaces_after_argument:\\n}
 *@chapter C4 l7 {C1}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{C1-Sec1}
     {C1 Sec1}
    {menu_entry_separator:::   }
    *menu_entry_description C1
     *preformatted C1
      {desc 1\\n}
   *menu_entry C4 l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{C1-Sec2}
     {C1 Sec2}
    {menu_entry_separator:::   }
    *menu_entry_description C1
     *preformatted C1
      {desc 2\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@end C1 l13
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l15 {C1 Sec1}
 |EXTRA
 |identifier:{C1-Sec1}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C1 Sec1}
    {spaces_after_argument:\\n}
 *@section C2 l16 {C1 Sec1}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C1 Sec1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l18 {C1 Sec2}
 |EXTRA
 |identifier:{C1-Sec2}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C1 Sec2}
    {spaces_after_argument:\\n}
 *@section C2 l19 {C1 Sec2}
 |EXTRA
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C1 Sec2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l21 {C2}
 |EXTRA
 |identifier:{C2}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C2}
    {spaces_after_argument:\\n}
 *@chapter C4 l22 {C2}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 l24
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C6 l25
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {Sec1}
    {menu_entry_separator:: }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{C2-Sec1}
     {C2 Sec1}
    {menu_entry_separator:.   }
    *menu_entry_description C1
     *preformatted C1
      {dont re-use this entry for master menu\\n}
   *menu_entry C4 l26
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{C2-Sec2}
     {C2 Sec2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@end C1 l28
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l30 {C2 Sec1}
 |EXTRA
 |identifier:{C2-Sec1}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C2 Sec1}
    {spaces_after_argument:\\n}
 *@section C2 l31 {C2 Sec1}
 |EXTRA
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C2 Sec1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l33 {C2 Sec2}
 |EXTRA
 |identifier:{C2-Sec2}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C2 Sec2}
    {spaces_after_argument:\\n}
 *@section C1 l34 {C2 Sec2}
 |EXTRA
 |section_heading_number:{2.2}
 |section_level:{2}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C2 Sec2}
    {spaces_after_argument:\\n}
';


$result_texis{'missing_detailmenu_menu_entry_names'} = '@node Top
@top top

text

@node C1
@chapter C1

@menu
* C1 Sec1::   desc 1
* C1 Sec2::   desc 2

@end menu

@node C1 Sec1
@section C1 Sec1

@node C1 Sec2
@section C1 Sec2

@node C2
@chapter C2

@menu
* Sec1: C2 Sec1.   dont re-use this entry for master menu
* C2 Sec2::

@end menu

@node C2 Sec1
@section C2 Sec1

@node C2 Sec2
@section C2 Sec2
';


$result_texts{'missing_detailmenu_menu_entry_names'} = 'top
***

text

1 C1
****

* C1 Sec1::   desc 1
* C1 Sec2::   desc 2


1.1 C1 Sec1
===========

1.2 C1 Sec2
===========

2 C2
****

* Sec1: C2 Sec1.   dont re-use this entry for master menu
* C2 Sec2::


2.1 C2 Sec1
===========

2.2 C2 Sec2
===========
';

$result_errors{'missing_detailmenu_menu_entry_names'} = '';

$result_nodes_list{'missing_detailmenu_menu_entry_names'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->C1
2|C1
 associated_section: 1 C1
 associated_title_command: 1 C1
 menus:
  C1 Sec1
  C1 Sec2
 node_directions:
  next->C2
  prev->Top
  up->Top
3|C1 Sec1
 associated_section: 1.1 C1 Sec1
 associated_title_command: 1.1 C1 Sec1
 node_directions:
  next->C1 Sec2
  up->C1
4|C1 Sec2
 associated_section: 1.2 C1 Sec2
 associated_title_command: 1.2 C1 Sec2
 node_directions:
  prev->C1 Sec1
  up->C1
5|C2
 associated_section: 2 C2
 associated_title_command: 2 C2
 menus:
  C2 Sec1
  C2 Sec2
 node_directions:
  prev->C1
  up->Top
6|C2 Sec1
 associated_section: 2.1 C2 Sec1
 associated_title_command: 2.1 C2 Sec1
 node_directions:
  next->C2 Sec2
  up->C2
7|C2 Sec2
 associated_section: 2.2 C2 Sec2
 associated_title_command: 2.2 C2 Sec2
 node_directions:
  prev->C2 Sec1
  up->C2
';

$result_sections_list{'missing_detailmenu_menu_entry_names'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->C1
 section_children:
  1|C1
  2|C2
2|C1
 associated_anchor_command: C1
 associated_node: C1
 section_directions:
  next->C2
  up->top
 toplevel_directions:
  next->C2
  prev->top
  up->top
 section_children:
  1|C1 Sec1
  2|C1 Sec2
3|C1 Sec1
 associated_anchor_command: C1 Sec1
 associated_node: C1 Sec1
 section_directions:
  next->C1 Sec2
  up->C1
4|C1 Sec2
 associated_anchor_command: C1 Sec2
 associated_node: C1 Sec2
 section_directions:
  prev->C1 Sec1
  up->C1
5|C2
 associated_anchor_command: C2
 associated_node: C2
 section_directions:
  prev->C1
  up->top
 toplevel_directions:
  prev->C1
  up->top
 section_children:
  1|C2 Sec1
  2|C2 Sec2
6|C2 Sec1
 associated_anchor_command: C2 Sec1
 associated_node: C2 Sec1
 section_directions:
  next->C2 Sec2
  up->C2
7|C2 Sec2
 associated_anchor_command: C2 Sec2
 associated_node: C2 Sec2
 section_directions:
  prev->C2 Sec1
  up->C2
';

$result_sectioning_root{'missing_detailmenu_menu_entry_names'} = 'level: -1
list:
 1|top
';

$result_headings_list{'missing_detailmenu_menu_entry_names'} = '';


$result_converted{'plaintext'}->{'missing_detailmenu_menu_entry_names'} = 'top
***

text

* Menu:

* C1::
* C2::

 -- The Detailed Node Listing --

C1

* C1 Sec1::   desc 1
* C1 Sec2::   desc 2

C2

* C2 Sec1::
* C2 Sec2::

1 C1
****

* Menu:

* C1 Sec1::   desc 1
* C1 Sec2::   desc 2

1.1 C1 Sec1
===========

1.2 C1 Sec2
===========

2 C2
****

* Menu:

* Sec1: C2 Sec1.   dont re-use this entry for master menu
* C2 Sec2::

2.1 C2 Sec1
===========

2.2 C2 Sec2
===========

';


$result_converted{'html'}->{'missing_detailmenu_menu_entry_names'} = '<!DOCTYPE html>
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#C1" accesskey="n" rel="next">C1</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<p>text
</p>
<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#C1" accesskey="1">C1</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#C2" accesskey="2">C2</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted"> &mdash; The Detailed Node Listing &mdash;

C1

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#C1-Sec1" accesskey="3">C1 Sec1</a>:</td><td class="menu-entry-description">desc 1
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#C1-Sec2" accesskey="4">C1 Sec2</a>:</td><td class="menu-entry-description">desc 2
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

C2

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#C2-Sec1" accesskey="5">C2 Sec1</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#C2-Sec2" accesskey="6">C2 Sec2</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="chapter-level-extent" id="C1">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#C2" accesskey="n" rel="next">C2</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="C1-1"><span>1 C1<a class="copiable-link" href="#C1-1"> &para;</a></span></h2>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#C1-Sec1" accesskey="1">C1 Sec1</a>:</td><td class="menu-entry-description">desc 1
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#C1-Sec2" accesskey="2">C1 Sec2</a>:</td><td class="menu-entry-description">desc 2
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr></table>

<hr>
<div class="section-level-extent" id="C1-Sec1">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#C1-Sec2" accesskey="n" rel="next">C1 Sec2</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#C1" accesskey="u" rel="up">C1</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="C1-Sec1-1"><span>1.1 C1 Sec1<a class="copiable-link" href="#C1-Sec1-1"> &para;</a></span></h3>

<hr>
</div>
<div class="section-level-extent" id="C1-Sec2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#C1-Sec1" accesskey="p" rel="prev">C1 Sec1</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#C1" accesskey="u" rel="up">C1</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="C1-Sec2-1"><span>1.2 C1 Sec2<a class="copiable-link" href="#C1-Sec2-1"> &para;</a></span></h3>

<hr>
</div>
</div>
<div class="chapter-level-extent" id="C2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#C1" accesskey="p" rel="prev">C1</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="C2-1"><span>2 C2<a class="copiable-link" href="#C2-1"> &para;</a></span></h2>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#C2-Sec1" accesskey="1">Sec1</a>:</td><td class="menu-entry-description">dont re-use this entry for master menu
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#C2-Sec2" accesskey="2">C2 Sec2</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr></table>

<hr>
<div class="section-level-extent" id="C2-Sec1">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#C2-Sec2" accesskey="n" rel="next">C2 Sec2</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#C2" accesskey="u" rel="up">C2</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="C2-Sec1-1"><span>2.1 C2 Sec1<a class="copiable-link" href="#C2-Sec1-1"> &para;</a></span></h3>

<hr>
</div>
<div class="section-level-extent" id="C2-Sec2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#C2-Sec1" accesskey="p" rel="prev">C2 Sec1</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#C2" accesskey="u" rel="up">C2</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="C2-Sec2-1"><span>2.2 C2 Sec2<a class="copiable-link" href="#C2-Sec2-1"> &para;</a></span></h3>
</div>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'missing_detailmenu_menu_entry_names'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> C1</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<para>text
</para>
</top>
<node identifier="C1"><nodename> C1</nodename><nodenext automatic="on"> C2</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> C1</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>C1 Sec1</menunode><menuseparator>::   </menuseparator><menudescription><pre xml:space="preserve">desc 1
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>C1 Sec2</menunode><menuseparator>::   </menuseparator><menudescription><pre xml:space="preserve">desc 2
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment></menu>

<node identifier="C1-Sec1"><nodename> C1 Sec1</nodename><nodenext automatic="on"> C1 Sec2</nodenext><nodeup automatic="on"> C1</nodeup></node>
<section><sectiontitle> C1 Sec1</sectiontitle>

</section>
<node identifier="C1-Sec2"><nodename> C1 Sec2</nodename><nodeprev automatic="on"> C1 Sec1</nodeprev><nodeup automatic="on"> C1</nodeup></node>
<section><sectiontitle> C1 Sec2</sectiontitle>

</section>
</chapter>
<node identifier="C2"><nodename> C2</nodename><nodeprev automatic="on"> C1</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> C2</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menutitle>Sec1</menutitle><menuseparator>: </menuseparator><menunode>C2 Sec1</menunode><menuseparator>.   </menuseparator><menudescription><pre xml:space="preserve">dont re-use this entry for master menu
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>C2 Sec2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment></menu>

<node identifier="C2-Sec1"><nodename> C2 Sec1</nodename><nodenext automatic="on"> C2 Sec2</nodenext><nodeup automatic="on"> C2</nodeup></node>
<section><sectiontitle> C2 Sec1</sectiontitle>

</section>
<node identifier="C2-Sec2"><nodename> C2 Sec2</nodename><nodeprev automatic="on"> C2 Sec1</nodeprev><nodeup automatic="on"> C2</nodeup></node>
<section><sectiontitle> C2 Sec2</sectiontitle>
</section>
</chapter>
';

1;
