use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'maketitle_documentinfo_publication'} = '*document_root C8
 *before_node_section C4
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C8
   *@publication C3 maketitle_documentinfo_publication.texi:l2
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C1
     {C\'est toto\\n}
    *@end C1 maketitle_documentinfo_publication.texi:l4
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{publication}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {publication}
   {empty_line: \\n}
   *@documentinfo C8 maketitle_documentinfo_publication.texi:l6
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *@author C1 maketitle_documentinfo_publication.texi:l7
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |global_command_number:{1}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {SOme ONe}
    *@title C1 maketitle_documentinfo_publication.texi:l8
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {TTT}
    *@author C1 maketitle_documentinfo_publication.texi:l9
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |global_command_number:{2}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {Gàther Person}
    *@subtitle C1 maketitle_documentinfo_publication.texi:l10
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |global_command_number:{1}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {ST1}
    *@subtitle C1 maketitle_documentinfo_publication.texi:l11
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |global_command_number:{2}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {ST2}
    *paragraph C1
     {Toto\\n}
    *@end C1 maketitle_documentinfo_publication.texi:l13
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{documentinfo}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {documentinfo}
   {empty_line:\\n}
   *@copying C3 maketitle_documentinfo_publication.texi:l15
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C1
     {You shoukd\\n}
    *@end C1 maketitle_documentinfo_publication.texi:l17
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{copying}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {copying}
   {empty_line:\\n}
   *@contents C1 maketitle_documentinfo_publication.texi:l19
   |EXTRA
   |global_command_number:{1}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line: \\n}
  *@maketitle C1 maketitle_documentinfo_publication.texi:l21
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 maketitle_documentinfo_publication.texi:l23 {top}
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
    {top}
 *@top C4 maketitle_documentinfo_publication.texi:l24 {top}
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
  {empty_line: \\n}
  *paragraph C1
   {aaa\\n}
  {empty_line: \\n}
 *@node C1 maketitle_documentinfo_publication.texi:l28 {chùpter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{ch_00f9pter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chùpter}
 *@chapter C2 maketitle_documentinfo_publication.texi:l29 {chap}
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
    {chap}
  {empty_line: \\n}
 *@node C1 maketitle_documentinfo_publication.texi:l31 {section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{section}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {section}
 *@section C2 maketitle_documentinfo_publication.texi:l32 {Sec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sec}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'maketitle_documentinfo_publication'} = '
@publication
C\'est toto
@end publication
 
@documentinfo
@author SOme ONe
@title TTT
@author Gàther Person
@subtitle ST1
@subtitle ST2
Toto
@end documentinfo

@copying
You shoukd
@end copying

@contents
 
@maketitle

@node top
@top top
 
aaa
 
@node chùpter
@chapter chap
 
@node section
@section Sec

@bye
';


$result_texts{'maketitle_documentinfo_publication'} = ' 


 

top
***
 
aaa
 
1 chap
******
 
1.1 Sec
=======

';

$result_errors{'maketitle_documentinfo_publication'} = '';

$result_nodes_list{'maketitle_documentinfo_publication'} = '1|top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chùpter
2|chùpter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->top
  up->top
3|section
 associated_section: 1.1 Sec
 associated_title_command: 1.1 Sec
 node_directions:
  up->chùpter
';

$result_sections_list{'maketitle_documentinfo_publication'} = '1|top
 associated_anchor_command: top
 associated_node: top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chùpter
 associated_node: chùpter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|Sec
3|Sec
 associated_anchor_command: section
 associated_node: section
 section_directions:
  up->chap
';

$result_sectioning_root{'maketitle_documentinfo_publication'} = 'level: -1
list:
 1|top
';

$result_headings_list{'maketitle_documentinfo_publication'} = '';


$result_converted{'html'}->{'maketitle_documentinfo_publication'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- You shoukd -->
<title>TTT</title>

<meta name="description" content="TTT">
<meta name="keywords" content="TTT">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="top">
<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
h3.subtitle {text-align:right}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body lang="">
 


 
<div class="maketitle-titlepage">
<h1 class="title">TTT</h1>
<h3 class="subtitle">ST1</h3>
<h3 class="subtitle">ST2</h3>
<strong class="author">SOme ONe</strong><br>
<strong class="author">Gàther Person</strong><br>
</div>
<hr>

<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#ch_00f9pter" accesskey="n" rel="next">chap</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>
 
<p>aaa
</p> 
<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">

<ul class="toc-numbered-mark">
  <li><a id="toc-chap" href="#ch_00f9pter">1 chap</a>
  <ul class="toc-numbered-mark">
    <li><a id="toc-Sec" href="#section">1.1 Sec</a></li>
  </ul></li>
</ul>
</div>
</div>
<hr>
<div class="chapter-level-extent" id="ch_00f9pter">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>
 
<ul class="mini-toc">
<li><a href="#section" accesskey="1">Sec</a></li>
</ul>
<hr>
<div class="section-level-extent" id="section">
<div class="nav-panel">
<p>
Up: <a href="#ch_00f9pter" accesskey="u" rel="up">chap</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h3 class="section" id="Sec"><span>1.1 Sec<a class="copiable-link" href="#Sec"> &para;</a></span></h3>

</div>
</div>
</div>



</body>
</html>
';

1;
