use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'space_and_commands_in_menu_node'} = '*document_root C5
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
 *@top C4 l2 {top}
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
  *@menu C11 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chap  b}
    |normalized:{chap-b}
     {chap  b}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:{chap @: b}
    |normalized:{chap-b}
     {chap }
     *@:
     { b}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chap b}
    |normalized:{chap-b}
     {chap b}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |EXTRA
    |node_content:{chap@ @ b}
    |normalized:{chap-b}
     {chap}
     *@ 
     *@ 
     {b}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:{chap@  b}
    |normalized:{chap-b}
     {chap}
     *@ 
     { b}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:{chap @ b}
    |normalized:{chap-b}
     {chap }
     *@ 
     {b}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l11
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {label}
    {menu_entry_separator:: }
    *menu_entry_node C3
    |EXTRA
    |node_content:{chap @: b}
    |normalized:{chap-b}
     {chap }
     *@:
     { b}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l12
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {label}
    {menu_entry_separator:: }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chap b}
    |normalized:{chap-b}
     {chap b}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l13
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {label}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |node_content:{chap @ @ b}
    |normalized:{chap-b}
     {chap }
     *@ 
     *@ 
     {b}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l14
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
 *@node C1 l16 {chap @: b}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap-b}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap }
    *@:
    { b}
 *@chapter C1 l17 {Chap}
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
';


$result_texis{'space_and_commands_in_menu_node'} = '@node Top
@top top

@menu
* chap  b::
* chap @: b::
* chap b::
* chap@ @ b::
* chap@  b::
* chap @ b::
* label: chap @: b.
* label: chap b.
* label: chap @ @ b.
@end menu

@node chap @: b
@chapter Chap
';


$result_texts{'space_and_commands_in_menu_node'} = 'top
***

* chap  b::
* chap  b::
* chap b::
* chap  b::
* chap  b::
* chap  b::
* label: chap  b.
* label: chap b.
* label: chap   b.

1 Chap
******
';

$result_errors{'space_and_commands_in_menu_node'} = '* W l5|@menu entry node name `chap  b\' different from node name `chap @: b\'
 warning: @menu entry node name `chap  b\' different from node name `chap @: b\'

* W l7|@menu entry node name `chap b\' different from node name `chap @: b\'
 warning: @menu entry node name `chap b\' different from node name `chap @: b\'

* W l8|@menu entry node name `chap@ @ b\' different from node name `chap @: b\'
 warning: @menu entry node name `chap@ @ b\' different from node name `chap @: b\'

* W l9|@menu entry node name `chap@  b\' different from node name `chap @: b\'
 warning: @menu entry node name `chap@  b\' different from node name `chap @: b\'

* W l10|@menu entry node name `chap @ b\' different from node name `chap @: b\'
 warning: @menu entry node name `chap @ b\' different from node name `chap @: b\'

* W l12|@menu entry node name `chap b\' different from node name `chap @: b\'
 warning: @menu entry node name `chap b\' different from node name `chap @: b\'

* W l13|@menu entry node name `chap @ @ b\' different from node name `chap @: b\'
 warning: @menu entry node name `chap @ @ b\' different from node name `chap @: b\'

';

$result_nodes_list{'space_and_commands_in_menu_node'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chap  b
  chap @: b
  chap b
  chap@ @ b
  chap@  b
  chap @ b
  chap @: b
  chap b
  chap @ @ b
 node_directions:
  next->chap @: b
2|chap @: b
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  next->chap @: b
  prev->Top
  up->Top
';

$result_sections_list{'space_and_commands_in_menu_node'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chap @: b
 associated_node: chap @: b
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'space_and_commands_in_menu_node'} = 'level: -1
list:
 1|top
';

$result_headings_list{'space_and_commands_in_menu_node'} = '';


$result_converted{'plaintext'}->{'space_and_commands_in_menu_node'} = 'top
***

* Menu:

* chap  b::
* chap  b::
* chap b::
* chap  b::
* chap  b::
* chap  b::
* label: chap  b.
* label: chap b.
* label: chap   b.

1 Chap
******

';


$result_converted{'html'}->{'space_and_commands_in_menu_node'} = '<!DOCTYPE html>
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

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chap-b" accesskey="n" rel="next">Chap</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#chap-b" accesskey="1">chap  b</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#chap-b" accesskey="2">chap  b</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#chap-b" accesskey="3">chap b</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#chap-b" accesskey="4">chap&nbsp;&nbsp;b</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#chap-b" accesskey="5">chap&nbsp; b</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#chap-b" accesskey="6">chap &nbsp;b</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#chap-b" accesskey="7">label</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#chap-b" accesskey="8">label</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#chap-b" accesskey="9">label</a>:</td><td class="menu-entry-description">
</td></tr>
</table>

<hr>
<div class="chapter-level-extent" id="chap-b">
<div class="nav-panel">
<p>
Next: <a href="#chap-b" accesskey="n" rel="next">Chap</a>, Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'space_and_commands_in_menu_node'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap &noeos; b</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chap  b</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>chap &noeos; b</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>chap b</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>chap<spacecmd type="spc"/><spacecmd type="spc"/>b</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>chap<spacecmd type="spc"/> b</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>chap <spacecmd type="spc"/>b</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>label</menutitle><menuseparator>: </menuseparator><menunode>chap &noeos; b</menunode><menuseparator>.</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>label</menutitle><menuseparator>: </menuseparator><menunode>chap b</menunode><menuseparator>.</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>label</menutitle><menuseparator>: </menuseparator><menunode>chap <spacecmd type="spc"/><spacecmd type="spc"/>b</menunode><menuseparator>.</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="chap-b" spaces=" "><nodename>chap &noeos; b</nodename><nodenext automatic="on">chap &noeos; b</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chap</sectiontitle>
</chapter>
';

1;
