use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'placed_things_before_node'} = '*document_root C5
 *before_node_section C18
  *preamble_before_content
  *@anchor C1 l1
  |EXTRA
  |identifier:{An-anchor}
  |is_target:{1}
   *brace_arg C1
    {An anchor}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C3
   {Ref to the anchor:\\n}
   *@ref C1 l4
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{An-anchor}
     {An anchor}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {Ref to the anchor in footnote:\\n}
   *@ref C1 l7
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Anchor-in-footnote}
     {Anchor in footnote}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@footnote C1 l9
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C6
     *paragraph C1
      {In footnote.\\n}
     {empty_line:\\n}
     *@anchor C1 l11
     |EXTRA
     |identifier:{Anchor-in-footnote}
     |is_target:{1}
      *brace_arg C1
       {Anchor in footnote}
     {spaces_after_close_brace:\\n}
     {empty_line:\\n}
     *paragraph C3
      {Ref to main text anchor\\n}
      *@ref C1 l14
       *brace_arg C1
       |EXTRA
       |node_content:A{0|0}
       |normalized:{An-anchor}
        {An anchor}
      {\\n}
   {\\n}
  {empty_line:\\n}
  *@float C3 l17
  |EXTRA
  |float_number:{1}
  |float_type:{}
  |global_command_number:{1}
  |identifier:{float-anchor}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C1
     {spaces_before_argument: }
    *block_line_arg C3
     {spaces_before_argument: }
     {float anchor}
     {spaces_after_argument:\\n}
   *paragraph C1
    {In float\\n}
   *@end C1 l19
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {Ref to float\\n}
   *@ref C1 l22
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{float-anchor}
     {float anchor}
   {.\\n}
  {empty_line:\\n}
  *@menu C3 l24
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l25
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{An-anchor}
     {An anchor}
    {menu_entry_separator:::                }
    *menu_entry_description C1
     *preformatted C1
      {menu entry pointing to the anchor.\\n}
   *@end C1 l26
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l28
  |EXTRA
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {index entry}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l30 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C2 l31 {top section}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l33 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter}
    {spaces_after_argument:\\n}
 *@chapter C5 l34 {Chapter}
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
  *paragraph C3
   {Ref to anchor\\n}
   *@ref C1 l37
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{An-anchor}
     {An anchor}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {Ref to footnote anchor\\n}
   *@ref C1 l40
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Anchor-in-footnote}
     {Anchor in footnote}
   {\\n}
';


$result_texis{'placed_things_before_node'} = '@anchor{An anchor}

Ref to the anchor:
@ref{An anchor}

Ref to the anchor in footnote:
@ref{Anchor in footnote}.

@footnote{In footnote.

@anchor{Anchor in footnote}

Ref to main text anchor
@ref{An anchor}
}

@float , float anchor
In float
@end float

Ref to float
@ref{float anchor}.

@menu
* An anchor::                menu entry pointing to the anchor.
@end menu

@cindex index entry

@node Top
@top top section

@node chapter
@chapter Chapter

Ref to anchor
@ref{An anchor}

Ref to footnote anchor
@ref{Anchor in footnote}
';


$result_texts{'placed_things_before_node'} = '
Ref to the anchor:
An anchor

Ref to the anchor in footnote:
Anchor in footnote.



float anchor
In float

Ref to float
float anchor.

* An anchor::                menu entry pointing to the anchor.


top section
***********

1 Chapter
*********

Ref to anchor
An anchor

Ref to footnote anchor
Anchor in footnote
';

$result_errors{'placed_things_before_node'} = '* W l28|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_floats{'placed_things_before_node'} = ': 1
 F1: {float-anchor}
';

$result_nodes_list{'placed_things_before_node'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'placed_things_before_node'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'placed_things_before_node'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'placed_things_before_node'} = '';

$result_indices_sort_strings{'placed_things_before_node'} = 'cp:
 index entry
';


$result_converted{'info'}->{'placed_things_before_node'} = Encode::encode('utf-8', 'This is , produced from .

Ref to the anchor: *note An anchor::

   Ref to the anchor in footnote: *note Anchor in footnote::.

   (1)

In float

1
   Ref to float *note 1: float anchor.

* Menu:

* An anchor::                menu entry pointing to the anchor.


File: ,  Node: Top,  Next: chapter,  Up: (dir)

top section
***********

* Menu:

* chapter::

   ---------- Footnotes ----------

   (1) In footnote.

   Ref to main text anchor *note An anchor::


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 Chapter
*********

Ref to anchor *note An anchor::

   Ref to footnote anchor *note Anchor in footnote::


Tag Table:
Ref: An anchor27
Ref: float anchor136
Node: Top262
Ref: Top-Footnote-1395
Ref: Anchor in footnote416
Node: chapter462

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_sort_strings{'info'}->{'placed_things_before_node'} = 'cp:
 index entry
';

$result_converted_errors{'info'}->{'placed_things_before_node'} = '* W l1|@anchor outside of any node
 warning: @anchor outside of any node

* W l9|@footnote outside of any node
 warning: @footnote outside of any node

* W l17|@float outside of any node
 warning: @float outside of any node

';


$result_converted{'html'}->{'placed_things_before_node'} = '<!DOCTYPE html>
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

<body>
<a class="anchor" id="An-anchor"></a>
<p>Ref to the anchor:
<a class="ref" href="#An-anchor">An anchor</a>
</p>
<p>Ref to the anchor in footnote:
<a class="ref" href="#Anchor-in-footnote">Anchor in footnote</a>.
</p>
<p><a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>
</p>
<div class="float" id="float-anchor">
<p>In float
</p><div class="type-number-float"><p><strong class="strong">1</strong></p></div></div>
<p>Ref to float
<a class="ref" href="#float-anchor">1</a>.
</p>

<a class="index-entry-id" id="index-index-entry"></a>

<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">Chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top section</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top section</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<p>Ref to anchor
<a class="ref" href="#An-anchor">An anchor</a>
</p>
<p>Ref to footnote anchor
<a class="ref" href="#Anchor-in-footnote">Anchor in footnote</a>
</p></div>
</div>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>In footnote.
</p>
<a class="anchor" id="Anchor-in-footnote"></a>
<p>Ref to main text anchor
<a class="ref" href="#An-anchor">An anchor</a>
</p>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'placed_things_before_node'} = 'cp:
 index entry
';


$result_converted{'latex_text'}->{'placed_things_before_node'} = '\\begin{document}
\\label{anchor:An-anchor}%

Ref to the anchor:
\\hyperref[anchor:An-anchor]{[An anchor], page~\\pageref*{anchor:An-anchor}}

Ref to the anchor in footnote:
\\hyperref[anchor:Anchor-in-footnote]{[Anchor in footnote], page~\\pageref*{anchor:Anchor-in-footnote}}.

\\footnote{In footnote.

\\label{anchor:Anchor-in-footnote}%

Ref to main text anchor
\\hyperref[anchor:An-anchor]{[An anchor], page~\\pageref*{anchor:An-anchor}}
}

\\begin{TexinfoFloat}
In float
\\label{anchor:float-anchor}%
\\end{TexinfoFloat}

Ref to float
\\hyperref[anchor:float-anchor]{\\ref*{anchor:float-anchor}}.


\\index[cp]{index entry@index entry}%

\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chapter}%

Ref to anchor
\\hyperref[anchor:An-anchor]{[An anchor], page~\\pageref*{anchor:An-anchor}}

Ref to footnote anchor
\\hyperref[anchor:Anchor-in-footnote]{[Anchor in footnote], page~\\pageref*{anchor:Anchor-in-footnote}}
';

1;
