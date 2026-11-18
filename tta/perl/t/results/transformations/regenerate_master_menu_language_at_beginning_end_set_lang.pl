use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'regenerate_master_menu_language_at_beginning_end_set_lang'} = '*document_root C7
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo   @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C4
   *@documentlanguage C1 no_detailmenu_lang_at_begin_end.texi:l3
   |EXTRA
   |global_command_number:{1}
   |text_arg:{sr}
    *line_arg C3
     {spaces_before_argument: }
     {sr}
     {spaces_after_argument:\\n}
   *@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:test having an alias and not an ISO 4 letter script tag}
     {spaces_after_argument:\\n}
   *@documentscript C1 no_detailmenu_lang_at_begin_end.texi:l5
   |EXTRA
   |global_command_number:{1}
   |text_arg:{latin}
    *line_arg C3
     {spaces_before_argument: }
     {latin}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 no_detailmenu_lang_at_begin_end.texi:l7 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C4 no_detailmenu_lang_at_begin_end.texi:l8 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 no_detailmenu_lang_at_begin_end.texi:l10
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 no_detailmenu_lang_at_begin_end.texi:l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chap}
     {chap}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@detailmenu C4
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_comment C1
     *preformatted C6
      { --- Szczegółowa lista węzłów ---}
      {\\n}
      {empty_line:\\n}
      {Chapter}
      {empty_line:\\n}
      {empty_line:\\n}
    *menu_entry C4
     {menu_entry_leading_text:* }
     *menu_entry_node C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{sec}
      {sec}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {\\n}
    *@end C1
    |EXTRA
    |text_arg:{detailmenu}
     *line_arg C3
      {spaces_before_argument: }
      {detailmenu}
      {spaces_after_argument:\\n}
   *@end C1 no_detailmenu_lang_at_begin_end.texi:l12
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 no_detailmenu_lang_at_begin_end.texi:l14 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
 *@chapter C4 no_detailmenu_lang_at_begin_end.texi:l15 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 no_detailmenu_lang_at_begin_end.texi:l17
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 no_detailmenu_lang_at_begin_end.texi:l18
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{sec}
     {sec}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 no_detailmenu_lang_at_begin_end.texi:l19
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 no_detailmenu_lang_at_begin_end.texi:l21 {sec}
 |EXTRA
 |identifier:{sec}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {sec}
    {spaces_after_argument:\\n}
 *@section C4 no_detailmenu_lang_at_begin_end.texi:l22 {Sec}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Sec}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguage C1 no_detailmenu_lang_at_begin_end.texi:l24
  |EXTRA
  |global_command_number:{2}
  |text_arg:{fr}
   *line_arg C3
    {spaces_before_argument: }
    {fr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'regenerate_master_menu_language_at_beginning_end_set_lang'} = '\\input texinfo   @c -*-texinfo-*-

@documentlanguage sr
@c test having an alias and not an ISO 4 letter script tag
@documentscript latin

@node Top
@top top

@menu
* chap::

@detailmenu
 --- Szczegółowa lista węzłów ---

Chapter

* sec::
@end detailmenu
@end menu

@node chap
@chapter Chapter

@menu
* sec::
@end menu

@node sec
@section Sec

@documentlanguage fr

';


$result_texts{'regenerate_master_menu_language_at_beginning_end_set_lang'} = '
top
***

* chap::

 -- Szczegółowa lista węzłów --

Chapter

* sec::

1 Chapter
*********

* sec::

1.1 Sec
=======


';

$result_errors{'regenerate_master_menu_language_at_beginning_end_set_lang'} = '';

$result_nodes_list{'regenerate_master_menu_language_at_beginning_end_set_lang'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chap
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 menus:
  sec
 node_directions:
  prev->Top
  up->Top
3|sec
 associated_section: 1.1 Sec
 associated_title_command: 1.1 Sec
 node_directions:
  up->chap
';

$result_sections_list{'regenerate_master_menu_language_at_beginning_end_set_lang'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|Sec
3|Sec
 associated_anchor_command: sec
 associated_node: sec
 section_directions:
  up->Chapter
';

$result_sectioning_root{'regenerate_master_menu_language_at_beginning_end_set_lang'} = 'level: -1
list:
 1|top
';

$result_headings_list{'regenerate_master_menu_language_at_beginning_end_set_lang'} = '';


$result_converted{'html'}->{'regenerate_master_menu_language_at_beginning_end_set_lang'} = '<!DOCTYPE html>
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

<body lang="pl-Latn">

<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Następny: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">Chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#chap" accesskey="1">chap</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted"> &mdash; Szczegółowa lista węzłów &mdash;

Chapter

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#sec" accesskey="2">sec</a>:</td><td class="menu-entry-description">
</td></tr>
</table>

<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Poprzedni: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">W górę: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#sec" accesskey="1">sec</a>:</td><td class="menu-entry-description">
</td></tr>
</table>

<hr>
<div class="section-level-extent" id="sec">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">W górę: </span><span class="nav-link"><a href="#chap" accesskey="u" rel="up">Chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="Sec"><span>1.1 Sec<a class="copiable-link" href="#Sec"> &para;</a></span></h3>


</div>
</div>
</div>



</body>
</html>
';


$result_converted{'info'}->{'regenerate_master_menu_language_at_beginning_end_set_lang'} = Encode::encode('utf-8', 'This is , produced from no_detailmenu_lang_at_begin_end.texi.


File: ,  Node: Top,  Next: chap,  Up: (dir)

top
***

* Menu:

* chap::

 -- Szczegółowa lista węzłów --

Chapter

* sec::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 Chapter
*********

* Menu:

* sec::


File: ,  Node: sec,  Up: chap

1.1 Sec
=======


Tag Table:
Node: Top63
Node: chap194
Node: sec278

End Tag Table


Local Variables:
coding: utf-8
Info-documentlanguage: pl
Info-documentscript: latin
End:
');

1;
