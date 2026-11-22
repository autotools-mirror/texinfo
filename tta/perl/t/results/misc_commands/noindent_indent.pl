use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'noindent_indent'} = '*document_root C1
 *before_node_section C15
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@indent l2
   {ignorable_spaces_after_command:\\n}
  *paragraph C1
  |EXTRA
  |indent:{1}
   {normal_text:First para\\n}
  {empty_line:\\n}
  *@noindent l5
  {ignorable_spaces_after_command:\\n}
  *paragraph C2
  |EXTRA
  |noindent:{1}
   {normal_text:qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq \\n}
   {normal_text:qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q\\n}
  {empty_line:\\n}
  *@noindent l9
  {ignorable_spaces_after_command: }
  *paragraph C1
  |EXTRA
  |noindent:{1}
   {normal_text:noindent in para.\\n}
  {empty_line:\\n}
  *@indent l11
  {ignorable_spaces_after_command: }
  *paragraph C1
  |EXTRA
  |indent:{1}
   {normal_text:unneeded indent\\n}
';


$result_texis{'noindent_indent'} = '
@indent
First para

@noindent
qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q

@noindent noindent in para.

@indent unneeded indent
';


$result_texts{'noindent_indent'} = 'First para

qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q

noindent in para.

unneeded indent
';

$result_errors{'noindent_indent'} = '';

$result_nodes_list{'noindent_indent'} = '';

$result_sections_list{'noindent_indent'} = '';

$result_sectioning_root{'noindent_indent'} = '';

$result_headings_list{'noindent_indent'} = '';


$result_converted{'plaintext'}->{'noindent_indent'} = '   First para

qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q

noindent in para.

   unneeded indent
';


$result_converted{'html_text'}->{'noindent_indent'} = '<p>First para
</p>
<p>qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q
</p>
<p>noindent in para.
</p>
<p>unneeded indent
</p>';


$result_converted{'latex'}->{'noindent_indent'} = '\\documentclass{book}
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
First para

\\noindent{}qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q

\\noindent{}noindent in para.

unneeded indent
\\end{document}
';


$result_converted{'docbook'}->{'noindent_indent'} = '<para>First para
</para>
<para>qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q
</para>
<para>noindent in para.
</para>
<para>unneeded indent
</para>';

1;
