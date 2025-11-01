use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ref_to_float'} = '*document_root C1
 *before_node_section C8
  *preamble_before_content
  *@float C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{Text}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{Label1}
   *arguments_line C2
    *block_line_arg C1
     {Text}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Label1}
   *paragraph C1
    {Float\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{float}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {float}
  {empty_line:\\n}
  *@float C3 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{}
  |global_command_number:{2}
  |is_target:{1}
  |normalized:{Label2}
   *arguments_line C2
    *block_line_arg
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Label2}
   *paragraph C1
    {In foat 2.\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{float}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {float}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l9
    *brace_arg C1
    |EXTRA
    |node_content:{Label1}
    |normalized:{Label1}
     {Label1}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l11
    *brace_arg C1
    |EXTRA
    |node_content:{Label2}
    |normalized:{Label2}
     {Label2}
   {\\n}
';


$result_texis{'ref_to_float'} = '@float Text, Label1
Float
@end float

@float , Label2
In foat 2.
@end float

@ref{Label1}

@ref{Label2}
';


$result_texts{'ref_to_float'} = 'Text, Label1
Float

Label2
In foat 2.

Label1

Label2
';

$result_errors{'ref_to_float'} = '';

$result_floats{'ref_to_float'} = ': 1
 F1: {Label2}
Text: 1
 F1: {Label1}
';

$result_nodes_list{'ref_to_float'} = '';

$result_sections_list{'ref_to_float'} = '';

$result_sectioning_root{'ref_to_float'} = '';

$result_headings_list{'ref_to_float'} = '';


$result_converted{'plaintext'}->{'ref_to_float'} = 'Float

Text 1

In foat 2.

1
Text 1: Label1

   1: Label2
';


$result_converted{'html'}->{'ref_to_float'} = '<!DOCTYPE html>
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
<div class="float" id="Label1">
<p>Float
</p><div class="type-number-float"><p><strong class="strong">Text 1</strong></p></div></div>
<div class="float" id="Label2">
<p>In foat 2.
</p><div class="type-number-float"><p><strong class="strong">1</strong></p></div></div>
<p><a class="ref" href="#Label1">Text 1</a>
</p>
<p><a class="ref" href="#Label2">1</a>
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'ref_to_float'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'xml'}->{'ref_to_float'} = '<float identifier="Label1" type="Text" number="1" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">Label1</floatname>
<para>Float
</para></float>

<float identifier="Label2" type="" number="1" spaces=" " endspaces=" "><floatname spaces=" ">Label2</floatname>
<para>In foat 2.
</para></float>

<para><ref label="Label1"><xrefnodename>Label1</xrefnodename></ref>
</para>
<para><ref label="Label2"><xrefnodename>Label2</xrefnodename></ref>
</para>';


$result_converted{'latex'}->{'ref_to_float'} = '\\documentclass{book}
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

% new float for type `\'
\\newfloat{TexinfoFloat}{htb}{tfl}[chapter]
\\floatname{TexinfoFloat}{}
% new float for type `Text\'
\\newfloat{TexinfoFloatText}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatText}{}
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
\\begin{TexinfoFloatText}
Float
\\label{anchor:Label1}%
\\end{TexinfoFloatText}

\\begin{TexinfoFloat}
In foat 2.
\\label{anchor:Label2}%
\\end{TexinfoFloat}

\\hyperref[anchor:Label1]{Text~\\ref*{anchor:Label1}}

\\hyperref[anchor:Label2]{\\ref*{anchor:Label2}}
\\end{document}
';

1;
