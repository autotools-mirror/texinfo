use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'indent_with_command_after_without_space'} = '*document_root C1
 *before_node_section C2
  *@indent l1
  *paragraph C2
  |EXTRA
  |indent:{1}
   *@AA C1 l1
    *brace_container
   { b\\n}
';


$result_texis{'indent_with_command_after_without_space'} = '@indent@AA{} b
';


$result_texts{'indent_with_command_after_without_space'} = 'AA b
';

$result_errors{'indent_with_command_after_without_space'} = '';

$result_nodes_list{'indent_with_command_after_without_space'} = '';

$result_sections_list{'indent_with_command_after_without_space'} = '';

$result_sectioning_root{'indent_with_command_after_without_space'} = '';

$result_headings_list{'indent_with_command_after_without_space'} = '';


$result_converted{'plaintext'}->{'indent_with_command_after_without_space'} = '   Å b
';


$result_converted{'html_text'}->{'indent_with_command_after_without_space'} = '<p>&Aring; b
</p>';


$result_converted{'latex'}->{'indent_with_command_after_without_space'} = '\\documentclass{book}
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

\\AA{} b
\\end{document}
';

1;
