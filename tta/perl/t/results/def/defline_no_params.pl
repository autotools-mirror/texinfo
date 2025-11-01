use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'defline_no_params'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@defblock C4 l1
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
      |{truc}
   |original_def_cmdname:{defline}
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {Builtin}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {truc}
   *def_item C1
    *paragraph C1
     {Description of truc\\n}
   *@end C1 l4
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


$result_texis{'defline_no_params'} = '@defblock
@defline Builtin truc
Description of truc
@end defblock
';


$result_texts{'defline_no_params'} = 'Builtin: truc
Description of truc
';

$result_errors{'defline_no_params'} = '';

$result_nodes_list{'defline_no_params'} = '';

$result_sections_list{'defline_no_params'} = '';

$result_sectioning_root{'defline_no_params'} = '';

$result_headings_list{'defline_no_params'} = '';


$result_converted{'plaintext'}->{'defline_no_params'} = ' -- Builtin: truc
     Description of truc
';


$result_converted{'html'}->{'defline_no_params'} = '<!DOCTYPE html>
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
<dt class="defline def-line"><span class="category-def">Builtin: </span><strong class="def-name">truc</strong></dt>
<dd><p>Description of truc
</p></dd></dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'defline_no_params'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'latex'}->{'defline_no_params'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
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
\\texttt{truc}& [Builtin]
\\end{tabularx}

\\begin{quote}
\\unskip{\\parskip=0pt\\noindent}%
Description of truc
\\end{quote}
\\end{document}
';


$result_converted{'docbook'}->{'defline_no_params'} = '<synopsis><phrase role="category"><emphasis role="bold">Builtin</emphasis>:</phrase> <varname>truc</varname></synopsis>
<blockquote><para>Description of truc
</para></blockquote>';


$result_converted{'xml'}->{'defline_no_params'} = '<defblock endspaces=" ">
<defline spaces=" "><definitionterm><defcategory>Builtin</defcategory> <defsymbol>truc</defsymbol></definitionterm></defline>
<definitionitem><para>Description of truc
</para></definitionitem></defblock>
';

1;
