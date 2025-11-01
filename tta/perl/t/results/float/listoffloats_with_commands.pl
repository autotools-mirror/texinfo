use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'listoffloats_with_commands'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@listoffloats C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_type:{théorème}
  |global_command_number:{1}
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {th}
    *@\' C1 l1
     *following_arg C1
      {e}
    {or}
    *@` C1 l1
     *following_arg C1
      {e}
    {me}
';


$result_texis{'listoffloats_with_commands'} = '@listoffloats th@\'eor@`eme
';


$result_texts{'listoffloats_with_commands'} = '';

$result_errors{'listoffloats_with_commands'} = '';

$result_nodes_list{'listoffloats_with_commands'} = '';

$result_sections_list{'listoffloats_with_commands'} = '';

$result_sectioning_root{'listoffloats_with_commands'} = '';

$result_headings_list{'listoffloats_with_commands'} = '';


$result_converted{'plaintext'}->{'listoffloats_with_commands'} = '';


$result_converted{'html'}->{'listoffloats_with_commands'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">



</head>

<body lang="">



</body>
</html>
';

$result_converted_errors{'html'}->{'listoffloats_with_commands'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'listoffloats_with_commands'} = '<listoffloats type="théorème" spaces=" ">th<accent type="acute" bracketed="off">e</accent>or<accent type="grave" bracketed="off">e</accent>me</listoffloats>
';


$result_converted{'latex'}->{'listoffloats_with_commands'} = '\\documentclass{book}
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

\\begin{document}
\\end{document}
';

1;
