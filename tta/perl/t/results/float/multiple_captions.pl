use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multiple_captions'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 l5 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C6 l7
  |EXTRA
  |float_number:{1.1}
  |float_type:{a}
  |global_command_number:{1}
  |identifier:{b}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:a}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:b}
     {spaces_after_argument:\\n}
   *normal_command@caption C1 l8
    *brace_command_context C1
     *paragraph C1
      {normal_text:caption 1}
   {spaces_after_close_brace:\\n}
   *normal_command@caption C1 l9
    *brace_command_context C1
     *paragraph C1
      {normal_text:multiple}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l10
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C11 l12
  |EXTRA
  |float_number:{1.1}
  |float_type:{c}
  |global_command_number:{2}
  |identifier:{d}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:c}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:d}
     {spaces_after_argument:\\n}
   *normal_command@shortcaption C1 l13
    *brace_command_context C1
     *paragraph C1
      {normal_text:shortcaption 1}
   {spaces_after_close_brace:\\n}
   *normal_command@shortcaption C1 l14
    *brace_command_context C1
     *paragraph C1
      {normal_text:multiple shortc 1}
   {spaces_after_close_brace:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:Something.\\n}
   {empty_line:\\n}
   *normal_command@shortcaption C1 l18
    *brace_command_context C1
     *paragraph C1
      {normal_text:another}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l19
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
';


$result_texis{'multiple_captions'} = '@node Top
@top top

@node chap
@chapter chap

@float a, b
@caption{caption 1}
@caption{multiple}
@end float

@float c, d
@shortcaption{shortcaption 1}
@shortcaption{multiple shortc 1}

Something.

@shortcaption{another}
@end float
';


$result_texts{'multiple_captions'} = 'top
***

1 chap
******

a, b

c, d

Something.

';

$result_errors{'multiple_captions'} = '* W l9|ignoring multiple @caption
 warning: ignoring multiple @caption

* W l14|ignoring multiple @shortcaption
 warning: ignoring multiple @shortcaption

* W l18|ignoring multiple @shortcaption
 warning: ignoring multiple @shortcaption

';

$result_floats{'multiple_captions'} = 'a: 1
 F1.1: {b}
  C: caption 1
c: 1
 F1.1: {d}
  S: shortcaption 1
';

$result_nodes_list{'multiple_captions'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'multiple_captions'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'multiple_captions'} = 'level: -1
list:
 1|top
';

$result_headings_list{'multiple_captions'} = '';


$result_converted{'plaintext'}->{'multiple_captions'} = 'top
***

1 chap
******

a 1.1: caption 1

Something.

c 1.1: shortcaption 1
';


$result_converted{'html'}->{'multiple_captions'} = '<!DOCTYPE html>
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap" accesskey="1">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chap-1"><span>1 chap<a class="copiable-link" href="#chap-1"> &para;</a></span></h2>

<div class="float" id="b">
<div class="caption"><p><strong class="strong">a 1.1: </strong>caption 1</p></div></div>
<div class="float" id="d">

<p>Something.
</p>
<div class="shortcaption"><p><strong class="strong">c 1.1: </strong>shortcaption 1</p></div></div></div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'multiple_captions'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chap</sectiontitle>

<float identifier="b" type="a" number="1.1" endspaces=" "><floattype> a</floattype><floatname> b</floatname>
<caption><para>caption 1</para></caption>
<caption><para>multiple</para></caption>
</float>

<float identifier="d" type="c" number="1.1" endspaces=" "><floattype> c</floattype><floatname> d</floatname>
<shortcaption><para>shortcaption 1</para></shortcaption>
<shortcaption><para>multiple shortc 1</para></shortcaption>

<para>Something.
</para>
<shortcaption><para>another</para></shortcaption>
</float>
</chapter>
';


$result_converted{'latex'}->{'multiple_captions'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
% This is used to provide a default no-operation \'keyval\' definition
% of the "alt" key in the "Gin" ("Graphics Inclusion") family used
% by graphicx.  This prevents an "alt" attribute generating an error in
% older versions of graphicx.
\\makeatletter
\\providecommand\\KV@Gin@alt{}
\\makeatother
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\hypersetup{pdftitle={top}}

\\makeatletter
\\newcommand{\\Texinfothechapterheading}{}
\\newtitlemark{\\Texinfothechapterheading}%
\\newcommand{\\Texinfoheadingchaptername}{\\chaptername}
\\newtitlemark{\\Texinfoheadingchaptername}%
\\newcommand{\\Texinfosettitle}{No Title}%

\\newcommand{\\Texinfounnumberedchapter}[1]{\\chapter*{#1}
\\addcontentsline{toc}{chapter}{\\protect\\textbf{#1}}%
\\renewcommand{\\Texinfothechapterheading}{}%
\\chaptermark{#1}%
}%

\\newcommand{\\Texinfounnumberedpart}[1]{\\part*{#1}
\\addcontentsline{toc}{part}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfounnumberedsection}[1]{\\section*{#1}
\\addcontentsline{toc}{section}{\\protect\\textbf{#1}}%
\\sectionmark{#1}%
}%

\\newcommand{\\Texinfounnumberedsubsection}[1]{\\subsection*{#1}
\\addcontentsline{toc}{subsection}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfounnumberedsubsubsection}[1]{\\subsubsection*{#1}
\\addcontentsline{toc}{subsubsection}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfochapter}[1]{\\chapter{#1}
\\renewcommand{\\Texinfothechapterheading}{\\Texinfoheadingchaptername{} \\thechapter{} }%
}%

% new float for type `a\'
\\newfloat{TexinfoFloata}{htb}{tfl}[chapter]
\\floatname{TexinfoFloata}{a}
% new float for type `c\'
\\newfloat{TexinfoFloatc}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatc}{c}
% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\Texinfothechapterheading{}\\chaptertitle{}][][\\thepage]
                              {\\Texinfothechapterheading{}\\chaptertitle{}}{}{\\thepage}}

% allow line breaking at underscore
\\let\\Texinfounderscore\\_
\\renewcommand{\\_}{\\Texinfounderscore\\discretionary{}{}{}}
\\renewcommand{\\includegraphics}[1]{\\fbox{FIG \\detokenize{#1}}}

\\makeatother
% set default for @setchapternewpage
\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%

\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{chap}}
\\label{anchor:chap}%

\\begin{TexinfoFloata}
\\caption{caption 1}
\\caption{multiple}
\\label{anchor:b}%
\\end{TexinfoFloata}

\\begin{TexinfoFloatc}
\\caption{shortcaption 1}
\\caption{multiple shortc 1}

Something.

\\caption{another}
\\label{anchor:d}%
\\end{TexinfoFloatc}
\\end{document}
';

1;
