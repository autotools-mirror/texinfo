use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'headings_after_lone_nodes'} = '*document_root C13
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
 *@node C5 l7 {Qt}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Qt}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Qt}
  *@subheading C1 l8
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
    {heading Qt}
  {empty_line:\\n}
  *paragraph C1
   {Some text\\n}
  {empty_line:\\n}
 *@node C20 l12 {Other}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{Other}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Other}
  {empty_line:\\n}
  *@anchor C1 l14
  |EXTRA
  |is_target:{1}
  |normalized:{toto}
   *brace_arg C1
    {toto}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *@nodedescription C1 l16
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Describe Other}
  {empty_line:\\n}
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:comment}
  {empty_line:\\n}
  *@contents C1 l20
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *@frenchspacing C1 l22
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
  *@tex C3 l24
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *elided_rawpreformatted C1
    {raw:tex format raw\\n}
   *@end C1 l26
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{tex}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {tex}
  {empty_line:\\n}
  *@ignore C3 l28
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {raw:in ignore\\n}
   *@end C1 l30
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{ignore}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ignore}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*@iftex C3 l32
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
    >{raw:in iftex\\n}
    >*@end C1 l34
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{iftex}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{iftex}
  {empty_line:\\n}
  *@subsubheading C1 l36
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |heading_number:{2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Finally!}
  {empty_line:\\n}
 *@node C6 l38 {Not associated}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{Not-associated}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Not associated}
  {empty_line:\\n}
  *paragraph C1
   {Some para\\n}
  {empty_line:\\n}
  *@heading C1 l42
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |heading_number:{3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {should not be associated}
  {empty_line:\\n}
 *@node C6 l44 {2 not}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{2-not}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {2 not}
  {empty_line:\\n}
  *@quotation C3 l46
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {in quotation\\n}
   *@end C1 l48
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
  {empty_line:\\n}
  *@heading C1 l50
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |heading_number:{4}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {should not be associated}
  {empty_line:\\n}
 *@node C6 l52 {3 not}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{7}
 |normalized:{3-not}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {3 not}
  {empty_line:\\n}
  *@html C3 l54
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C1
    {in html\\n}
   *@end C1 l56
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{html}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {html}
  {empty_line:\\n}
  *@heading C1 l58
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{3}
  |heading_number:{5}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {should not be associated}
  {empty_line:\\n}
 *@node C6 l60 {4 not}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{8}
 |normalized:{4-not}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {4 not}
  {empty_line:\\n}
  *@sp C1 l62
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {2}
  {empty_line:\\n}
  *@heading C1 l64
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{4}
  |heading_number:{6}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {should not be associated}
  {empty_line:\\n}
 *@node C6 l66 {5 not}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{9}
 |normalized:{5-not}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {5 not}
  {empty_line:\\n}
  *@menu C3 l68
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l69
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{subnode}
    |normalized:{subnode}
     {subnode}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l70
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
  *@heading C1 l72
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{5}
  |heading_number:{7}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {should not be associated}
  {empty_line:\\n}
 *@node C2 l74 {subnode}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{10}
 |normalized:{subnode}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {subnode}
  {empty_line:\\n}
';


$result_texis{'headings_after_lone_nodes'} = '@node Top
@top top

@node chap
@chapter Chap

@node Qt
@subheading heading Qt

Some text

@node Other

@anchor{toto}

@nodedescription Describe Other

@c comment

@contents

@frenchspacing on

@tex
tex format raw
@end tex

@ignore
in ignore
@end ignore


@subsubheading Finally!

@node Not associated

Some para

@heading should not be associated

@node 2 not

@quotation
in quotation
@end quotation

@heading should not be associated

@node 3 not

@html
in html
@end html

@heading should not be associated

@node 4 not

@sp 2

@heading should not be associated

@node 5 not

@menu
* subnode::
@end menu

@heading should not be associated

@node subnode

';


$result_texts{'headings_after_lone_nodes'} = 'top
***

1 Chap
******

heading Qt
----------

Some text










Finally!
........


Some para

should not be associated
========================


in quotation

should not be associated
========================


in html

should not be associated
========================





should not be associated
========================


* subnode::

should not be associated
========================


';

$result_errors{'headings_after_lone_nodes'} = '';

$result_nodes_list{'headings_after_lone_nodes'} = '1|Top
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
3|Qt
 associated_title_command: @subheading heading Qt
4|Other
 associated_title_command: @subsubheading Finally!
 node_description: @nodedescription Describe Other
5|Not associated
 associated_title_command: @heading should not be associated
6|2 not
 associated_title_command: @heading should not be associated
7|3 not
 associated_title_command: @heading should not be associated
8|4 not
 associated_title_command: @heading should not be associated
9|5 not
 associated_title_command: @heading should not be associated
 menus:
  subnode
10|subnode
';

$result_sections_list{'headings_after_lone_nodes'} = '1|top
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
';

$result_sectioning_root{'headings_after_lone_nodes'} = 'level: -1
list:
 1|top
';

$result_headings_list{'headings_after_lone_nodes'} = '1|heading Qt
 associated_anchor_command: Qt
2|Finally!
 associated_anchor_command: Other
3|should not be associated
 associated_anchor_command: Not associated
4|should not be associated
 associated_anchor_command: 2 not
5|should not be associated
 associated_anchor_command: 3 not
6|should not be associated
 associated_anchor_command: 4 not
7|should not be associated
 associated_anchor_command: 5 not
';


$result_converted{'html'}->{'headings_after_lone_nodes'} = '<!DOCTYPE html>
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
<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chap" accesskey="n" rel="next">Chap</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">

<ul class="toc-numbered-mark">
  <li><a id="toc-Chap" href="#chap">1 Chap</a></li>
</ul>
</div>
</div>
<hr>
<div class="chapter-level-extent" id="chap">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<hr>
<a class="node" id="Qt"></a><div class="nav-panel">
<p>
[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h4 class="subheading" id="heading-Qt"><span>heading Qt<a class="copiable-link" href="#heading-Qt"> &para;</a></span></h4>

<p>Some text
</p>
<hr>
<a class="node" id="Other"></a><div class="nav-panel">
<p>
[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>

<a class="anchor" id="toto"></a>







<h4 class="subsubheading" id="Finally_0021"><span>Finally!<a class="copiable-link" href="#Finally_0021"> &para;</a></span></h4>

<hr>
<a class="node" id="Not-associated"></a><div class="nav-panel">
<p>
[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>

<p>Some para
</p>
<h3 class="heading" id="should-not-be-associated"><span>should not be associated<a class="copiable-link" href="#should-not-be-associated"> &para;</a></span></h3>

<hr>
<a class="node" id="g_t2-not"></a><div class="nav-panel">
<p>
[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>

<blockquote class="quotation">
<p>in quotation
</p></blockquote>

<h3 class="heading" id="should-not-be-associated-1"><span>should not be associated<a class="copiable-link" href="#should-not-be-associated-1"> &para;</a></span></h3>

<hr>
<a class="node" id="g_t3-not"></a><div class="nav-panel">
<p>
[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>

in html

<h3 class="heading" id="should-not-be-associated-2"><span>should not be associated<a class="copiable-link" href="#should-not-be-associated-2"> &para;</a></span></h3>

<hr>
<a class="node" id="g_t4-not"></a><div class="nav-panel">
<p>
[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>

<br>
<br>

<h3 class="heading" id="should-not-be-associated-3"><span>should not be associated<a class="copiable-link" href="#should-not-be-associated-3"> &para;</a></span></h3>

<hr>
<a class="node" id="g_t5-not"></a><div class="nav-panel">
<p>
[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>


<h3 class="heading" id="should-not-be-associated-4"><span>should not be associated<a class="copiable-link" href="#should-not-be-associated-4"> &para;</a></span></h3>

<hr>
<a class="node-id" id="subnode"></a><div class="nav-panel">
<p>
[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h4 class="node"><span>subnode<a class="copiable-link" href="#subnode"> &para;</a></span></h4>

</div>
</div>



</body>
</html>
';

1;
