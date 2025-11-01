use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'indent_in_command_in_paragraph'} = '*document_root C1
 *before_node_section C1
  *paragraph C5
   {In para }
   *@code C1 l1
    *brace_container C1
     *@indent l1
   {.  }
   *@asis C1 l1
    *brace_container C1
     *@b C1 l1
      *brace_container C2
       {in double command}
       *@noindent l1
   {.\\n}
';


$result_texis{'indent_in_command_in_paragraph'} = 'In para @code{@indent}.  @asis{@b{in double command@noindent}}.
';


$result_texts{'indent_in_command_in_paragraph'} = 'In para .  in double command.
';

$result_errors{'indent_in_command_in_paragraph'} = '* W l1|@indent should not appear in @code
 warning: @indent should not appear in @code

* W l1|@indent is useless inside of a paragraph
 warning: @indent is useless inside of a paragraph

* W l1|@noindent should not appear in @b
 warning: @noindent should not appear in @b

* W l1|@noindent is useless inside of a paragraph
 warning: @noindent is useless inside of a paragraph

';

$result_nodes_list{'indent_in_command_in_paragraph'} = '';

$result_sections_list{'indent_in_command_in_paragraph'} = '';

$result_sectioning_root{'indent_in_command_in_paragraph'} = '';

$result_headings_list{'indent_in_command_in_paragraph'} = '';


$result_converted{'plaintext'}->{'indent_in_command_in_paragraph'} = 'In para ‘’.  in double command.
';


$result_converted{'html_text'}->{'indent_in_command_in_paragraph'} = '<p>In para <code class="code"></code>.  <b class="b">in double command</b>.
</p>';


$result_converted{'latex'}->{'indent_in_command_in_paragraph'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfosettitle}{No Title}%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\chaptername{} \\thechapter{} \\chaptertitle{}][][\\thepage]
                              {\\chaptername{} \\thechapter{} \\chaptertitle{}}{}{\\thepage}}

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

In para \\texttt{}.  \\textbf{in double command\\noindent{}}.
\\end{document}
';

1;
