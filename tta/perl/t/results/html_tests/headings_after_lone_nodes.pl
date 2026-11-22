use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'headings_after_lone_nodes'} = '*document_root C13
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
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l5 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C5 l7 {Qt}
 |identifier:{Qt}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Qt}
    {spaces_after_argument:\\n}
  *normal_command@subheading C1 l8
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:heading Qt}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Some text\\n}
  {empty_line:\\n}
 *normal_command@node C20 l12 {Other}
 |identifier:{Other}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Other}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l14
  |identifier:{toto}
  |is_target:{1}
   *brace_arg C1
    {normal_text:toto}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *normal_command@nodedescription C1 l16
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Describe Other}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:comment}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@contents C1 l20
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@frenchspacing C1 l22
  |global_command_number:{1}
  |misc_args:A{on}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:on}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@tex C3 l24
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *elided_rawpreformatted C1
    {raw:tex format raw\\n}
   *normal_command@end C1 l26
   |text_arg:{tex}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:tex}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@ignore C3 l28
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:in ignore\\n}
   *normal_command@end C1 l30
   |text_arg:{ignore}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ignore}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*normal_command@iftex C3 l32
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
    >{raw:in iftex\\n}
    >*normal_command@end C1 l34
    >|text_arg:{iftex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:iftex}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@subsubheading C1 l36
  |global_command_number:{1}
  |heading_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Finally!}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C6 l38 {Not associated}
 |identifier:{Not-associated}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Not associated}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Some para\\n}
  {empty_line:\\n}
  *normal_command@heading C1 l42
  |global_command_number:{1}
  |heading_number:{3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:should not be associated}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C6 l44 {2 not}
 |identifier:{2-not}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:2 not}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l46
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:in quotation\\n}
   *normal_command@end C1 l48
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@heading C1 l50
  |global_command_number:{2}
  |heading_number:{4}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:should not be associated}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C6 l52 {3 not}
 |identifier:{3-not}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:3 not}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@html C3 l54
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *rawpreformatted C1
    {normal_text:in html\\n}
   *normal_command@end C1 l56
   |text_arg:{html}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:html}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@heading C1 l58
  |global_command_number:{3}
  |heading_number:{5}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:should not be associated}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C6 l60 {4 not}
 |identifier:{4-not}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:4 not}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@sp C1 l62
  |misc_args:A{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@heading C1 l64
  |global_command_number:{4}
  |heading_number:{6}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:should not be associated}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C6 l66 {5 not}
 |identifier:{5-not}
 |is_target:{1}
 |node_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:5 not}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l68
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l69
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{subnode}
     {normal_text:subnode}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l70
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@heading C1 l72
  |global_command_number:{5}
  |heading_number:{7}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:should not be associated}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C2 l74 {subnode}
 |identifier:{subnode}
 |is_target:{1}
 |node_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subnode}
    {spaces_after_argument:\\n}
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
 node_descriptions:
  @nodedescription Describe Other
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

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">Chap</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>
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
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<hr>
<a class="node" id="Qt"></a><p class="nav-panel">
<span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>
<h4 class="subheading" id="heading-Qt"><span>heading Qt<a class="copiable-link" href="#heading-Qt"> &para;</a></span></h4>

<p>Some text
</p>
<hr>
<a class="node" id="Other"></a><p class="nav-panel">
<span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>

<a class="anchor" id="toto"></a>







<h4 class="subsubheading" id="Finally_0021"><span>Finally!<a class="copiable-link" href="#Finally_0021"> &para;</a></span></h4>

<hr>
<a class="node" id="Not-associated"></a><p class="nav-panel">
<span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>

<p>Some para
</p>
<h3 class="heading" id="should-not-be-associated"><span>should not be associated<a class="copiable-link" href="#should-not-be-associated"> &para;</a></span></h3>

<hr>
<a class="node" id="g_t2-not"></a><p class="nav-panel">
<span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>

<blockquote class="quotation">
<p>in quotation
</p></blockquote>

<h3 class="heading" id="should-not-be-associated-1"><span>should not be associated<a class="copiable-link" href="#should-not-be-associated-1"> &para;</a></span></h3>

<hr>
<a class="node" id="g_t3-not"></a><p class="nav-panel">
<span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>

in html

<h3 class="heading" id="should-not-be-associated-2"><span>should not be associated<a class="copiable-link" href="#should-not-be-associated-2"> &para;</a></span></h3>

<hr>
<a class="node" id="g_t4-not"></a><p class="nav-panel">
<span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>

<br>
<br>

<h3 class="heading" id="should-not-be-associated-3"><span>should not be associated<a class="copiable-link" href="#should-not-be-associated-3"> &para;</a></span></h3>

<hr>
<a class="node" id="g_t5-not"></a><p class="nav-panel">
<span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>


<h3 class="heading" id="should-not-be-associated-4"><span>should not be associated<a class="copiable-link" href="#should-not-be-associated-4"> &para;</a></span></h3>

<hr>
<a class="node-id" id="subnode"></a><p class="nav-panel">
<span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>
<h4 class="node"><span>subnode<a class="copiable-link" href="#subnode"> &para;</a></span></h4>

</div>
</div>



</body>
</html>
';

1;
