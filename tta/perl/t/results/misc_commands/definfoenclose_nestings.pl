use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'definfoenclose_nestings'} = '*document_root C1
 *before_node_section C8
  *preamble_before_content C2
   *@definfoenclose C1 l1
   |EXTRA
   |misc_args:A{phoo|//|\\}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:phoo,//,\\}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *@code C1 l3
    *brace_container C1
     *definfoenclose_command@phoo C1 l3
     |EXTRA
     |begin:{//}
     |end:{\\}
      *brace_container C1
       {normal_text:in phoo in code}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phoo C1 l5
   |EXTRA
   |begin:{//}
   |end:{\\}
    *brace_container C1
     *@code C1 l5
      *brace_container C1
       {normal_text:in code in phoo}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C1
   *definfoenclose_command@phoo C1 l7
   |EXTRA
   |begin:{//}
   |end:{\\}
    *brace_container C1
     {normal_text:\\n}
  *@center C1 l8
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:in center in phoo}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'definfoenclose_nestings'} = '@definfoenclose phoo,//,\\

@code{@phoo{in phoo in code}}.

@phoo{@code{in code in phoo}}.

@phoo{
}@center in center in phoo

';


$result_texts{'definfoenclose_nestings'} = '
in phoo in code.

in code in phoo.


in center in phoo

';

$result_errors{'definfoenclose_nestings'} = '* W l1|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* W l3|@phoo should not appear in @code
 warning: @phoo should not appear in @code

* E l7|@phoo missing closing brace
 @phoo missing closing brace

* E l9|misplaced }
 misplaced }

';

$result_nodes_list{'definfoenclose_nestings'} = '';

$result_sections_list{'definfoenclose_nestings'} = '';

$result_sectioning_root{'definfoenclose_nestings'} = '';

$result_headings_list{'definfoenclose_nestings'} = '';


$result_converted{'plaintext'}->{'definfoenclose_nestings'} = '‘//in phoo in code\\’.

   //‘in code in phoo’\\.

   // \\
                           in center in phoo

';


$result_converted{'html_text'}->{'definfoenclose_nestings'} = '
<p><code class="code">//in phoo in code\\</code>.
</p>
<p>//<code class="code">in code in phoo</code>\\.
</p>
<p>//
\\</p><div class="center">in center in phoo
</div>
';


$result_converted{'latex'}->{'definfoenclose_nestings'} = '\\documentclass{book}
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
\\texttt{in phoo in code}.

\\texttt{in code in phoo}.


\\begin{center}
in center in phoo
\\end{center}

\\end{document}
';

1;
