use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'top_node_up_explicit'} = '*document_root C5
 *before_node_section
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C4
   *line_arg C1
    {Top}
   *line_arg C3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{dir}
    {(}
    {dir}
    {)}
   *line_arg C3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{weird}
    {(}
    {weird}
    {)}
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{dir}
    {(}
    {dir}
    {)}
 *@top C6 l2 {The top}
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
    {The top}
  {empty_line:\\n}
  *paragraph C1
   {Just a top node.\\n}
  {empty_line:\\n}
  *@menu C3 l6
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Chap}
    |normalized:{Chap}
     {Chap}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l8
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
 *@node C1 l10 {Chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chap}
 *@chapter C3 l11 {A chapter}
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
    {A chapter}
  {empty_line:\\n}
  *paragraph C1
   {Without the chapter, no up node from top is generated.\\n}
';


$result_texis{'top_node_up_explicit'} = '@node Top, (dir), (weird), (dir)
@top The top

Just a top node.

@menu
* Chap::
@end menu

@node Chap
@chapter A chapter

Without the chapter, no up node from top is generated.
';


$result_texts{'top_node_up_explicit'} = 'The top
*******

Just a top node.

* Chap::

1 A chapter
***********

Without the chapter, no up node from top is generated.
';

$result_errors{'top_node_up_explicit'} = '';

$result_nodes_list{'top_node_up_explicit'} = '1|Top
 associated_section: The top
 associated_title_command: The top
 menus:
  Chap
 node_directions:
  next-> (dir)
  prev-> (weird)
  up-> (dir)

2|Chap
 associated_section: 1 A chapter
 associated_title_command: 1 A chapter
 node_directions:
  up->Top
';

$result_sections_list{'top_node_up_explicit'} = '1|The top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->A chapter
 section_children:
  1|A chapter
2|A chapter
 associated_anchor_command: Chap
 associated_node: Chap
 section_directions:
  up->The top
 toplevel_directions:
  prev->The top
  up->The top
';

$result_sectioning_root{'top_node_up_explicit'} = 'level: -1
list:
 1|The top
';

$result_headings_list{'top_node_up_explicit'} = '';


$result_converted{'html'}->{'top_node_up_explicit'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>The top</title>

<meta name="description" content="The top">
<meta name="keywords" content="The top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<link href="http://etop.example.org" rel="up" title="(dir)">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="dir.html#Top" accesskey="n" rel="next">(dir)</a>, Previous: <a href="weird.html#Top" accesskey="p" rel="prev">(weird)</a>, Up: <a href="http://etop.example.org" accesskey="u" rel="up">(dir)</a> &nbsp; </p>
</div>
<h1 class="top" id="The-top"><span>The top<a class="copiable-link" href="#The-top"> &para;</a></span></h1>

<p>Just a top node.
</p>

<ul class="mini-toc">
<li><a href="#Chap" accesskey="1">A chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="Chap">
<div class="nav-panel">
<p>
Up: <a href="#Top" accesskey="u" rel="up">The top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="A-chapter"><span>1 A chapter<a class="copiable-link" href="#A-chapter"> &para;</a></span></h2>

<p>Without the chapter, no up node from top is generated.
</p></div>
</div>



</body>
</html>
';

1;
