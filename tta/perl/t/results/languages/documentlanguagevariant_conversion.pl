use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentlanguagevariant_conversion'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C5
   *@copying C3 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *@defivar C2 l3
     *def_line C1 l3
     |EXTRA
     |def_command:{defivar}
     |element_region:{copying}
     |index_entry:I{vr,1}
     |original_def_cmdname:{defivar}
      *block_line_arg C9
       (i){spaces_before_argument: }
       *def_category C1
       |INFO
       |inserted:{1}
        *def_line_arg C1
         {Instance Variable}
       {spaces: }
       *def_class C1
        *def_line_arg C1
         {SSS}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         {BBB}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         {CCC}
       {spaces_after_argument:\\n}
     *@end C1 l4
     |EXTRA
     |text_arg:{defivar}
      *line_arg C3
       {spaces_before_argument: }
       {defivar}
       {spaces_after_argument:\\n}
    *@end C1 l5
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@documentlanguage C1 l7
   |EXTRA
   |global_command_number:{1}
   |text_arg:{qaa}
    *line_arg C3
     {spaces_before_argument: }
     {qaa}
     {spaces_after_argument:\\n}
   *@documentlanguagevariant C1 l8
   |EXTRA
   |global_command_number:{1}
    *line_arg C3
     {spaces_before_argument: }
     {1234}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l10 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C2 l11 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l13 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
 *@chapter C19 l14 {Chap}
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
  *paragraph C4
   *@xref C2 l16
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Top}
     {Top}
    *brace_arg C2
     {spaces_before_argument: }
     {f}
   {.\\n}
   *@abbr C2 l17
    *brace_arg C1
     {A}
    *brace_arg C2
     {spaces_before_argument: }
     {Akl}
   {\\n}
  {empty_line:\\n}
  *@defivar C2 l19
   *def_line C1 l19
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{qaa}
   |documentlanguagevariant:A{1234}
   |element_node:{chap}
   |index_entry:I{vr,2}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |INFO
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{qaa}
      |documentlanguagevariant:A{1234}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {some}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {other}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {ivar}
     {spaces_after_argument:\\n}
   *@end C1 l20
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguagevariant C1 l22
  |EXTRA
  |global_command_number:{2}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *@defivar C2 l24
   *def_line C1 l24
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{qaa}
   |element_node:{chap}
   |index_entry:I{vr,3}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |INFO
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{qaa}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {after}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {reset}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {ivar}
     {spaces_after_argument:\\n}
   *@end C1 l25
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@xref C2 l27
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Top}
     {Top}
    *brace_arg C2
     {spaces_before_argument: }
     {s}
   {.\\n}
   *@abbr C2 l28
    *brace_arg C1
     {B}
    *brace_arg C2
     {spaces_before_argument: }
     {Bkl}
   {\\n}
  {empty_line:\\n}
  *@documentlanguagevariant C1 l30
  |EXTRA
  |global_command_number:{3}
   *line_arg C3
    {spaces_before_argument: }
    {1234}
    {spaces_after_argument:\\n}
  *@documentlanguage C1 l31
  |EXTRA
  |global_command_number:{2}
  |text_arg:{qaa}
   *line_arg C3
    {spaces_before_argument: }
    {qaa}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@xref C2 l33
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Top}
     {Top}
    *brace_arg C2
     {spaces_before_argument: }
     {t}
   {.\\n}
   *@abbr C2 l34
    *brace_arg C1
     {C}
    *brace_arg C2
     {spaces_before_argument: }
     {Ckl}
   {\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *@defivar C2 l37
   *def_line C1 l37
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{qaa}
   |element_node:{chap}
   |index_entry:I{vr,4}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |INFO
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{qaa}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {script}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {before}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {change}
     {spaces_after_argument:\\n}
   *@end C1 l38
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {defivar}
     {spaces_after_argument:\\n}
';


$result_texis{'documentlanguagevariant_conversion'} = '
@copying
@defivar SSS BBB CCC
@end defivar
@end copying

@documentlanguage qaa
@documentlanguagevariant 1234

@node Top
@top top

@node chap
@chapter Chap

@xref{Top, f}.
@abbr{A, Akl}

@defivar some other ivar
@end defivar

@documentlanguagevariant

@defivar after reset ivar
@end defivar

@xref{Top, s}.
@abbr{B, Bkl}

@documentlanguagevariant 1234
@documentlanguage qaa

@xref{Top, t}.
@abbr{C, Ckl}


@defivar script before change
@end defivar
';


$result_texts{'documentlanguagevariant_conversion'} = '

top
***

1 Chap
******

Top.
A (Akl)

v1234-InstV-v of some: other ivar


l-InstV-l of after: reset ivar

Top.
B (Bkl)


Top.
C (Ckl)


l-InstV-l of script: before change
';

$result_errors{'documentlanguagevariant_conversion'} = '* W l7|qaa is not a valid language code
 warning: qaa is not a valid language code

* W l8|unknown language variant: `1234\'
 warning: unknown language variant: `1234\'

* W l30|unknown language variant: `1234\'
 warning: unknown language variant: `1234\'

* W l31|qaa is not a valid language code
 warning: qaa is not a valid language code

';

$result_nodes_list{'documentlanguagevariant_conversion'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'documentlanguagevariant_conversion'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'documentlanguagevariant_conversion'} = 'level: -1
list:
 1|top
';

$result_headings_list{'documentlanguagevariant_conversion'} = '';

$result_indices_sort_strings{'documentlanguagevariant_conversion'} = 'vr:
 BBB of SSS
 before l-o-l script
 other v1234-o-v some
 reset l-o-l after
';


$result_converted{'plaintext'}->{'documentlanguagevariant_conversion'} = 'top
***

1 Chap
******

See f: Top.  A dp_v1234-(Akl)

 -- p_V1234-v1234-InstV-v of some: p_V1234-other ivar

 -- p_L-l-InstV-l of after: p_L-reset ivar

   See s: Top.  B dp_l-(Bkl)

   See t: Top.  C dp_l-(Ckl)

 -- p_L-l-InstV-l of script: p_L-before change
';

$result_converted_sort_strings{'plaintext'}->{'documentlanguagevariant_conversion'} = 'vr:
 BBB of SSS
 before l-o-l script
 other v1234-o-v some
 reset l-o-l after
';


$result_converted{'info'}->{'documentlanguagevariant_conversion'} = Encode::encode('utf-8', 'This is , produced from .

 -- p_V1234-Instance Variable of SSS: p_V1234-BBB CCC


File: ,  Node: Top,  Next: chap,  Up: (dir)

top
***

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 Chap
******

*Note f: Top.  A dp_v1234-(Akl)

 -- p_V1234-v1234-InstV-v of some: p_V1234-other ivar

 -- p_L-l-InstV-l of after: p_L-reset ivar

   *Note s: Top.  B dp_l-(Bkl)

   *Note t: Top.  C dp_l-(Ckl)

 -- p_L-l-InstV-l of script: p_L-before change


Tag Table:
Node: Top82
Node: chap157

End Tag Table


Local Variables:
coding: utf-8
Info-documentlanguage: qaa
Info-documentlanguagevariant: 1234
End:
');

$result_converted_sort_strings{'info'}->{'documentlanguagevariant_conversion'} = 'vr:
 BBB of SSS
 before l-o-l script
 other v1234-o-v some
 reset l-o-l after
';


$result_converted{'html'}->{'documentlanguagevariant_conversion'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Instance Variable of SSS: BBB CCC -->
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
dt.def-line {font-size: 1rem}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold}
</style>


</head>

<body lang="qaa-1234">


<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">Chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap" accesskey="1">Chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<p>See h_v1234-<a class="xref" href="#Top">f</a>.
<abbr class="abbr" title="Akl">A</abbr> (Akl)
</p>
<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-other-of-some"><span class="category-def">v1234-InstV-v h_V1234-of <code class="code">some</code>: </span><span><strong class="def-name">other</strong> <var class="def-var-arguments">ivar</var><a class="copiable-link" href="#index-other-of-some"> &para;</a></span></dt>
</dl>


<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-reset-of-after"><span class="category-def">l-InstV-l h_L-of <code class="code">after</code>: </span><span><strong class="def-name">reset</strong> <var class="def-var-arguments">ivar</var><a class="copiable-link" href="#index-reset-of-after"> &para;</a></span></dt>
</dl>

<p>See h_l-<a class="xref" href="#Top">s</a>.
<abbr class="abbr" title="Bkl">B</abbr> (Bkl)
</p>

<p>See h_l-<a class="xref" href="#Top">t</a>.
<abbr class="abbr" title="Ckl">C</abbr> (Ckl)
</p>

<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-before-of-script"><span class="category-def">l-InstV-l h_L-of <code class="code">script</code>: </span><span><strong class="def-name">before</strong> <var class="def-var-arguments">change</var><a class="copiable-link" href="#index-before-of-script"> &para;</a></span></dt>
</dl>
</div>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'documentlanguagevariant_conversion'} = 'vr:
 BBB of SSS
 before l-o-l script
 other v1234-o-v some
 reset l-o-l after
';


$result_converted{'docbook_doc'}->{'documentlanguagevariant_conversion'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book lang="qaa-1234">
<title>top</title>
<bookinfo><title>top</title>
<legalnotice><synopsis><indexterm role="vr"><primary>BBB of SSS</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>SSS</classname></ooclass> <property>BBB</property> <emphasis role="arg">CCC</emphasis></synopsis>
</legalnotice></bookinfo>
<chapter label="1" id="chap">
<title>Chap</title>

<para>See d_v1234-<link linkend="Top">f</link>.
<abbrev>A</abbrev> dp_v1234-(Akl)
</para>
<synopsis><indexterm role="vr"><primary>other v1234-o-v some</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>some</classname></ooclass> <property>other</property> <emphasis role="arg">ivar</emphasis></synopsis>


<synopsis><indexterm role="vr"><primary>reset l-o-l after</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>after</classname></ooclass> <property>reset</property> <emphasis role="arg">ivar</emphasis></synopsis>

<para>See d_l-<link linkend="Top">s</link>.
<abbrev>B</abbrev> dp_l-(Bkl)
</para>

<para>See d_l-<link linkend="Top">t</link>.
<abbrev>C</abbrev> dp_l-(Ckl)
</para>

<synopsis><indexterm role="vr"><primary>before l-o-l script</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>script</classname></ooclass> <property>before</property> <emphasis role="arg">change</emphasis></synopsis>
</chapter>
</book>
';


$result_converted{'latex'}->{'documentlanguagevariant_conversion'} = '\\documentclass{book}
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
\\usepackage{imakeidx}
\\usepackage{embrac}
\\usepackage{expl3}
\\usepackage{tabularx}
\\usepackage{float}
\\usepackage{babel}
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

% no index headers
\\indexsetup{level=\\relax,toclevel=section}%
\\makeindex[name=vr,title=]%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}


% this allows to select languages based on bcp47 languages locales.
\\babeladjust{
  autoload.bcp47 = on,
  autoload.bcp47.options = import
}
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


\\selectlanguage{qaa}%
\\selectlanguage{qaa-1234}%

\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:chap}%

