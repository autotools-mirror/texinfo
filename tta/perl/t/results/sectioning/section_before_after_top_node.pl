use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_before_after_top_node'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@unnumbered C2 l1 {before}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {before}
  {empty_line:\\n}
 *@node C1 l3 {Top}
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
 *@top C2 l4 {top section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top section}
  {empty_line:\\n}
 *@chapter C3 l6 {Chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter}
  {empty_line:\\n}
  *paragraph C1
   {in chapter\\n}
';


$result_texis{'section_before_after_top_node'} = '@unnumbered before

@node Top
@top top section

@chapter Chapter

in chapter
';


$result_texts{'section_before_after_top_node'} = 'before
******

top section
***********

1 Chapter
*********

in chapter
';

$result_errors{'section_before_after_top_node'} = '* W l4|lowering the section level of @top appearing after a lower element
 warning: lowering the section level of @top appearing after a lower element

';

$result_nodes_list{'section_before_after_top_node'} = '1|Top
 associated_section: top section
 associated_title_command: top section
';

$result_sections_list{'section_before_after_top_node'} = '1|before
 section_directions:
  next->top section
 toplevel_directions:
  next->top section
2|top section
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->Chapter
  prev->before
 toplevel_directions:
  next->Chapter
  prev->before
3|Chapter
 section_directions:
  prev->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'section_before_after_top_node'} = 'level: 0
list:
 1|before
 2|top section
 3|Chapter
';

$result_headings_list{'section_before_after_top_node'} = '';


$result_converted{'info'}->{'section_before_after_top_node'} = 'This is , produced from section_before_after_top_node.texi.

before
******


File: ,  Node: Top,  Up: (dir)

top section
***********

1 Chapter
*********

in chapter


Tag Table:
Node: Top76

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'section_before_after_top_node'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top section</title>

<meta name="description" content="top section">
<meta name="keywords" content="top section">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">
<div class="unnumbered-level-extent" id="before">
<h2 class="unnumbered"><span>before<a class="copiable-link" href="#before"> &para;</a></span></h2>

</div>
<div class="unnumbered-level-extent" id="Top">
<h2 class="unnumbered top-level-set-unnumbered" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h2>

</div>
<div class="chapter-level-extent" id="Chapter">
<h2 class="chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<p>in chapter
</p></div>



</body>
</html>
';


$result_converted{'docbook'}->{'section_before_after_top_node'} = '<chapter label="">
<title>before</title>

</chapter>
';


$result_converted{'latex_text'}->{'section_before_after_top_node'} = '\\begin{document}
\\chapter*{{before}}

\\label{anchor:Top}%
';

1;
