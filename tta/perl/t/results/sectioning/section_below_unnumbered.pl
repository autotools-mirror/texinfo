use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_below_unnumbered'} = '*document_root C8
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@contents C1 l2
   |EXTRA
   |global_command_number:{1}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l4 {Top}
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
 *@top C7 l5 {Top}
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
    {Top}
  {empty_line:\\n}
  *paragraph C1
   {Top node.\\n}
  {empty_line:\\n}
  *@menu C3 l9
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Unn}
    |normalized:{Unn}
     {Unn}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l11
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
  {empty_line:\\n}
 *@node C1 l14 {Unn}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Unn}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Unn}
 *@unnumbered C4 l15 {Unn}
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
    {Unn}
  {empty_line:\\n}
  *@menu C3 l17
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l18
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Sec}
    |normalized:{Sec}
     {Sec}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l19
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
 *@node C1 l21 {Sec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Sec}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sec}
 *@section C4 l22 {Sec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sec}
  {empty_line:\\n}
  *paragraph C1
   {Should be unnumbered.\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'section_below_unnumbered'} = '
@contents

@node Top
@top Top

Top node.

@menu
* Unn::
@end menu


@node Unn
@unnumbered Unn

@menu
* Sec::
@end menu

@node Sec
@section Sec

Should be unnumbered.

@bye
';


$result_texts{'section_below_unnumbered'} = '
Top
***

Top node.

* Unn::


Unn
***

* Sec::

Sec
===

Should be unnumbered.

';

$result_errors{'section_below_unnumbered'} = '';

$result_nodes_list{'section_below_unnumbered'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  Unn
 node_directions:
  next->Unn
2|Unn
 associated_section: Unn
 associated_title_command: Unn
 menus:
  Sec
 node_directions:
  prev->Top
  up->Top
3|Sec
 associated_section: Sec
 associated_title_command: Sec
 node_directions:
  up->Unn
';

$result_sections_list{'section_below_unnumbered'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Unn
 section_children:
  1|Unn
2|Unn
 associated_anchor_command: Unn
 associated_node: Unn
 section_directions:
  up->Top
 toplevel_directions:
  prev->Top
  up->Top
 section_children:
  1|Sec
3|Sec
 associated_anchor_command: Sec
 associated_node: Sec
 section_directions:
  up->Unn
';

$result_sectioning_root{'section_below_unnumbered'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'section_below_unnumbered'} = '';


$result_converted{'plaintext'}->{'section_below_unnumbered'} = 'Top
Unn
  Sec

Top
***

Top node.

Unn
***

Sec
===

Should be unnumbered.

';


$result_converted{'html'}->{'section_below_unnumbered'} = '<!DOCTYPE html>
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
<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body lang="">

<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#Unn" accesskey="n" rel="next">Unn</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h1 class="top" id="Top-1"><span>Top<a class="copiable-link" href="#Top-1"> &para;</a></span></h1>

<p>Top node.
</p>


<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">

<ul class="toc-numbered-mark">
  <li><a id="toc-Unn" href="#Unn">Unn</a>
  <ul class="toc-numbered-mark">
    <li><a id="toc-Sec" href="#Sec">Sec</a></li>
  </ul></li>
</ul>
</div>
</div>
<hr>
<div class="unnumbered-level-extent" id="Unn">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">Top</a>, Up: <a href="#Top" accesskey="u" rel="up">Top</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h2 class="unnumbered" id="Unn-1"><span>Unn<a class="copiable-link" href="#Unn-1"> &para;</a></span></h2>


<ul class="mini-toc">
<li><a href="#Sec" accesskey="1">Sec</a></li>
</ul>
<hr>
<div class="section-level-extent" id="Sec">
<div class="nav-panel">
<p>
Up: <a href="#Unn" accesskey="u" rel="up">Unn</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h3 class="section" id="Sec-1"><span>Sec<a class="copiable-link" href="#Sec-1"> &para;</a></span></h3>

<p>Should be unnumbered.
</p>
</div>
</div>
</div>



</body>
</html>
';

1;
