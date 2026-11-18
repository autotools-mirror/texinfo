use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_footnote_separate'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C1
   *@footnotestyle C1 l1
   |EXTRA
   |misc_args:A{separate}
    *line_arg C3
     {spaces_before_argument: }
     {separate}
     {spaces_after_argument:\\n}
 *@node C1 l2 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C6 l3 {Top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {In top node}
   *@footnote C1 l5
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C3
      {in footnote\\n}
      *@anchor C1 l6
      |EXTRA
      |identifier:{Anchor-in-footnote}
      |is_target:{1}
       *brace_arg C1
        {Anchor in footnote}
      {.\\n}
   {\\n}
  {empty_line:\\n}
  *@menu C3 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter}
     {chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l13 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter}
    {spaces_after_argument:\\n}
 *@chapter C3 l14 {Chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l16
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Anchor-in-footnote}
     {Anchor in footnote}
   {.\\n}
';


$result_texis{'anchor_in_footnote_separate'} = '@footnotestyle separate
@node Top
@top Top

In top node@footnote{in footnote
@anchor{Anchor in footnote}.
}

@menu
* chapter::
@end menu

@node chapter
@chapter Chap

@ref{Anchor in footnote}.
';


$result_texts{'anchor_in_footnote_separate'} = 'Top
***

In top node

* chapter::

1 Chap
******

Anchor in footnote.
';

$result_errors{'anchor_in_footnote_separate'} = '';

$result_nodes_list{'anchor_in_footnote_separate'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'anchor_in_footnote_separate'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->Top
 toplevel_directions:
  prev->Top
  up->Top
';

$result_sectioning_root{'anchor_in_footnote_separate'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'anchor_in_footnote_separate'} = '';


$result_converted{'info'}->{'anchor_in_footnote_separate'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chapter,  Up: (dir)

Top
***

In top node(1) (*note Top-Footnote-1::)

* Menu:

* chapter::


File: ,  Node: Top-Footnotes,  Up: Top

   (1) in footnote .


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 Chap
******

*note Anchor in footnote::.


Tag Table:
Node: Top27
Node: Top-Footnotes149
Ref: Top-Footnote-1191
Ref: Anchor in footnote209
Node: chapter213

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'anchor_in_footnote_separate'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Top</title>

<meta name="description" content="Top">
<meta name="keywords" content="Top">
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">Chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="Top-1"><span>Top<a class="copiable-link" href="#Top-1"> &para;</a></span></h1>

<p>In top node<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>
</p>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">Chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<p><a class="ref" href="#Anchor-in-footnote">Anchor in footnote</a>.
</p><hr>
</div>
</div>
<div class="element-footnotes" id="SEC_Footnotes">
<p class="nav-panel">
<span class="nav-button">[<a href="#Top" title="Cover (top) of document" rel="start">Top</a>]</span></p>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>in footnote
<a class="anchor" id="Anchor-in-footnote"></a>.
</p>
</div>


</body>
</html>
';

1;
