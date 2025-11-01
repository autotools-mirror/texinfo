use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'space_at_commands_end_quotation_line'} = '*document_root C1
 *before_node_section C3
  *@quotation C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C3
     *@@
     { at the end of line }
     *@\\n
   *paragraph C5
    {A }
    *@@
    { at the end of the }
    *@@
    {quotation line.\\n}
   *@end C1 l3
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
  {empty_line:\\n}
  *@quotation C3 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C4
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@@
     *@ 
     { at the end of line }
     *@ 
   *paragraph C6
    {A }
    *@@
    *@ 
    { at the end of the }
    *@@
    {quotation line.\\n}
   *@end C1 l7
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


$result_texis{'space_at_commands_end_quotation_line'} = '@quotation @@ at the end of line @
A @@ at the end of the @@quotation line.
@end quotation

@quotation @@@  at the end of line @ 
A @@@  at the end of the @@quotation line.
@end quotation
';


$result_texts{'space_at_commands_end_quotation_line'} = '@ at the end of line  
A @ at the end of the @quotation line.

@  at the end of line  
A @  at the end of the @quotation line.
';

$result_errors{'space_at_commands_end_quotation_line'} = '* W l1|@ should not occur at end of argument to line command
 warning: @ should not occur at end of argument to line command

';

$result_nodes_list{'space_at_commands_end_quotation_line'} = '';

$result_sections_list{'space_at_commands_end_quotation_line'} = '';

$result_sectioning_root{'space_at_commands_end_quotation_line'} = '';

$result_headings_list{'space_at_commands_end_quotation_line'} = '';


$result_converted{'plaintext'}->{'space_at_commands_end_quotation_line'} = '     @ at the end of line  : A @ at the end of the @quotation line.

     @  at the end of line  : A @  at the end of the @quotation line.
';


$result_converted{'html_text'}->{'space_at_commands_end_quotation_line'} = '<blockquote class="quotation">
<p><b class="b">@ at the end of line &nbsp;:</b> A @ at the end of the @quotation line.
</p></blockquote>

<blockquote class="quotation">
<p><b class="b">@&nbsp; at the end of line &nbsp;:</b> A @&nbsp; at the end of the @quotation line.
</p></blockquote>
';


$result_converted{'xml'}->{'space_at_commands_end_quotation_line'} = '<quotation spaces=" " endspaces=" "><quotationtype>&arobase; at the end of line <spacecmd type="nl"/></quotationtype>
<para>A &arobase; at the end of the &arobase;quotation line.
</para></quotation>

<quotation spaces=" " endspaces=" "><quotationtype>&arobase;<spacecmd type="spc"/> at the end of line <spacecmd type="spc"/></quotationtype>
<para>A &arobase;<spacecmd type="spc"/> at the end of the &arobase;quotation line.
</para></quotation>
';


$result_converted{'docbook'}->{'space_at_commands_end_quotation_line'} = '<blockquote><para><emphasis role="bold">@ at the end of line &#160;:</emphasis> A @ at the end of the @quotation line.
</para></blockquote>
<blockquote><para><emphasis role="bold">@&#160; at the end of line &#160;:</emphasis> A @&#160; at the end of the @quotation line.
</para></blockquote>';


$result_converted{'latex'}->{'space_at_commands_end_quotation_line'} = '\\documentclass{book}
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

\\begin{quote}
\\textbf{@ at the end of line \\ {}:} A @ at the end of the @quotation line.
\\end{quote}

\\begin{quote}
\\textbf{@\\ {} at the end of line \\ {}:} A @\\ {} at the end of the @quotation line.
\\end{quote}
\\end{document}
';

1;
