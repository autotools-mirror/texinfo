use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'definfoenclose_command_on_section_line'} = '*document_root C3
 *before_node_section C1
  *preamble C2
   *normal_command@definfoenclose C1 l1
   |misc_args:A{somed|!|:}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:somed,!,:}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
 *normal_command@top C1 l4 {A @somed{next}}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:A }
    *definfoenclose_command@somed C1 l4
    |begin:{!}
    |end:{:}
     *brace_container C1
      {normal_text:next}
    {spaces_after_argument:\\n}
';


$result_texis{'definfoenclose_command_on_section_line'} = '@definfoenclose somed,!,:

@node top
@top A @somed{next}
';


$result_texts{'definfoenclose_command_on_section_line'} = '
A next
******
';

$result_errors{'definfoenclose_command_on_section_line'} = '* W l1|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* W l4|@somed should not appear on @top line
 warning: @somed should not appear on @top line

';

$result_nodes_list{'definfoenclose_command_on_section_line'} = '1|top
 associated_section: A @somed{next}
 associated_title_command: A @somed{next}
';

$result_sections_list{'definfoenclose_command_on_section_line'} = '1|A @somed{next}
 associated_anchor_command: top
 associated_node: top
';

$result_sectioning_root{'definfoenclose_command_on_section_line'} = 'level: -1
list:
 1|A @somed{next}
';

$result_headings_list{'definfoenclose_command_on_section_line'} = '';


$result_converted{'plaintext'}->{'definfoenclose_command_on_section_line'} = 'A !next:
********

';


$result_converted{'html_text'}->{'definfoenclose_command_on_section_line'} = '
<div class="top-level-extent" id="Top">
<h1 class="top" id="A-next"><span>A !next:<a class="copiable-link" href="#A-next"> &para;</a></span></h1>
</div>
';


$result_converted{'latex'}->{'definfoenclose_command_on_section_line'} = '\\documentclass{book}
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

\\hypersetup{pdftitle={A next}}

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
\\label{anchor:Top}%

(`Top\' node ignored)
\\end{document}
';

1;
