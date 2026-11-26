use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comments_in_text'} = '*document_root C1
 *before_node_section C5
  *before_beginning C1
   {empty_line:\\n}
  *preamble C2
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:lone comment}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C6
   {normal_text:Text line followed by a comment on the same line and another below }
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:comment}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:comment}
     {spaces_after_argument:\\n}
   {normal_text:Text line after the comment followed by a comment }
   *normal_command@comment C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:c}
     {spaces_after_argument:\\n}
   {normal_text:Text line after the text line followed by the comment.\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:Comment at the end of the line }
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:comment}
     {spaces_after_argument:\\n}
';


$result_texis{'comments_in_text'} = '
@c lone comment

Text line followed by a comment on the same line and another below @c comment
@c comment
Text line after the comment followed by a comment @comment c
Text line after the text line followed by the comment.

Comment at the end of the line @c comment
';


$result_texts{'comments_in_text'} = '
Text line followed by a comment on the same line and another below Text line after the comment followed by a comment Text line after the text line followed by the comment.

Comment at the end of the line ';

$result_errors{'comments_in_text'} = '';

$result_nodes_list{'comments_in_text'} = '';

$result_sections_list{'comments_in_text'} = '';

$result_sectioning_root{'comments_in_text'} = '';

$result_headings_list{'comments_in_text'} = '';


$result_converted{'plaintext'}->{'comments_in_text'} = 'Text line followed by a comment on the same line and another below Text
line after the comment followed by a comment Text line after the text
line followed by the comment.

   Comment at the end of the line
';


$result_converted{'html_text'}->{'comments_in_text'} = '
<p>Text line followed by a comment on the same line and another below Text line after the comment followed by a comment Text line after the text line followed by the comment.
</p>
<p>Comment at the end of the line </p>';


$result_converted{'latex'}->{'comments_in_text'} = '\\documentclass{book}
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
Text line followed by a comment on the same line and another below Text line after the comment followed by a comment Text line after the text line followed by the comment.

Comment at the end of the line \\end{document}
';


$result_converted{'docbook'}->{'comments_in_text'} = '<!-- lone comment -->

<para>Text line followed by a comment on the same line and another below <!-- comment -->
<!-- comment -->
Text line after the comment followed by a comment <!-- c -->
Text line after the text line followed by the comment.
</para>
<para>Comment at the end of the line <!-- comment -->
</para>';

1;
