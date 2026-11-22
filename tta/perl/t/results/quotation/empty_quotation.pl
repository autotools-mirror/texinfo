use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_quotation'} = '*document_root C1
 *before_node_section C8
  *preamble_before_content
  *@quotation C2 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@end C1 l2
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C2 l4
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Empty}
     {spaces_after_argument:\\n}
   *@end C1 l5
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C2 l7
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@asis C1 l7
      *brace_container
     {spaces_after_argument:\\n}
   *@end C1 l8
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C2 l10
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@*
     {spaces_after_argument:\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_quotation'} = '@quotation
@end quotation

@quotation Empty
@end quotation

@quotation @asis{}
@end quotation

@quotation @*
@end quotation
';


$result_texts{'empty_quotation'} = '
Empty


';

$result_errors{'empty_quotation'} = '';

$result_nodes_list{'empty_quotation'} = '';

$result_sections_list{'empty_quotation'} = '';

$result_sectioning_root{'empty_quotation'} = '';

$result_headings_list{'empty_quotation'} = '';


$result_converted{'plaintext'}->{'empty_quotation'} = '     Empty: 
     : 

     : 
';


$result_converted{'html_text'}->{'empty_quotation'} = '<blockquote class="quotation">
</blockquote>

<blockquote class="quotation">
</blockquote>

<blockquote class="quotation">
</blockquote>

<blockquote class="quotation">
</blockquote>
';


$result_converted{'xml'}->{'empty_quotation'} = '<quotation endspaces=" ">
</quotation>

<quotation endspaces=" "><quotationtype> Empty</quotationtype>
</quotation>

<quotation endspaces=" "><quotationtype> <asis></asis></quotationtype>
</quotation>

<quotation endspaces=" "><quotationtype> &linebreak;</quotationtype>
</quotation>
';


$result_converted{'docbook'}->{'empty_quotation'} = '<blockquote></blockquote>
<blockquote></blockquote>
<blockquote></blockquote>
<blockquote></blockquote>';


$result_converted{'latex'}->{'empty_quotation'} = '\\documentclass{book}
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
\\begin{quote}
\\end{quote}

\\begin{quote}
\\textbf{Empty:} \\end{quote}

\\begin{quote}
\\textbf{:} \\end{quote}

\\begin{quote}
\\textbf{\\leavevmode{}\\\\:} \\end{quote}
\\end{document}
';

1;
