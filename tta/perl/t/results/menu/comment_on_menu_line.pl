use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comment_on_menu_line'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C4 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l3
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument:  }
     *normal_command@c C1
      *line_arg C2
       {rawline_text:}
       {spaces_after_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{first}
     {normal_text:first}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l5
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C1 l7 {first}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l8 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
';


$result_texis{'comment_on_menu_line'} = '@node Top

@menu  @c
* first::
@end menu

@chapter first
@node first
';


$result_texts{'comment_on_menu_line'} = '
* first::

1 first
*******
';

$result_errors{'comment_on_menu_line'} = '';

$result_nodes_list{'comment_on_menu_line'} = '1|Top
 associated_section: 1 first
 associated_title_command: 1 first
 menus:
  first
 node_directions:
  next->first
2|first
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'comment_on_menu_line'} = '1|first
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'comment_on_menu_line'} = 'level: 0
list:
 1|first
';

$result_headings_list{'comment_on_menu_line'} = '';


$result_converted{'plaintext'}->{'comment_on_menu_line'} = '* Menu:

* first::

1 first
*******

';


$result_converted{'html'}->{'comment_on_menu_line'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
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
<div class="chapter-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#first" accesskey="n" rel="next">first</a></span></span><span class="nav-button"> &nbsp; </span></p>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#first" accesskey="1">first</a>:</td><td class="menu-entry-description">
</td></tr>
</table>

<h2 class="chapter" id="first-1"><span>1 first<a class="copiable-link" href="#first-1"> &para;</a></span></h2>
<hr>
<a class="node-id" id="first"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">first</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">first</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>first<a class="copiable-link" href="#first"> &para;</a></span></h4>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'comment_on_menu_line'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'comment_on_menu_line'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> first</nodenext></node>

<menu endspaces=" ">  <!-- c -->
<menuentry><menuleadingtext>* </menuleadingtext><menunode>first</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<chapter><sectiontitle> first</sectiontitle>
</chapter>
<node identifier="first"><nodename> first</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
';

1;
