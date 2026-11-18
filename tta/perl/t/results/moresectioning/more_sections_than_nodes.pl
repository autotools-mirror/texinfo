use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'more_sections_than_nodes'} = '*document_root C19
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
  *@menu C5 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{n-c2}
     {n c2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{n-c3}
     {n c3}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{n-c3-s1-s2}
     {n c3 s1 s2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l8
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@chapter C2 l10 {c1}
 |EXTRA
 |identifier:{c1}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {c1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l12 {n c2}
 |EXTRA
 |identifier:{n-c2}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {n c2}
    {spaces_after_argument:\\n}
 *@chapter C2 l13 {c2}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {c2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@section C2 l15 {s1}
 |EXTRA
 |identifier:{s1}
 |is_target:{1}
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {s1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l17 {n c3}
 |EXTRA
 |identifier:{n-c3}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {n c3}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{n-c3-s1-s2}
    {spaces_before_argument: }
    {n c3 s1 s2}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{n-c2}
    {spaces_before_argument: }
    {n c2}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@chapter C4 l18 {c3}
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {c3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l20
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *menu_entry C4 l21
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{n-c3-s-2}
     {n c3 s 2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l22
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@section C2 l24 {C3 s1}
 |EXTRA
 |identifier:{C3-s1}
 |is_target:{1}
 |section_heading_number:{3.1}
 |section_level:{2}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {C3 s1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l26 {n c3 s 2}
 |EXTRA
 |identifier:{n-c3-s-2}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {n c3 s 2}
    {spaces_after_argument:\\n}
 *@section C2 l27 {c3 s2}
 |EXTRA
 |section_heading_number:{3.2}
 |section_level:{2}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {c3 s2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@section C2 l29 {c3 s3}
 |EXTRA
 |identifier:{c3-s3}
 |is_target:{1}
 |section_heading_number:{3.3}
 |section_level:{2}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {c3 s3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@chapter C2 l31 {c4}
 |EXTRA
 |identifier:{c4}
 |is_target:{1}
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {c4}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@section C2 l33 {c3 s1}
 |EXTRA
 |identifier:{c3-s1}
 |is_target:{1}
 |section_heading_number:{4.1}
 |section_level:{2}
 |section_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {c3 s1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@subsection C2 l35 {c3 s1 s1}
 |EXTRA
 |identifier:{c3-s1-s1}
 |is_target:{1}
 |section_heading_number:{4.1.1}
 |section_level:{3}
 |section_number:{11}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {c3 s1 s1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l37 {n c3 s1 s2}
 |EXTRA
 |identifier:{n-c3-s1-s2}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {n c3 s1 s2}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{n-c3}
    {n c3}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {Top}
    {spaces_after_argument:\\n}
 *@subsection C2 l38 {c3 s1 s2}
 |EXTRA
 |section_heading_number:{4.1.2}
 |section_level:{3}
 |section_number:{12}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {c3 s1 s2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@appendix C1 l40 {appendix}
 |EXTRA
 |identifier:{appendix}
 |is_target:{1}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{13}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {appendix}
    {spaces_after_argument:\\n}
';


$result_texis{'more_sections_than_nodes'} = '@node Top
@top top

@menu
* n c2::
* n c3::
* n c3 s1 s2::
@end menu

@chapter c1

@node n c2
@chapter c2

@section s1

@node n c3, n c3 s1 s2, n c2, Top
@chapter c3

@menu 
* n c3 s 2::
@end menu

@section C3 s1

@node n c3 s 2
@section c3 s2

@section c3 s3

@chapter c4

@section c3 s1

@subsection c3 s1 s1

@node n c3 s1 s2,,n c3,Top
@subsection c3 s1 s2

@appendix appendix
';


$result_texts{'more_sections_than_nodes'} = 'top
***

* n c2::
* n c3::
* n c3 s1 s2::

1 c1
****

2 c2
****

2.1 s1
======

3 c3
****

* n c3 s 2::

3.1 C3 s1
=========

3.2 c3 s2
=========

3.3 c3 s3
=========

4 c4
****

4.1 c3 s1
=========

4.1.1 c3 s1 s1
--------------

4.1.2 c3 s1 s2
--------------

Appendix A appendix
*******************
';

$result_errors{'more_sections_than_nodes'} = '';

$result_nodes_list{'more_sections_than_nodes'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  n c2
  n c3
  n c3 s1 s2
 node_directions:
  next->n c2
2|n c2
 associated_section: 2 c2
 associated_title_command: 2 c2
 node_directions:
  next->n c3
  prev->Top
  up->Top
3|n c3
 associated_section: 3 c3
 associated_title_command: 3 c3
 menus:
  n c3 s 2
 node_directions:
  next->n c3 s1 s2
  prev->n c2
  up->Top
4|n c3 s 2
 associated_section: 3.2 c3 s2
 associated_title_command: 3.2 c3 s2
 node_directions:
  up->n c3
5|n c3 s1 s2
 associated_section: 4.1.2 c3 s1 s2
 associated_title_command: 4.1.2 c3 s1 s2
 node_directions:
  prev->n c3
  up->Top
';

$result_sections_list{'more_sections_than_nodes'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->c1
 section_children:
  1|c1
  2|c2
  3|c3
  4|c4
  5|appendix
2|c1
 section_directions:
  next->c2
  up->top
 toplevel_directions:
  next->c2
  prev->top
  up->top
3|c2
 associated_anchor_command: n c2
 associated_node: n c2
 section_directions:
  next->c3
  prev->c1
  up->top
 toplevel_directions:
  next->c3
  prev->c1
  up->top
 section_children:
  1|s1
4|s1
 section_directions:
  up->c2
5|c3
 associated_anchor_command: n c3
 associated_node: n c3
 section_directions:
  next->c4
  prev->c2
  up->top
 toplevel_directions:
  next->c4
  prev->c2
  up->top
 section_children:
  1|C3 s1
  2|c3 s2
  3|c3 s3
6|C3 s1
 section_directions:
  next->c3 s2
  up->c3
7|c3 s2
 associated_anchor_command: n c3 s 2
 associated_node: n c3 s 2
 section_directions:
  next->c3 s3
  prev->C3 s1
  up->c3
8|c3 s3
 section_directions:
  prev->c3 s2
  up->c3
9|c4
 section_directions:
  next->appendix
  prev->c3
  up->top
 toplevel_directions:
  next->appendix
  prev->c3
  up->top
 section_children:
  1|c3 s1
10|c3 s1
 section_directions:
  up->c4
 section_children:
  1|c3 s1 s1
  2|c3 s1 s2
11|c3 s1 s1
 section_directions:
  next->c3 s1 s2
  up->c3 s1
12|c3 s1 s2
 associated_anchor_command: n c3 s1 s2
 associated_node: n c3 s1 s2
 section_directions:
  prev->c3 s1 s1
  up->c3 s1
13|appendix
 section_directions:
  prev->c4
  up->top
 toplevel_directions:
  prev->c4
  up->top
';

$result_sectioning_root{'more_sections_than_nodes'} = 'level: -1
list:
 1|top
';

$result_headings_list{'more_sections_than_nodes'} = '';


$result_converted{'info'}->{'more_sections_than_nodes'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: n c2,  Up: (dir)

top
***

* Menu:

* n c2::
* n c3::
* n c3 s1 s2::

1 c1
****


File: ,  Node: n c2,  Next: n c3,  Prev: Top,  Up: Top

2 c2
****

2.1 s1
======


File: ,  Node: n c3,  Next: n c3 s1 s2,  Prev: n c2,  Up: Top

3 c3
****

* Menu:

* n c3 s 2::

3.1 C3 s1
=========


File: ,  Node: n c3 s 2,  Up: n c3

3.2 c3 s2
=========

3.3 c3 s3
=========

4 c4
****

4.1 c3 s1
=========

4.1.1 c3 s1 s1
--------------


File: ,  Node: n c3 s1 s2,  Prev: n c3,  Up: Top

4.1.2 c3 s1 s2
--------------

Appendix A appendix
*******************


Tag Table:
Node: Top27
Ref: c1126
Node: n c2137
Ref: s1206
Node: n c3221
Ref: C3 s1320
Node: n c3 s 2341
Ref: c3 s3400
Ref: c4421
Ref: c3 s1432
Ref: c3 s1 s1453
Node: n c3 s1 s2484
Ref: appendix567

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'more_sections_than_nodes'} = '<!DOCTYPE html>
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

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#n-c2" accesskey="n" rel="next">c2</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<ul class="mini-toc">
<li><a href="#c1" accesskey="1">c1</a></li>
<li><a href="#n-c2" accesskey="2">c2</a></li>
<li><a href="#n-c3" accesskey="3">c3</a></li>
<li><a href="#c4" accesskey="4">c4</a></li>
<li><a href="#appendix" accesskey="5">appendix</a></li>
</ul>
<div class="chapter-level-extent" id="c1">
<h2 class="chapter"><span>1 c1<a class="copiable-link" href="#c1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="n-c2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#n-c3" accesskey="n" rel="next">c3</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="c2"><span>2 c2<a class="copiable-link" href="#c2"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#s1" accesskey="1">s1</a></li>
</ul>
<div class="section-level-extent" id="s1">
<h3 class="section"><span>2.1 s1<a class="copiable-link" href="#s1"> &para;</a></span></h3>

<hr>
</div>
</div>
<div class="chapter-level-extent" id="n-c3">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#n-c3-s1-s2" accesskey="n" rel="next">c3 s1 s2</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#n-c2" accesskey="p" rel="prev">c2</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="c3"><span>3 c3<a class="copiable-link" href="#c3"> &para;</a></span></h2>


<ul class="mini-toc">
<li><a href="#C3-s1" accesskey="1">C3 s1</a></li>
<li><a href="#n-c3-s-2" accesskey="2">c3 s2</a></li>
<li><a href="#c3-s3" accesskey="3">c3 s3</a></li>
</ul>
<div class="section-level-extent" id="C3-s1">
<h3 class="section"><span>3.1 C3 s1<a class="copiable-link" href="#C3-s1"> &para;</a></span></h3>

<hr>
</div>
<div class="section-level-extent" id="n-c3-s-2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#n-c3" accesskey="u" rel="up">c3</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="c3-s2"><span>3.2 c3 s2<a class="copiable-link" href="#c3-s2"> &para;</a></span></h3>

</div>
<div class="section-level-extent" id="c3-s3">
<h3 class="section"><span>3.3 c3 s3<a class="copiable-link" href="#c3-s3"> &para;</a></span></h3>

</div>
</div>
<div class="chapter-level-extent" id="c4">
<h2 class="chapter"><span>4 c4<a class="copiable-link" href="#c4"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#c3-s1" accesskey="1">c3 s1</a></li>
</ul>
<div class="section-level-extent" id="c3-s1">
<h3 class="section"><span>4.1 c3 s1<a class="copiable-link" href="#c3-s1"> &para;</a></span></h3>

<ul class="mini-toc">
<li><a href="#c3-s1-s1" accesskey="1">c3 s1 s1</a></li>
<li><a href="#n-c3-s1-s2" accesskey="2">c3 s1 s2</a></li>
</ul>
<div class="subsection-level-extent" id="c3-s1-s1">
<h4 class="subsection"><span>4.1.1 c3 s1 s1<a class="copiable-link" href="#c3-s1-s1"> &para;</a></span></h4>

<hr>
</div>
<div class="subsection-level-extent" id="n-c3-s1-s2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#n-c3" accesskey="p" rel="prev">c3</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="subsection" id="c3-s1-s2"><span>4.1.2 c3 s1 s2<a class="copiable-link" href="#c3-s1-s2"> &para;</a></span></h4>

</div>
</div>
</div>
<div class="appendix-level-extent" id="appendix">
<h2 class="appendix"><span>Appendix A appendix<a class="copiable-link" href="#appendix"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'more_sections_than_nodes'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> n c2</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>n c2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>n c3</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>n c3 s1 s2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<chapter><sectiontitle> c1</sectiontitle>

</chapter>
<node identifier="n-c2"><nodename> n c2</nodename><nodenext automatic="on"> n c3</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> c2</sectiontitle>

<section><sectiontitle> s1</sectiontitle>

</section>
</chapter>
<node identifier="n-c3"><nodename> n c3</nodename><nodenext> n c3 s1 s2</nodenext><nodeprev> n c2</nodeprev><nodeup> Top</nodeup></node>
<chapter><sectiontitle> c3</sectiontitle>

<menu endspaces=" "> 
<menuentry><menuleadingtext>* </menuleadingtext><menunode>n c3 s 2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<section><sectiontitle> C3 s1</sectiontitle>

</section>
<node identifier="n-c3-s-2"><nodename> n c3 s 2</nodename><nodeup automatic="on"> n c3</nodeup></node>
<section><sectiontitle> c3 s2</sectiontitle>

</section>
<section><sectiontitle> c3 s3</sectiontitle>

</section>
</chapter>
<chapter><sectiontitle> c4</sectiontitle>

<section><sectiontitle> c3 s1</sectiontitle>

<subsection><sectiontitle> c3 s1 s1</sectiontitle>

</subsection>
<node identifier="n-c3-s1-s2"><nodename> n c3 s1 s2</nodename><nodenext></nodenext><nodeprev>n c3</nodeprev><nodeup>Top</nodeup></node>
<subsection><sectiontitle> c3 s1 s2</sectiontitle>

</subsection>
</section>
</chapter>
<appendix><sectiontitle> appendix</sectiontitle>
</appendix>
';

1;
