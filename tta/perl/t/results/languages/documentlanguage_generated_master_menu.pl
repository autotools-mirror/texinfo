use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentlanguage_generated_master_menu'} = '*document_root C11
 *before_node_section C1
  *preamble_before_content C4
   *normal_command@documentlanguage C1 l1
   |global_command_number:{1}
   |text_arg:{pt}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:pt}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@documentlanguage C1 l3
   |global_command_number:{2}
   |text_arg:{de}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:de}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l5 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l6 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@part C2 l8 {Part I}
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Part I}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l11 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l13
  |global_command_number:{3}
  |text_arg:{fr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@part C2 l15 {Part II}
 |global_command_number:{2}
 |section_level:{0}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Part II}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l17 {other chap}
 |identifier:{other-chap}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:other chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l18 {Other chap}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Other chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l20
  |global_command_number:{4}
  |text_arg:{hr}
   *line_arg C3
    {spaces_before_argument:  }
    {normal_text:hr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l22 {appendix}
 |identifier:{appendix}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:appendix}
    {spaces_after_argument:\\n}
 *normal_command@appendix C1 l23 {App}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:App}
    {spaces_after_argument:\\n}
';


$result_texis{'documentlanguage_generated_master_menu'} = '@documentlanguage pt

@documentlanguage de

@node Top
@top top

@part Part I

@node chapter
@chapter Chap

@documentlanguage fr

@part Part II

@node other chap
@chapter Other chap

@documentlanguage  hr

@node appendix
@appendix App
';


$result_texts{'documentlanguage_generated_master_menu'} = '

top
***

Part I
******

1 Chap
******


Part II
*******

2 Other chap
************


Appendix A App
**************
';

$result_errors{'documentlanguage_generated_master_menu'} = '';

$result_nodes_list{'documentlanguage_generated_master_menu'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chap
 node_preceding_part: Part I
 associated_title_command: 1 Chap
 node_directions:
  next->other chap
  prev->Top
  up->Top
3|other chap
 associated_section: 2 Other chap
 node_preceding_part: Part II
 associated_title_command: 2 Other chap
 node_directions:
  next->appendix
  prev->chapter
  up->Top
4|appendix
 associated_section: A App
 associated_title_command: A App
 node_directions:
  prev->other chap
  up->Top
';

$result_sections_list{'documentlanguage_generated_master_menu'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->Part I
 toplevel_directions:
  next->Chap
2|Part I
 part_following_node: chapter
 part_associated_section: 1 Chap
 section_directions:
  next->Part II
  prev->top
 section_children:
  1|Chap
3|Chap
 associated_anchor_command: chapter
 associated_node: chapter
 associated_part: Part I
 section_directions:
  up->Part I
 toplevel_directions:
  next->Other chap
  prev->top
  up->top
4|Part II
 part_following_node: other chap
 part_associated_section: 2 Other chap
 section_directions:
  next->App
  prev->Part I
 section_children:
  1|Other chap
5|Other chap
 associated_anchor_command: other chap
 associated_node: other chap
 associated_part: Part II
 section_directions:
  up->Part II
 toplevel_directions:
  next->App
  prev->Chap
  up->top
6|App
 associated_anchor_command: appendix
 associated_node: appendix
 section_directions:
  prev->Part II
 toplevel_directions:
  prev->Other chap
  up->top
';

$result_sectioning_root{'documentlanguage_generated_master_menu'} = 'level: -1
list:
 1|top
 2|Part I
 3|Part II
 4|App
';

$result_headings_list{'documentlanguage_generated_master_menu'} = '';


$result_converted{'plaintext'}->{'documentlanguage_generated_master_menu'} = 'top
***

1 Chap
******

2 Other chap
************

Privitak A App
**************

';


$result_converted{'info'}->{'documentlanguage_generated_master_menu'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chapter,  Up: (dir)

top
***

* Menu:

Part: Part I

* chapter::

Part: Part II

* other chap::

Appendices

* appendix::


File: ,  Node: chapter,  Next: other chap,  Prev: Top,  Up: Top

1 Chap
******


File: ,  Node: other chap,  Next: appendix,  Prev: chapter,  Up: Top

2 Other chap
************


File: ,  Node: appendix,  Prev: other chap,  Up: Top

Privitak A App
**************


Tag Table:
Node: Top27
Node: chapter179
Node: other chap261
Node: appendix360

End Tag Table


Local Variables:
coding: utf-8
Info-documentlanguage: de
End:
');


$result_converted{'html'}->{'documentlanguage_generated_master_menu'} = '<!DOCTYPE html>
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

<body lang="de">


<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Nächste: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">Chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<hr>
</div>
<div class="part-level-extent" id="Part-I">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Nächste: </span><span class="nav-link"><a href="#other-chap" accesskey="n" rel="next">Other chap</a></span></span>, <span class="nav-button"><span class="nav-label">Vorige: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Nach oben: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="part"><span>Part I<a class="copiable-link" href="#Part-I"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">Chap</a></li>
</ul>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>


<hr>
</div>
</div>
<div class="part-level-extent" id="Part-II">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Suivant: </span><span class="nav-link"><a href="#appendix" accesskey="n" rel="next">App</a></span></span>, <span class="nav-button"><span class="nav-label">Pr&eacute;c&eacute;dent: </span><span class="nav-link"><a href="#chapter" accesskey="p" rel="prev">Chap</a></span></span>, <span class="nav-button"><span class="nav-label">Monter: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="part"><span>Part II<a class="copiable-link" href="#Part-II"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#other-chap" accesskey="1">Other chap</a></li>
</ul>
<div class="chapter-level-extent" id="other-chap">
<h2 class="chapter" id="Other-chap"><span>2 Other chap<a class="copiable-link" href="#Other-chap"> &para;</a></span></h2>


<hr>
</div>
<div class="appendix-level-extent" id="appendix">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Prethodno: </span><span class="nav-link"><a href="#other-chap" accesskey="p" rel="prev">Other chap</a></span></span>, <span class="nav-button"><span class="nav-label">Gore: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="appendix" id="App"><span>Annexe A App<a class="copiable-link" href="#App"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';

1;
