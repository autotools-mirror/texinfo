use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'menu_pointing_to_anchor_nodes'} = '*document_root C5
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C11 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Text\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l6
  |identifier:{An-anchor}
  |is_target:{1}
   *brace_arg C1
    {normal_text:An anchor}
  {spaces_after_close_brace:\\n}
  *normal_command@namedanchor C2 l7
  |identifier:{_0021Named_0021}
  |is_target:{1}
   *brace_arg C1
    {normal_text:!Named!}
   *brace_arg C2
    {spaces_before_argument: }
    {normal_text:named title}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *normal_command@menu C5 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{An-anchor}
     {normal_text:An anchor}
    {menu_entry_separator:::                }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:menu entry pointing to the anchor.\\n}
   *menu_entry C4 l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chap}
     {normal_text:chap}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l12
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{_0021Named_0021}
     {normal_text:!Named!}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l13
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l15 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l16 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'menu_pointing_to_anchor_nodes'} = '@node Top
@top top

Text

@anchor{An anchor}
@namedanchor{!Named!, named title}

@menu
* An anchor::                menu entry pointing to the anchor.
* chap::
* !Named!::
@end menu

@node chap
@chapter chap

';


$result_texts{'menu_pointing_to_anchor_nodes'} = 'top
***

Text


* An anchor::                menu entry pointing to the anchor.
* chap::
* !Named!::

1 chap
******

';

$result_errors{'menu_pointing_to_anchor_nodes'} = '';

$result_nodes_list{'menu_pointing_to_anchor_nodes'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  An anchor
  chap
  !Named!
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  next->!Named!
  prev->Top
  up->Top
';

$result_sections_list{'menu_pointing_to_anchor_nodes'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'menu_pointing_to_anchor_nodes'} = 'level: -1
list:
 1|top
';

$result_headings_list{'menu_pointing_to_anchor_nodes'} = '';


$result_converted{'plaintext'}->{'menu_pointing_to_anchor_nodes'} = 'top
***

Text

* Menu:

* An anchor::                menu entry pointing to the anchor.
* chap::
* !Named!::

1 chap
******

';


$result_converted{'html'}->{'menu_pointing_to_anchor_nodes'} = '<!DOCTYPE html>
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
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<p>Text
</p>
<a class="anchor" id="An-anchor"></a><a class="namedanchor" id="g_t_0021Named_0021"></a>
<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#An-anchor" accesskey="1">An anchor</a>:</td><td class="menu-entry-description">menu entry pointing to the anchor.
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#chap" accesskey="2">chap</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#g_t_0021Named_0021" accesskey="3">!Named!</a>:</td><td class="menu-entry-description">
</td></tr>
</table>

<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chap-1"><span>1 chap<a class="copiable-link" href="#chap-1"> &para;</a></span></h2>

</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'menu_pointing_to_anchor_nodes'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<para>Text
</para>
<anchor identifier="An-anchor">An anchor</anchor>
<namedanchor><anchoridentifier identifier="_0021Named_0021">!Named!</anchoridentifier><anchorname> named title</anchorname></namedanchor>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>An anchor</menunode><menuseparator>::                </menuseparator><menudescription><pre xml:space="preserve">menu entry pointing to the anchor.
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>chap</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>!Named!</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="chap"><nodename> chap</nodename><nodenext automatic="on">!Named!</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chap</sectiontitle>

</chapter>
';

1;
