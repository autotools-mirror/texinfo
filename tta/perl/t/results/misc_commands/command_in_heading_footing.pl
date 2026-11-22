use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'command_in_heading_footing'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content C2
   *@everyheading C1 l1
    *line_arg C6
     {spaces_before_argument: }
     {normal_text:something }
     *@thispage
     {normal_text: }
     *@thischapternum
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C5
   {normal_text:In text }
   *@thispage
   {normal_text: }
   *@thischapternum
   {normal_text: text.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:In code }
   *@code C1 l5
    *brace_container C1
     *@thissection
   {normal_text:.\\n}
';


$result_texis{'command_in_heading_footing'} = '@everyheading something @thispage @thischapternum

In text @thispage @thischapternum text.

In code @code{@thissection}.
';


$result_texts{'command_in_heading_footing'} = '
In text   text.

In code .
';

$result_errors{'command_in_heading_footing'} = '* E l3|@thispage should only appear in heading or footing
 @thispage should only appear in heading or footing

* E l3|@thischapternum should only appear in heading or footing
 @thischapternum should only appear in heading or footing

* E l5|@thissection should only appear in heading or footing
 @thissection should only appear in heading or footing

';

$result_nodes_list{'command_in_heading_footing'} = '';

$result_sections_list{'command_in_heading_footing'} = '';

$result_sectioning_root{'command_in_heading_footing'} = '';

$result_headings_list{'command_in_heading_footing'} = '';


$result_converted{'plaintext'}->{'command_in_heading_footing'} = 'In text text.

   In code ‘’.
';


$result_converted{'html_text'}->{'command_in_heading_footing'} = '
<p>In text   text.
</p>
<p>In code <code class="code"></code>.
</p>';


$result_converted{'latex'}->{'command_in_heading_footing'} = '\\documentclass{book}
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

\\newpagestyle{custom}{%
\\sethead[something \\thepage{} \\thechapter{}][][]%
{something \\thepage{} \\thechapter{}}{}{}%
}%
\\pagestyle{custom}%

\\begin{document}
In text \\thepage{} \\thechapter{} text.

In code \\texttt{Section \\thesection{} \\sectiontitle{}}.
\\end{document}
';


$result_converted{'docbook'}->{'command_in_heading_footing'} = '
<para>In text   text.
</para>
<para>In code <literal></literal>.
</para>';

1;