See \\hyperref[anchor:Top]{\\chaptername~\\ref*{anchor:Top} [Top], page~\\pageref*{anchor:Top}}.
A dp\\_v1234-(Akl)


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{other \\EmbracOn{}\\textnormal{\\textsl{ivar}}\\EmbracOff{}}& [v1234-InstV-v of \\texttt{some}]
\\end{tabularx}

\\index[vr]{other of some@\\texttt{other\\ of some}}%

\\selectlanguage{qaa}%


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{reset \\EmbracOn{}\\textnormal{\\textsl{ivar}}\\EmbracOff{}}& [l-InstV-l of \\texttt{after}]
\\end{tabularx}

\\index[vr]{reset of after@\\texttt{reset\\ of after}}%

See \\hyperref[anchor:Top]{\\chaptername~\\ref*{anchor:Top} [Top], page~\\pageref*{anchor:Top}}.
B dp\\_l-(Bkl)

\\selectlanguage{qaa-1234}%
\\selectlanguage{qaa}%

See \\hyperref[anchor:Top]{\\chaptername~\\ref*{anchor:Top} [Top], page~\\pageref*{anchor:Top}}.
C dp\\_l-(Ckl)



\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{before \\EmbracOn{}\\textnormal{\\textsl{change}}\\EmbracOff{}}& [l-InstV-l of \\texttt{script}]
\\end{tabularx}

\\index[vr]{before of script@\\texttt{before\\ of script}}%
\\end{document}
';

1;
