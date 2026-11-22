use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'recursive_down_menu'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chapN}
 |EXTRA
 |identifier:{chapN}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapN}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l5 {Intro}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Intro}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapN}
     {normal_text:chapN}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l9
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'recursive_down_menu'} = '@node Top
@top top

@node chapN
@chapter Intro

@menu
* chapN::
@end menu
';


$result_texts{'recursive_down_menu'} = 'top
***

1 Intro
*******

* chapN::
';

$result_errors{'recursive_down_menu'} = '* W l8|node `chapN\' in menu in `chapN\' but under `Top\' in sectioning
 warning: node `chapN\' in menu in `chapN\' but under `Top\' in sectioning

';

$result_nodes_list{'recursive_down_menu'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapN
2|chapN
 associated_section: 1 Intro
 associated_title_command: 1 Intro
 menus:
  chapN
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'recursive_down_menu'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Intro
 section_children:
  1|Intro
2|Intro
 associated_anchor_command: chapN
 associated_node: chapN
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'recursive_down_menu'} = 'level: -1
list:
 1|top
';

$result_headings_list{'recursive_down_menu'} = '';


$result_converted{'html'}->{'recursive_down_menu'} = '<!DOCTYPE html>
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapN" accesskey="n" rel="next">Intro</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#chapN" accesskey="1">chapN</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted"> &mdash; The Detailed Node Listing &mdash;

Intro

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#chapN" accesskey="2">chapN</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="chapter-level-extent" id="chapN">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Intro"><span>1 Intro<a class="copiable-link" href="#Intro"> &para;</a></span></h2>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#chapN" accesskey="1">chapN</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
</div>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'recursive_down_menu'} = '* W l4|node `chapN\' appears in its own menus
 warning: node `chapN\' appears in its own menus

';


$result_converted{'info'}->{'recursive_down_menu'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chapN,  Up: (dir)

top
***

* Menu:

* chapN::

 -- The Detailed Node Listing --

Intro

* chapN::


File: ,  Node: chapN,  Prev: Top,  Up: Top

1 Intro
*******

* Menu:

* chapN::


Tag Table:
Node: Top27
Node: chapN156

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'recursive_down_menu'} = '* W l4|node `chapN\' appears in its own menus
 warning: node `chapN\' appears in its own menus

';

1;
