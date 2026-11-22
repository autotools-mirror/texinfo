use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'command_translated'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@documentlanguage C1 l1
   |EXTRA
   |global_command_number:{1}
   |text_arg:{fr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:fr}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C4 l4 {top @error{}}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:top }
    *@error C1 l4
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@error C1 l6
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
 *@node C1 l8 {chapter @error{}}
 |EXTRA
 |identifier:{chapter-error_002d_002d_003e}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:chapter }
    *@error C1 l8
     *brace_container
    {spaces_after_argument:\\n}
 *@chapter C1 l9 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
';


$result_texis{'command_translated'} = '@documentlanguage fr

@node Top
@top top @error{}

@error{}

@node chapter @error{}
@chapter Chapter
';


$result_texts{'command_translated'} = '
top error->
***********

error->

1 Chapter
*********
';

$result_errors{'command_translated'} = '';

$result_nodes_list{'command_translated'} = '1|Top
 associated_section: top @error{}
 associated_title_command: top @error{}
 node_directions:
  next->chapter @error{}
2|chapter @error{}
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'command_translated'} = '1|top @error{}
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chapter @error{}
 associated_node: chapter @error{}
 section_directions:
  up->top @error{}
 toplevel_directions:
  prev->top @error{}
  up->top @error{}
';

$result_sectioning_root{'command_translated'} = 'level: -1
list:
 1|top @error{}
';

$result_headings_list{'command_translated'} = '';


$result_converted{'plaintext'}->{'command_translated'} = 'top erreur→
***********

erreur→

1 Chapter
*********

';


$result_converted{'info'}->{'command_translated'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chapter erreur→,  Up: (dir)

top erreur→
***********

erreur→

* Menu:

* chapter erreur→::


File: ,  Node: chapter erreur→,  Prev: Top,  Up: Top

1 Chapter
*********


Tag Table:
Node: Top27
Node: chapter erreur→157

End Tag Table


Local Variables:
coding: utf-8
Info-documentlanguage: fr
End:
');


$result_converted{'html'}->{'command_translated'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top erreur&rarr;</title>

<meta name="description" content="top erreur&rarr;">
<meta name="keywords" content="top erreur&rarr;">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="fr">

<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Suivant: </span><span class="nav-link"><a href="#chapter-error_002d_002d_003e" accesskey="n" rel="next">Chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top-error_002d_002d_003e"><span>top erreur<span class="arrow">&rarr;</span><a class="copiable-link" href="#top-error_002d_002d_003e"> &para;</a></span></h1>

<p>erreur<span class="arrow">&rarr;</span>
</p>
<ul class="mini-toc">
<li><a href="#chapter-error_002d_002d_003e" accesskey="1">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter-error_002d_002d_003e">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Pr&eacute;c&eacute;dent: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top erreur<span class="arrow">&rarr;</span></a></span></span>, <span class="nav-button"><span class="nav-label">Monter: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top erreur<span class="arrow">&rarr;</span></a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';

1;
