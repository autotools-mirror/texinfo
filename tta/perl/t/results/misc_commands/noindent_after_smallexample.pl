use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'noindent_after_smallexample'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content
  *paragraph C1
   {normal_text:To obtain.\\n}
  *@smallexample C3 l2
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    {normal_text:$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&content-type=text/plain\'\\n}
    {normal_text:$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&content-type=text/plain\'\\n}
   *@end C1 l5
   |EXTRA
   |text_arg:{smallexample}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:smallexample}
     {spaces_after_argument:\\n}
  *@noindent l6
  {ignorable_spaces_after_command:\\n}
  *paragraph C1
  |EXTRA
  |noindent:{1}
   {normal_text:Less recent versions are also present.\\n}
';


$result_texis{'noindent_after_smallexample'} = 'To obtain.
@smallexample
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&content-type=text/plain\'
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&content-type=text/plain\'
@end smallexample
@noindent
Less recent versions are also present.
';


$result_texts{'noindent_after_smallexample'} = 'To obtain.
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&content-type=text/plain\'
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&content-type=text/plain\'
Less recent versions are also present.
';

$result_errors{'noindent_after_smallexample'} = '';

$result_nodes_list{'noindent_after_smallexample'} = '';

$result_sections_list{'noindent_after_smallexample'} = '';

$result_sectioning_root{'noindent_after_smallexample'} = '';

$result_headings_list{'noindent_after_smallexample'} = '';


$result_converted{'plaintext'}->{'noindent_after_smallexample'} = 'To obtain.
     $ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&content-type=text/plain\'
     $ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&content-type=text/plain\'
Less recent versions are also present.
';


$result_converted{'html_text'}->{'noindent_after_smallexample'} = '<p>To obtain.
</p><div class="example smallexample">
<pre class="example-preformatted">$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&amp;content-type=text/plain\'
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&amp;content-type=text/plain\'
</pre></div>
<p>Less recent versions are also present.
</p>';


$result_converted{'latex'}->{'noindent_after_smallexample'} = '\\documentclass{book}
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
To obtain.
\\begin{Texinfopreformatted}%
\\ttfamily \\footnotesize \\$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD\\&content-type=text/plain\'
\\$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD\\&content-type=text/plain\'
\\end{Texinfopreformatted}
\\noindent{}Less recent versions are also present.
\\end{document}
';

1;
