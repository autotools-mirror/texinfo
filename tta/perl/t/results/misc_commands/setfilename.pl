use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'setfilename'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C5
   *@setfilename C1 l1
   |EXTRA
   |text_arg:{file_comment}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:file_comment}
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
   *@setfilename C1 l2
   |EXTRA
   |text_arg:{file_and_spaces}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:file_and_spaces}
     {spaces_after_argument:   \\n}
   *@setfilename C1 l3
   |EXTRA
   |text_arg:{file_space_comment}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:file_space_comment}
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
   *@setfilename C1 l4
    *line_arg C5
     {spaces_before_argument: }
     *@ 
     *@verb C1 l4
      *brace_container C3
       {verb_delimiter::}
       {raw: name }
       {verb_delimiter::}
     *@ 
     {spaces_after_argument:\\n}
   {empty_line:\\n}
';


$result_texis{'setfilename'} = '@setfilename file_comment@c comment
@setfilename file_and_spaces   
@setfilename file_space_comment @c comment
@setfilename @ @verb{: name :}@ 

';


$result_texts{'setfilename'} = '
';

$result_errors{'setfilename'} = '* W l2|multiple @setfilename
 warning: multiple @setfilename

* W l3|multiple @setfilename
 warning: multiple @setfilename

* W l4|multiple @setfilename
 warning: multiple @setfilename

* W l4|@verb should not appear in @setfilename
 warning: @verb should not appear in @setfilename

* E l4|bad argument to @setfilename: @ @verb{: name :}@
 bad argument to @setfilename: @ @verb{: name :}@

';

$result_nodes_list{'setfilename'} = '';

$result_sections_list{'setfilename'} = '';

$result_sectioning_root{'setfilename'} = '';

$result_headings_list{'setfilename'} = '';


$result_converted{'plaintext'}->{'setfilename'} = '';


$result_converted{'html_text'}->{'setfilename'} = '
';


$result_converted{'latex'}->{'setfilename'} = '\\documentclass{book}
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
\\end{document}
';


$result_converted{'docbook'}->{'setfilename'} = '
';


$result_converted{'info'}->{'setfilename'} = Encode::encode('utf-8', 'This is file_comment, produced from .


Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'setfilename'} = '* W |document without nodes
 warning: document without nodes

';


$result_converted{'xml'}->{'setfilename'} = '<setfilename file="file_comment"> file_comment</setfilename><!-- c comment -->
<setfilename file="file_and_spaces"> file_and_spaces   </setfilename>
<setfilename file="file_space_comment"> file_space_comment </setfilename><!-- c comment -->
<setfilename> <spacecmd type="spc"/><verb delimiter=":"> name </verb><spacecmd type="spc"/></setfilename>

';

1;
