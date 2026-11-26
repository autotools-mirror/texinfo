use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text_block_before_defline'} = '*document_root C5
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chapt}
 |identifier:{chapt}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapt}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l5 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defblock C4 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_defline C6
    *paragraph C3
     {normal_text:Some text}
     *normal_command@footnote C1 l8
     |global_command_number:{1}
      *brace_command_context C1
       *paragraph C1
        {normal_text:In footnote}
     {normal_text:.\\n}
    {empty_line:\\n}
    *normal_command@example C3 l10
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *preformatted C1
      {normal_text:an example\\n}
     *normal_command@end C1 l12
     |text_arg:{example}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:example}
       {spaces_after_argument:\\n}
    {empty_line:\\n}
    *normal_command@menu C3 l14
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *menu_entry C4 l15
      {menu_entry_leading_text:* }
      *menu_entry_node C3
      |manual_content:A{1|1}
       {normal_text:(}
       {normal_text:other_manual}
       {normal_text:)}
      {menu_entry_separator:::}
      *menu_entry_description C1
       *preformatted C1
        {normal_text:\\n}
     *normal_command@end C1 l16
     |text_arg:{menu}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:menu}
       {spaces_after_argument:\\n}
    {empty_line:\\n}
   *normal_command@defline C1 l18
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:c}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:d}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l19
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
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
dt.def-line {font-size: 1rem}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapt" accesskey="n" rel="next">Chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#chapt" accesskey="1">chapt</a>:</td><td class="menu-entry-description">
</td></tr>
</table>
<hr>
<div class="chapter-level-extent" id="chapt">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
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
\\usepackage{embrac}
\\usepackage{expl3}
\\usepackage{tabularx}
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
\\Texinfochapter{{Chap}}
\\label{anchor:chapt}%

Some text\\footnote{In footnote}.

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily an example
\\end{Texinfopreformatted}
\\end{Texinfoindented}



\\smallbreak
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


$result_converted{'xml'}->{'text_block_before_defline'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapt</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chapt"><nodename> chapt</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chap</sectiontitle>

<defblock endspaces=" ">
<beforefirstdefline><para>Some text<footnote><para>In footnote</para></footnote>.
</para>
<example endspaces=" ">
<pre xml:space="preserve">an example
</pre></example>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>(other_manual)</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</beforefirstdefline><defline><definitionterm> <defcategory>a</defcategory> <defsymbol>b</defsymbol> <defparam>c</defparam> <defparam>d</defparam></definitionterm></defline>
</defblock>
</chapter>
';

1;
