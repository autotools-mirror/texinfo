use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'heading_command_in_commands'} = '*document_root C1
 *before_node_section C6
  {empty_line:\\n}
  *paragraph C2
   *@code C1 l2
    *brace_container C2
     {\\n}
     *@everyheading C1 l3
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {in code}
   {\\n}
  {empty_line:\\n}
  *@example C3 l6
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C1
    *@everyheading C1 l7
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {in example}
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
  {empty_line:\\n}
  *@quotation C3 l10
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@everyheading C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {in quotation}
   *@end C1 l12
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
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


$result_converted{'html_text'}->{'heading_command_in_commands'} = '
<p><code class="code">
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
