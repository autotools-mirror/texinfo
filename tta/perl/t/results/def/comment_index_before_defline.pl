use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comment_index_before_defline'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@defblock C4 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *before_defline C4
    *@c C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {rawline_text:a comment}
    *index_entry_command@cindex C1 l3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |index_entry:I{cp,1}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {entry}
    *@comment C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {rawline_text:another}
    {empty_line:\\n}
   *@defline C1 l6
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
   *@end C1 l7
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


$result_texis{'comment_index_before_defline'} = '@defblock
@c a comment
@cindex entry
@comment another

@defline a b c d
@end defblock
';


$result_texts{'comment_index_before_defline'} = '
a: b c d
';

$result_errors{'comment_index_before_defline'} = '* W l3|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'comment_index_before_defline'} = '';

$result_sections_list{'comment_index_before_defline'} = '';

$result_sectioning_root{'comment_index_before_defline'} = '';

$result_headings_list{'comment_index_before_defline'} = '';

$result_indices_sort_strings{'comment_index_before_defline'} = 'cp:
 entry
';


$result_converted{'plaintext'}->{'comment_index_before_defline'} = ' -- a: b c d
';


$result_converted{'html'}->{'comment_index_before_defline'} = '<!DOCTYPE html>
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
<dd><a class="index-entry-id" id="index-entry"></a>

</dd><dt class="defline def-line"><span class="category-def">a: </span><strong class="def-name">b</strong> <var class="def-var-arguments">c d</var></dt>
</dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'comment_index_before_defline'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'latex'}->{'comment_index_before_defline'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{imakeidx}
\\usepackage{embrac}
\\usepackage{expl3}
\\usepackage{tabularx}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfosettitle}{No Title}%

% no index headers
\\indexsetup{level=\\relax,toclevel=section}%
\\makeindex[name=cp,title=]%

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
\\index[cp]{entry@entry}%


\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{b \\EmbracOn{}\\textnormal{\\textsl{c d}}\\EmbracOff{}}& [a]
\\end{tabularx}

\\end{document}
';


$result_converted{'docbook'}->{'comment_index_before_defline'} = '<!-- a comment -->
<indexterm role="cp"><primary>entry</primary></indexterm>
<!-- another -->

<synopsis><phrase role="category"><emphasis role="bold">a</emphasis>:</phrase> <varname>b</varname> <emphasis role="arg">c</emphasis> <emphasis role="arg">d</emphasis></synopsis>
';


$result_converted{'xml'}->{'comment_index_before_defline'} = '<defblock endspaces=" ">
<beforefirstdefline><!-- c a comment -->
<cindex index="cp" spaces=" "><indexterm index="cp" number="1">entry</indexterm></cindex>
<!-- comment another -->

</beforefirstdefline><defline spaces=" "><definitionterm><defcategory>a</defcategory> <defsymbol>b</defsymbol> <defparam>c</defparam> <defparam>d</defparam></definitionterm></defline>
</defblock>
';

1;
