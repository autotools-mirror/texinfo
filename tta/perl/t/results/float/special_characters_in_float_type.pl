use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'special_characters_in_float_type'} = '*document_root C5
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
 *normal_command@node C1 l4 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 l5 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C5 l7
  |float_number:{1.1}
  |float_type:{A < " `` ` \' \' \\aaa . --- in var}
  |global_command_number:{1}
  |identifier:{L-_003c-_0022-_0060_0060-_0060-_0027-_0027-_005caaa-_002e-_002d_002d_002d-in-var}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C5
     {spaces_before_argument: }
     {normal_text:A < " `` ` \' \' \\aaa }
     *normal_command@.
     {normal_text: --- }
     *normal_command@var C1 l7
      *brace_container C1
       {normal_text:in var}
    *block_line_arg C6
     {spaces_before_argument: }
     {normal_text:L < " `` ` \' \' \\aaa }
     *normal_command@.
     {normal_text: --- }
     *normal_command@var C1 l7
      *brace_container C1
       {normal_text:in var}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:F\\n}
   *normal_command@caption C1 l9
    *brace_command_context C1
     *paragraph C4
      {normal_text:float A < " `` ` \' \' \\aaa }
      *normal_command@.
      {normal_text: --- }
      *normal_command@var C1 l9
       *brace_container C1
        {normal_text:in var}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l10
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l12
  |float_type:{A < " `` ` \' \' \\aaa . --- in var}
  |global_command_number:{1}
   *line_arg C6
    {spaces_before_argument: }
    {normal_text:A < " `` ` \' \' \\aaa }
    *normal_command@.
    {normal_text: --- }
    *normal_command@var C1 l12
     *brace_container C1
      {normal_text:in var}
    {spaces_after_argument:\\n}
';


$result_texis{'special_characters_in_float_type'} = '@node Top
@top top

@node chap
@chapter chap

@float A < " `` ` \' \' \\aaa @. --- @var{in var}, L < " `` ` \' \' \\aaa @. --- @var{in var}
F
@caption{float A < " `` ` \' \' \\aaa @. --- @var{in var}}
@end float

@listoffloats A < " `` ` \' \' \\aaa @. --- @var{in var}
';


$result_texts{'special_characters_in_float_type'} = 'top
***

1 chap
******

A < " " ` \' \' \\aaa . -- in var, L < " " ` \' \' \\aaa . -- in var
F

';

$result_errors{'special_characters_in_float_type'} = '';

$result_floats{'special_characters_in_float_type'} = 'A < " `` ` \' \' \\aaa . --- in var: 1
 F1.1: {L-_003c-_0022-_0060_0060-_0060-_0027-_0027-_005caaa-_002e-_002d_002d_002d-in-var}
  C: float A < " `` ` \' \' \\aaa @. --- @var{in var}
';

$result_nodes_list{'special_characters_in_float_type'} = '1|Top
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

$result_sections_list{'special_characters_in_float_type'} = '1|top
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

$result_sectioning_root{'special_characters_in_float_type'} = 'level: -1
list:
 1|top
';

$result_headings_list{'special_characters_in_float_type'} = '';


$result_converted{'plaintext'}->{'special_characters_in_float_type'} = 'top
***

1 chap
******

F

A < " " \' \' \' \\aaa . -- IN VAR 1.1: float A < " " \' \' \' \\aaa .  -- IN
VAR

* Menu:

* A < " " \' \' \' \\aaa . -- IN VAR 1.1: L < " `` ` \' \' \\aaa . --- IN VAR.
                                         float A < " " \' \' \' \\aaa .  --
                                         IN VAR

';


$result_converted{'info'}->{'special_characters_in_float_type'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)

top
***

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 chap
******

F

A < " " \' \' \' \\aaa . -- IN VAR 1.1: float A < " " \' \' \' \\aaa .  -- IN
VAR

* Menu:

* A < " " \' \' \' \\aaa . -- IN VAR 1.1: L < " `` ` \' \' \\aaa . --- IN VAR.
                                         float A < " " \' \' \' \\aaa .  --
                                         IN VAR


Tag Table:
Node: Top27
Node: chap102
Ref: L < " `` ` \' \' \\aaa . --- IN VAR162

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'special_characters_in_float_type'} = '<!DOCTYPE html>
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

<div class="float" id="L-_003c-_0022-_0060_0060-_0060-_0027-_0027-_005caaa-_002e-_002d_002d_002d-in-var">
<p>F
</p><div class="caption"><p><strong class="strong">A &lt; &quot; &ldquo; &lsquo; &rsquo; &rsquo; \\aaa . &mdash; <var class="var">in var</var> 1.1: </strong>float A &lt; &quot; &ldquo; &lsquo; &rsquo; &rsquo; \\aaa . &mdash; <var class="var">in var</var></p></div></div>
<dl class="listoffloats">
<dt><a href="#L-_003c-_0022-_0060_0060-_0060-_0027-_0027-_005caaa-_002e-_002d_002d_002d-in-var">A &lt; &quot; &ldquo; &lsquo; &rsquo; &rsquo; \\aaa . &mdash; <var class="var">in var</var> 1.1</a></dt><dd class="caption-in-listoffloats"><p>float A &lt; &quot; &ldquo; &lsquo; &rsquo; &rsquo; \\aaa . &mdash; <var class="var">in var</var></p></dd>
</dl>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'special_characters_in_float_type'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chap</sectiontitle>

<float identifier="L-_003c-_0022-_0060_0060-_0060-_0027-_0027-_005caaa-_002e-_002d_002d_002d-in-var" type="A &lt; &quot; `` ` \' \' \\\\aaa . --- in var" number="1.1" endspaces=" "><floattype> A &lt; &quot; `` ` \' \' \\aaa &eosperiod; --- <var>in var</var></floattype><floatname> L &lt; &quot; &textldquo; &textlsquo; &textrsquo; &textrsquo; \\aaa &eosperiod; &textmdash; <var>in var</var></floatname>
<para>F
</para><caption><para>float A &lt; &quot; &textldquo; &textlsquo; &textrsquo; &textrsquo; \\aaa &eosperiod; &textmdash; <var>in var</var></para></caption>
</float>

<listoffloats type="A &lt; &quot; `` ` \' \' \\\\aaa . --- in var"> A &lt; &quot; &textldquo; &textlsquo; &textrsquo; &textrsquo; \\aaa &eosperiod; &textmdash; <var>in var</var></listoffloats>
</chapter>
';


$result_converted{'latex'}->{'special_characters_in_float_type'} = '\\documentclass{book}
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

% new float for type `A < " `` ` \' \' \\aaa . --- in var\'
\\newfloat{TexinfoFloatAaaainvar}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatAaaainvar}{A < " `` ` \' \' \\textbackslash{}aaa \\@. --- \\Texinfocommandstyletextvar{in var}}
% style command for var in \'cmd_text\' formatting context
\\newcommand\\Texinfocommandstyletextvar[1]{{\\normalfont{}\\textsl{#1}}}%

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

\\begin{TexinfoFloatAaaainvar}
F
\\caption{float A < " `` ` \' \' \\textbackslash{}aaa \\@. --- \\Texinfocommandstyletextvar{in var}}
\\label{anchor:L-_003c-_0022-_0060_0060-_0060-_0027-_0027-_005caaa-_002e-_002d_002d_002d-in-var}%
\\end{TexinfoFloatAaaainvar}

\\listof{TexinfoFloatAaaainvar}{}
\\end{document}
';

1;
