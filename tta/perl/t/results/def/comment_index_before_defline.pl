use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comment_index_before_defline'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@defblock C4 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_defline C4
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:a comment}
      {spaces_after_argument:\\n}
    *index_entry_command@cindex C1 l3
    |EXTRA
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:entry}
      {spaces_after_argument:\\n}
    *normal_command@comment C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:another}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
   *normal_command@defline C1 l6
   |EXTRA
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
   *normal_command@end C1 l7
   |EXTRA
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
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

$result_converted_sort_strings{'plaintext'}->{'comment_index_before_defline'} = 'cp:
 entry
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
dt.def-line {font-size: 1rem}
strong.def-name {font-family: monospace; font-weight: bold}
</style>


</head>

<body>
<dl class="defblock def-block">
<dd><a class="index-entry-id" id="index-entry"></a>

</dd><dt class="defline def-line"><span class="category-def">a: </span><strong class="def-name">b</strong> <var class="def-var-arguments">c d</var></dt>
</dl>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'comment_index_before_defline'} = 'cp:
 entry
';

$result_converted_errors{'html'}->{'comment_index_before_defline'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'latex'}->{'comment_index_before_defline'} = '\\documentclass{book}
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
\\index[cp]{entry@entry}%


\\smallbreak
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
<cindex index="cp"> <indexterm index="cp" number="1">entry</indexterm></cindex>
<!-- comment another -->

</beforefirstdefline><defline><definitionterm> <defcategory>a</defcategory> <defsymbol>b</defsymbol> <defparam>c</defparam> <defparam>d</defparam></definitionterm></defline>
</defblock>
';

1;
