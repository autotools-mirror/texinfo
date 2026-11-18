use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_node_up_explicit_no_nodes'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {Top}
   *line_arg C4
   |EXTRA
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {(}
    {dir}
    {)}
   *line_arg C4
   |EXTRA
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {(}
    {weird}
    {)}
   *line_arg C5
   |EXTRA
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {(}
    {dir}
    {)}
    {spaces_after_argument:\\n}
 *@top C6 l2 {The top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {The top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Just a top node.\\n}
  {empty_line:\\n}
  *@menu C3 l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Chap}
     {Chap}
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
 *@node C1 l10 {Chap}
 |EXTRA
 |identifier:{Chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chap}
    {spaces_after_argument:\\n}
 *@chapter C3 l11 {A chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {A chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Without the chapter, no up node from top is generated.\\n}
';


$result_texis{'top_node_up_explicit_no_nodes'} = '@node Top, (dir), (weird), (dir)
@top The top

Just a top node.

@menu
* Chap::
@end menu

@node Chap
@chapter A chapter

Without the chapter, no up node from top is generated.
';


$result_texts{'top_node_up_explicit_no_nodes'} = 'The top
*******

Just a top node.

* Chap::

1 A chapter
***********

Without the chapter, no up node from top is generated.
';

$result_errors{'top_node_up_explicit_no_nodes'} = '';

$result_nodes_list{'top_node_up_explicit_no_nodes'} = '1|Top
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

$result_sections_list{'top_node_up_explicit_no_nodes'} = '1|The top
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

$result_sectioning_root{'top_node_up_explicit_no_nodes'} = 'level: -1
list:
 1|The top
';

$result_headings_list{'top_node_up_explicit_no_nodes'} = '';


$result_converted{'html'}->{'top_node_up_explicit_no_nodes'} = '<!DOCTYPE html>
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

<link href="#Top" rel="start" title="The top">
<link href="http://etop.example.org" rel="up" title="(dir)">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label"> Up : </span><span class="nav-link"><a href="http://etop.example.org" accesskey="u" rel="up">(dir)</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="The-top"><span>The top<a class="copiable-link" href="#The-top"> &para;</a></span></h1>

<p>Just a top node.
</p>

<ul class="mini-toc">
<li><a href="#Chap" accesskey="1">A chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="Chap">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label"> Up : </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">The top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="A-chapter"><span>1 A chapter<a class="copiable-link" href="#A-chapter"> &para;</a></span></h2>

<p>Without the chapter, no up node from top is generated.
</p></div>
</div>



</body>
</html>
';

1;
