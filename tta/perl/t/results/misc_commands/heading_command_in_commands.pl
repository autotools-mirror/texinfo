use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'heading_command_in_commands'} = '*document_root C1
 *before_node_section C7
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C2
   *@code C1 l2
    *brace_container C2
     {normal_text:\\n}
     *@everyheading C1 l3
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:in code}
       {spaces_after_argument:\\n}
   {normal_text:\\n}
  {empty_line:\\n}
  *@example C3 l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    *@everyheading C1 l7
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:in example}
      {spaces_after_argument:\\n}
   *@end C1 l8
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C3 l10
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@everyheading C1 l11
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:in quotation}
     {spaces_after_argument:\\n}
   *@end C1 l12
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'heading_command_in_commands'} = '
@code{
@everyheading in code
}

@example
@everyheading in example
@end example

@quotation
@everyheading in quotation
@end quotation
';


$result_texts{'heading_command_in_commands'} = '



';

$result_errors{'heading_command_in_commands'} = '* W l3|@everyheading should not appear in @code
 warning: @everyheading should not appear in @code

* W l7|multiple @everyheading
 warning: multiple @everyheading

* W l11|multiple @everyheading
 warning: multiple @everyheading

';

$result_nodes_list{'heading_command_in_commands'} = '';

$result_sections_list{'heading_command_in_commands'} = '';

$result_sectioning_root{'heading_command_in_commands'} = '';

$result_headings_list{'heading_command_in_commands'} = '';


$result_converted{'plaintext'}->{'heading_command_in_commands'} = '‘ ’

';


$result_converted{'html_text'}->{'heading_command_in_commands'} = '<p><code class="code">
</code>
</p>

<blockquote class="quotation">
</blockquote>
';


$result_converted{'latex'}->{'heading_command_in_commands'} = '\\documentclass{book}
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
\\texttt{
\\newpagestyle{custom}{%
\\sethead[in code][][]%
{in code}{}{}%
}%
\\pagestyle{custom}%
}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\renewpagestyle{custom}{%
\\sethead[in example][][]%
{in example}{}{}%
}%
\\pagestyle{custom}%
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{quote}
\\renewpagestyle{custom}{%
\\sethead[in quotation][][]%
{in quotation}{}{}%
}%
\\pagestyle{custom}%
\\end{quote}
\\end{document}
';

1;
