use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'adjacent_defline'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@defblock C5 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@defline C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{foo}
   |original_def_cmdname:{defline}
    *line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {Funoid}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {foo}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {bar}
     {delimiter:)}
   *@defline C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{foo2}
   |original_def_cmdname:{defline}
    *line_arg C10
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {Funnyoid}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {foo2}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {bar2}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {baz2}
     {delimiter:)}
   *def_item C1
    *paragraph C1
     {description\\n}
   *@end C1 l5
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


$result_texis{'adjacent_defline'} = '@defblock
@defline Funoid foo (bar)
@defline Funnyoid foo2 (bar2, baz2)
description
@end defblock
';


$result_texts{'adjacent_defline'} = 'Funoid: foo (bar)
Funnyoid: foo2 (bar2, baz2)
description
';

$result_errors{'adjacent_defline'} = '';

$result_nodes_list{'adjacent_defline'} = '';

$result_sections_list{'adjacent_defline'} = '';

$result_sectioning_root{'adjacent_defline'} = '';

$result_headings_list{'adjacent_defline'} = '';


$result_converted{'plaintext'}->{'adjacent_defline'} = ' -- Funoid: foo (bar)
 -- Funnyoid: foo2 (bar2, baz2)
     description
';


$result_converted{'html'}->{'adjacent_defline'} = '<!DOCTYPE html>
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
strong.def-name {font-family: monospace; font-weight: bold; font-size: larger}
</style>


</head>

<body lang="">
<dl class="defblock def-block">
<dt class="defline def-line"><span class="category-def">Funoid: </span><strong class="def-name">foo</strong> <var class="def-var-arguments">(bar)</var></dt>
<dt class="defline def-line"><span class="category-def">Funnyoid: </span><strong class="def-name">foo2</strong> <var class="def-var-arguments">(bar2, baz2)</var></dt>
<dd><p>description
</p></dd></dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'adjacent_defline'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'latex'}->{'adjacent_defline'} = '\\documentclass{book}
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

\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{foo \\EmbracOn{}\\textnormal{\\textsl{(bar)}}\\EmbracOff{}}& [Funoid]
\\end{tabularx}


\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{foo2 \\EmbracOn{}\\textnormal{\\textsl{(bar2, baz2)}}\\EmbracOff{}}& [Funnyoid]
\\end{tabularx}

\\begin{quote}
\\unskip{\\parskip=0pt\\noindent}%
description
\\end{quote}
\\end{document}
';


$result_converted{'docbook'}->{'adjacent_defline'} = '<synopsis><phrase role="category"><emphasis role="bold">Funoid</emphasis>:</phrase> <varname>foo</varname> (<emphasis role="arg">bar</emphasis>)</synopsis>
<synopsis><phrase role="category"><emphasis role="bold">Funnyoid</emphasis>:</phrase> <varname>foo2</varname> (<emphasis role="arg">bar2</emphasis>, <emphasis role="arg">baz2</emphasis>)</synopsis>
<blockquote><para>description
</para></blockquote>';


$result_converted{'xml'}->{'adjacent_defline'} = '<defblock endspaces=" ">
<defline spaces=" "><definitionterm><defcategory>Funoid</defcategory> <defsymbol>foo</defsymbol> <defdelimiter>(</defdelimiter><defparam>bar</defparam><defdelimiter>)</defdelimiter></definitionterm></defline>
<defline spaces=" "><definitionterm><defcategory>Funnyoid</defcategory> <defsymbol>foo2</defsymbol> <defdelimiter>(</defdelimiter><defparam>bar2</defparam><defdelimiter>,</defdelimiter> <defparam>baz2</defparam><defdelimiter>)</defdelimiter></definitionterm></defline>
<definitionitem><para>description
</para></definitionitem></defblock>
';

1;
