use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'quotation_and_author'} = '*document_root C1
 *before_node_section C10
  *preamble_before_content
  *paragraph C1
   {normal_text:Text before quotation\\n}
  {empty_line:\\n}
  *@quotation C4 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *@author C1 l4
   |EXTRA
   |global_command_number:{1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Some One}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:A quot---ation\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Text between quotation and smallquotation\\n}
  {empty_line:\\n}
  *@smallquotation C4 l10
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@author C1 l11
   |EXTRA
   |global_command_number:{2}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:An Author Name}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:in small---quotation.\\n}
   *@end C1 l13
   |EXTRA
   |text_arg:{smallquotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:smallquotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C4 l15
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Note}
     {spaces_after_argument:\\n}
   *@author C1 l16
   |EXTRA
   |global_command_number:{3}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Some Notifier}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:A Note\\n}
   *@end C1 l18
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'quotation_and_author'} = 'Text before quotation

@quotation 
@author Some One
A quot---ation
@end quotation

Text between quotation and smallquotation

@smallquotation
@author An Author Name
in small---quotation.
@end smallquotation

@quotation Note
@author Some Notifier
A Note
@end quotation
';


$result_texts{'quotation_and_author'} = 'Text before quotation

Some One
A quot--ation

Text between quotation and smallquotation

An Author Name
in small--quotation.

Note
Some Notifier
A Note
';

$result_errors{'quotation_and_author'} = '';

$result_nodes_list{'quotation_and_author'} = '';

$result_sections_list{'quotation_and_author'} = '';

$result_sectioning_root{'quotation_and_author'} = '';

$result_headings_list{'quotation_and_author'} = '';


$result_converted{'plaintext'}->{'quotation_and_author'} = 'Text before quotation

     A quot--ation
                             -- _Some One_

   Text between quotation and smallquotation

     in small--quotation.
                          -- _An Author Name_

     Note: A Note
                          -- _Some Notifier_
';


$result_converted{'html_text'}->{'quotation_and_author'} = '<p>Text before quotation
</p>
<blockquote class="quotation">
<p>A quot&mdash;ation
</p></blockquote>
<div class="center">&mdash; <em class="emph">Some One</em>
</div>
<p>Text between quotation and smallquotation
</p>
<blockquote class="quotation smallquotation">
<p>in small&mdash;quotation.
</p></blockquote>
<div class="center">&mdash; <em class="emph">An Author Name</em>
</div>
<blockquote class="quotation">
<p><b class="b">Note:</b> A Note
</p></blockquote>
<div class="center">&mdash; <em class="emph">Some Notifier</em>
</div>';


$result_converted{'xml'}->{'quotation_and_author'} = '<para>Text before quotation
</para>
<quotation endspaces=" "> 
<author> Some One</author>
<para>A quot&textmdash;ation
</para></quotation>

<para>Text between quotation and smallquotation
</para>
<smallquotation endspaces=" ">
<author> An Author Name</author>
<para>in small&textmdash;quotation.
</para></smallquotation>

<quotation endspaces=" "><quotationtype> Note</quotationtype>
<author> Some Notifier</author>
<para>A Note
</para></quotation>
';


$result_converted{'docbook'}->{'quotation_and_author'} = '<para>Text before quotation
</para>
<blockquote><attribution>Some One</attribution>
<para>A quot&#8212;ation
</para></blockquote>
<para>Text between quotation and smallquotation
</para>
<blockquote><attribution>An Author Name</attribution>
<para>in small&#8212;quotation.
</para></blockquote>
<note><attribution>Some Notifier</attribution>
<para>A Note
</para></note>';


$result_converted{'latex'}->{'quotation_and_author'} = '\\documentclass{book}
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
Text before quotation

\\begin{quote}
A quot---ation
\\end{quote}
\\begin{center}
--- \\emph{Some One}
\\end{center}

Text between quotation and smallquotation

\\begin{quote}
\\begin{footnotesize}
in small---quotation.
\\end{footnotesize}
\\end{quote}
\\begin{center}
--- \\emph{An Author Name}
\\end{center}

\\begin{quote}
\\textbf{Note:} A Note
\\end{quote}
\\begin{center}
--- \\emph{Some Notifier}
\\end{center}
\\end{document}
';

1;
