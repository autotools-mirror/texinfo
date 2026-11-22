use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multiple_defline'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@defblock C6 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@defline C1 l2
   |EXTRA
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Funoid}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foo}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:bar}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C2
     {normal_text:description1 description1 description1 description1 description1\\n}
     {normal_text:description1 description1 description1 description1 description1\\n}
   *@defline C1 l5
   |EXTRA
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C12
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Funnyoid}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foo2}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:bar2}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:baz2}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C2
     {normal_text:description2 description2 description2 description2 description2\\n}
     {normal_text:description2 description2 description2 description2 description2\\n}
   *@end C1 l8
   |EXTRA
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
';


$result_texis{'multiple_defline'} = '@defblock
@defline Funoid foo (bar)
description1 description1 description1 description1 description1
description1 description1 description1 description1 description1
@defline Funnyoid foo2 (bar2, baz2)
description2 description2 description2 description2 description2
description2 description2 description2 description2 description2
@end defblock
';


$result_texts{'multiple_defline'} = 'Funoid: foo (bar)
description1 description1 description1 description1 description1
description1 description1 description1 description1 description1
Funnyoid: foo2 (bar2, baz2)
description2 description2 description2 description2 description2
description2 description2 description2 description2 description2
';

$result_errors{'multiple_defline'} = '';

$result_nodes_list{'multiple_defline'} = '';

$result_sections_list{'multiple_defline'} = '';

$result_sectioning_root{'multiple_defline'} = '';

$result_headings_list{'multiple_defline'} = '';


$result_converted{'plaintext'}->{'multiple_defline'} = ' -- Funoid: foo (bar)
     description1 description1 description1 description1 description1
     description1 description1 description1 description1 description1
 -- Funnyoid: foo2 (bar2, baz2)
     description2 description2 description2 description2 description2
     description2 description2 description2 description2 description2
';


$result_converted{'html'}->{'multiple_defline'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
dt.def-line {font-size: 1rem}
strong.def-name {font-family: monospace; font-weight: bold}
</style>


</head>

<body>
<dl class="defblock def-block">
<dt class="defline def-line"><span class="category-def">Funoid: </span><strong class="def-name">foo</strong> <var class="def-var-arguments">(bar)</var></dt>
<dd><p>description1 description1 description1 description1 description1
description1 description1 description1 description1 description1
</p></dd><dt class="defline def-line"><span class="category-def">Funnyoid: </span><strong class="def-name">foo2</strong> <var class="def-var-arguments">(bar2, baz2)</var></dt>
<dd><p>description2 description2 description2 description2 description2
description2 description2 description2 description2 description2
</p></dd></dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'multiple_defline'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'latex'}->{'multiple_defline'} = '\\documentclass{book}
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

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{foo \\EmbracOn{}\\textnormal{\\textsl{(bar)}}\\EmbracOff{}}& [Funoid]
\\end{tabularx}

\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
description1 description1 description1 description1 description1
description1 description1 description1 description1 description1
\\end{Texinfoindented}

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{foo2 \\EmbracOn{}\\textnormal{\\textsl{(bar2, baz2)}}\\EmbracOff{}}& [Funnyoid]
\\end{tabularx}

\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
description2 description2 description2 description2 description2
description2 description2 description2 description2 description2
\\end{Texinfoindented}
\\end{document}
';


$result_converted{'docbook'}->{'multiple_defline'} = '<synopsis><phrase role="category"><emphasis role="bold">Funoid</emphasis>:</phrase> <varname>foo</varname> (<emphasis role="arg">bar</emphasis>)</synopsis>
<blockquote><para>description1 description1 description1 description1 description1
description1 description1 description1 description1 description1
</para></blockquote><synopsis><phrase role="category"><emphasis role="bold">Funnyoid</emphasis>:</phrase> <varname>foo2</varname> (<emphasis role="arg">bar2</emphasis>, <emphasis role="arg">baz2</emphasis>)</synopsis>
<blockquote><para>description2 description2 description2 description2 description2
description2 description2 description2 description2 description2
</para></blockquote>';


$result_converted{'xml'}->{'multiple_defline'} = '<defblock endspaces=" ">
<defline><definitionterm> <defcategory>Funoid</defcategory> <defsymbol>foo</defsymbol> <defdelimiter>(</defdelimiter><defparam>bar</defparam><defdelimiter>)</defdelimiter></definitionterm></defline>
<definitionitem><para>description1 description1 description1 description1 description1
description1 description1 description1 description1 description1
</para></definitionitem><defline><definitionterm> <defcategory>Funnyoid</defcategory> <defsymbol>foo2</defsymbol> <defdelimiter>(</defdelimiter><defparam>bar2</defparam><defdelimiter>,</defdelimiter> <defparam>baz2</defparam><defdelimiter>)</defdelimiter></definitionterm></defline>
<definitionitem><para>description2 description2 description2 description2 description2
description2 description2 description2 description2 description2
</para></definitionitem></defblock>
';

1;
