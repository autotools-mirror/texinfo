use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'text_block_before_defline'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
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
 *@top C2 l2 {top}
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
  {empty_line:\\n}
 *@node C1 l4 {chapt}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chapt}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapt}
 *@chapter C3 l5 {Chap}
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
    {Chap}
  {empty_line:\\n}
  *@defblock C4 l7
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *before_defline C6
    *paragraph C3
     {Some text}
     *@footnote C1 l8
     |EXTRA
     |global_command_number:{1}
      *brace_command_context C1
       *paragraph C1
        {In footnote}
     {.\\n}
    {empty_line:\\n}
    *@example C3 l10
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *preformatted C1
      {an example\\n}
     *@end C1 l12
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{example}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {example}
    {empty_line:\\n}
    *@menu C3 l14
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *menu_entry C4 l15
      {menu_entry_leading_text:* }
      *menu_entry_node C3
      |EXTRA
      |manual_content:{other_manual}
       {(}
       {other_manual}
       {)}
      {menu_entry_separator:::}
      *menu_entry_description C1
       *preformatted C1
        {\\n}
     *@end C1 l16
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
   *@defline C1 l18
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{b}
   |original_def_cmdname:{defline}
    *line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {a}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {c}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {d}
   *@end C1 l19
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defblock}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defblock}
';


$result_texis{'text_block_before_defline'} = '@node Top
@top top

@node chapt
@chapter Chap

@defblock
Some text@footnote{In footnote}.

@example
an example
@end example

@menu
* (other_manual)::
@end menu

@defline a b c d
@end defblock
';


$result_texts{'text_block_before_defline'} = 'top
***

1 Chap
******

Some text.

an example

* (other_manual)::

a: b c d
';

$result_errors{'text_block_before_defline'} = '* W l14|@menu in invalid context
 warning: @menu in invalid context

';

$result_nodes_list{'text_block_before_defline'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapt
2|chapt
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'text_block_before_defline'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chapt
 associated_node: chapt
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'text_block_before_defline'} = 'level: -1
list:
 1|top
';

$result_headings_list{'text_block_before_defline'} = '';


$result_converted{'plaintext'}->{'text_block_before_defline'} = 'top
***

* Menu:

* chapt::

1 Chap
******

     Some text(1).

          an example

* Menu:

     * (other_manual)::

 -- a: b c d

   ---------- Footnotes ----------

   (1) In footnote

';


$result_converted{'html'}->{'text_block_before_defline'} = '<!DOCTYPE html>
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
div.example {margin-left: 3.2em}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold; font-size: larger}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
</style>


</head>

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chapt" accesskey="n" rel="next">Chap</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#chapt" accesskey="1">chapt</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="chapter-level-extent" id="chapt">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<dl class="defblock def-block">
<dd><p>Some text<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>.
</p>
<div class="example">
<pre class="example-preformatted">an example
</pre></div>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="other_manual.html#Top" accesskey="1">(other_manual)</a>:</td><td class="menu-entry-description">
</td></tr>
</table>

</dd><dt class="defline def-line"><span class="category-def">a: </span><strong class="def-name">b</strong> <var class="def-var-arguments">c d</var></dt>
</dl>
</div>
</div>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>In footnote</p>
</div>



</body>
</html>
';


$result_converted{'latex'}->{'text_block_before_defline'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{embrac}
\\usepackage{expl3}
\\usepackage{tabularx}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfosettitle}{No Title}%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}


% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\chaptername{} \\thechapter{} \\chaptertitle{}][][\\thepage]
                              {\\chaptername{} \\thechapter{} \\chaptertitle{}}{}{\\thepage}}

% braces are upright in italic and slanted only in @def*
% so it is turned off here, and turned on @def* lines
\\EmbracOff{}%

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
\\chapter{{Chap}}
\\label{anchor:chapt}%

Some text\\footnote{In footnote}.

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily an example
\\end{Texinfopreformatted}
\\end{Texinfoindented}



\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{b \\EmbracOn{}\\textnormal{\\textsl{c d}}\\EmbracOff{}}& [a]
\\end{tabularx}

\\end{document}
';


$result_converted{'docbook'}->{'text_block_before_defline'} = '<chapter label="1" id="chapt">
<title>Chap</title>

<para>Some text<footnote><para>In footnote</para></footnote>.
</para>
<screen>an example
</screen>

<synopsis><phrase role="category"><emphasis role="bold">a</emphasis>:</phrase> <varname>b</varname> <emphasis role="arg">c</emphasis> <emphasis role="arg">d</emphasis></synopsis>
</chapter>
';


$result_converted{'xml'}->{'text_block_before_defline'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chapt</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

</top>
<node identifier="chapt" spaces=" "><nodename>chapt</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chap</sectiontitle>

<defblock endspaces=" ">
<beforefirstdefline><para>Some text<footnote><para>In footnote</para></footnote>.
</para>
<example endspaces=" ">
<pre xml:space="preserve">an example
</pre></example>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>(other_manual)</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</beforefirstdefline><defline spaces=" "><definitionterm><defcategory>a</defcategory> <defsymbol>b</defsymbol> <defparam>c</defparam> <defparam>d</defparam></definitionterm></defline>
</defblock>
</chapter>
';

1;
