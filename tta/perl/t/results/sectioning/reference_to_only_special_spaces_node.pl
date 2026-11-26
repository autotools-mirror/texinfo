use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'reference_to_only_special_spaces_node'} = '*document_root C8
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble
 *normal_command@node C1 reference_to_only_special_spaces_node.texi:l2 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 reference_to_only_special_spaces_node.texi:l3 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 reference_to_only_special_spaces_node.texi:l5 {   }
 |identifier:{_2002_2003_2002}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:   }
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 reference_to_only_special_spaces_node.texi:l6 {EN QUAD| | EM QUAD| | EN SPACE| |}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:EN QUAD| | EM QUAD| | EN SPACE| |}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C2 reference_to_only_special_spaces_node.texi:l8
    *brace_arg C2
    |node_content:A{1|1}
    |normalized:{_2002_2003_2002}
     {spaces_before_argument: }
     {normal_text:   }
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:   }
   {normal_text:.\\n}
  {empty_line:\\n}
 *normal_command@node C1 reference_to_only_special_spaces_node.texi:l10 {@code{   }}
 |identifier:{_2002_2003_2002}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@code C1 reference_to_only_special_spaces_node.texi:l10
     *brace_container C1
      {normal_text:   }
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 reference_to_only_special_spaces_node.texi:l11 {@code{EN QUAD| | EM QUAD| | EN SPACE| |}}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@code C1 reference_to_only_special_spaces_node.texi:l11
     *brace_container C1
      {normal_text:EN QUAD| | EM QUAD| | EN SPACE| |}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C2 reference_to_only_special_spaces_node.texi:l13
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{_2002_2003_2002}
     *normal_command@code C1 reference_to_only_special_spaces_node.texi:l13
      *brace_container C1
       {normal_text:   }
    *brace_arg C2
     {spaces_before_argument: }
     *normal_command@code C1 reference_to_only_special_spaces_node.texi:l13
      *brace_container C1
       {normal_text:   }
   {normal_text:.\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'reference_to_only_special_spaces_node'} = '
@node Top
@top top

@node    
@chapter EN QUAD| | EM QUAD| | EN SPACE| |

@ref{    ,    }.

@node @code{   }
@chapter @code{EN QUAD| | EM QUAD| | EN SPACE| |}

@ref{@code{   }, @code{   }}.


@bye
';


$result_texts{'reference_to_only_special_spaces_node'} = 'top
***

1 EN QUAD| | EM QUAD| | EN SPACE| |
***********************************

   .

2 EN QUAD| | EM QUAD| | EN SPACE| |
***********************************

   .


';

$result_errors{'reference_to_only_special_spaces_node'} = '* E reference_to_only_special_spaces_node.texi:l10|@node `@code{   }\' previously defined
 @node `@code{   }\' previously defined

* EC reference_to_only_special_spaces_node.texi:l5|here is the previous definition as @node
 here is the previous definition as @node

* W reference_to_only_special_spaces_node.texi:l13|@ref to `@code{   }\', different from node name `   \'
 warning: @ref to `@code{   }\', different from node name `   \'

';

$result_nodes_list{'reference_to_only_special_spaces_node'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->   
2|   
 associated_section: 1 EN QUAD| | EM QUAD| | EN SPACE| |
 associated_title_command: 1 EN QUAD| | EM QUAD| | EN SPACE| |
 node_directions:
  next->@code{   }
  prev->Top
  up->Top
3|@code{   }
 associated_section: 2 @code{EN QUAD| | EM QUAD| | EN SPACE| |}
 associated_title_command: 2 @code{EN QUAD| | EM QUAD| | EN SPACE| |}
 node_directions:
  prev->   
  up->Top
';

$result_sections_list{'reference_to_only_special_spaces_node'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->EN QUAD| | EM QUAD| | EN SPACE| |
 section_children:
  1|EN QUAD| | EM QUAD| | EN SPACE| |
  2|@code{EN QUAD| | EM QUAD| | EN SPACE| |}
2|EN QUAD| | EM QUAD| | EN SPACE| |
 associated_anchor_command:    
 associated_node:    
 section_directions:
  next->@code{EN QUAD| | EM QUAD| | EN SPACE| |}
  up->top
 toplevel_directions:
  next->@code{EN QUAD| | EM QUAD| | EN SPACE| |}
  prev->top
  up->top
3|@code{EN QUAD| | EM QUAD| | EN SPACE| |}
 associated_anchor_command: @code{   }
 associated_node: @code{   }
 section_directions:
  prev->EN QUAD| | EM QUAD| | EN SPACE| |
  up->top
 toplevel_directions:
  prev->EN QUAD| | EM QUAD| | EN SPACE| |
  up->top
';

$result_sectioning_root{'reference_to_only_special_spaces_node'} = 'level: -1
list:
 1|top
';

$result_headings_list{'reference_to_only_special_spaces_node'} = '';


$result_converted{'info'}->{'reference_to_only_special_spaces_node'} = Encode::encode('utf-8', 'This is , produced from reference_to_only_special_spaces_node.texi.


File: ,  Node: Top,  Next:    ,  Up: (dir)

top
***

* Menu:

*    ::


File: ,  Node:    ,  Next:    ,  Prev: Top,  Up: Top

1 EN QUAD| | EM QUAD| | EN SPACE| |
***********************************

*note    :    .

2 ‘EN QUAD| | EM QUAD| | EN SPACE| |’
*************************************

*note ‘   ’:    .


Tag Table:
Node: Top69
Node:    154

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'reference_to_only_special_spaces_node'} = '<!DOCTYPE html>
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

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_2002_2003_2002" accesskey="n" rel="next">EN QUAD| | EM QUAD| | EN SPACE| |</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#g_t_2002_2003_2002" accesskey="1">EN QUAD| | EM QUAD| | EN SPACE| |</a></li>
<li><code class="code">EN QUAD| | EM QUAD| | EN SPACE| |</code></li>
</ul>
<hr>
<div class="chapter-level-extent" id="g_t_2002_2003_2002">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><code class="code">EN QUAD| | EM QUAD| | EN SPACE| |</code></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c"><span>1 EN QUAD| | EM QUAD| | EN SPACE| |<a class="copiable-link" href="#EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c"> &para;</a></span></h2>

<p><a class="ref" href="#g_t_2002_2003_2002">   </a>.
</p>
<hr>
</div>
<div class="chapter-level-extent">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_2002_2003_2002" accesskey="p" rel="prev">EN QUAD| | EM QUAD| | EN SPACE| |</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c-1"><span>2 <code class="code">EN QUAD| | EM QUAD| | EN SPACE| |</code><a class="copiable-link" href="#EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c-1"> &para;</a></span></h2>

<p><a class="ref" href="#g_t_2002_2003_2002"><code class="code">   </code></a>.
</p>

</div>
</div>



</body>
</html>
';

1;
