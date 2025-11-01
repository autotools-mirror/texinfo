use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_caption'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content
  *@float C5 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{a}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{b}
   *arguments_line C2
    *block_line_arg C1
     {a}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {b}
   *paragraph C1
    {In float A, B\\n}
   *@caption C1 l3
    *brace_command_context
   {spaces_after_close_brace:\\n}
   *@end C1 l4
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
  *@float C5 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{}
  |global_command_number:{2}
  |is_target:{1}
  |normalized:{c}
   *arguments_line C2
    *block_line_arg
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {c}
   *paragraph C1
    {In float , C\\n}
   *@shortcaption C1 l8
    *brace_command_context
   {spaces_after_close_brace:\\n}
   *@end C1 l9
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
  *@float C7 l11
  |EXTRA
  |float_type:{}
  |global_command_number:{3}
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {In float\\n}
   *@shortcaption C1 l13
    *brace_command_context
   {spaces_after_close_brace:\\n}
   *@caption C1 l14
    *brace_command_context
   {spaces_after_close_brace:\\n}
   *@end C1 l15
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
';


$result_texis{'empty_caption'} = '@float a, b
In float A, B
@caption{}
@end float

@float , c
In float , C
@shortcaption{}
@end float

@float
In float
@shortcaption{}
@caption{}
@end float
';


$result_texts{'empty_caption'} = 'a, b
In float A, B

c
In float , C

In float
';

$result_errors{'empty_caption'} = '';

$result_floats{'empty_caption'} = ': 2
 F1: {c}
  S(E)
 F
  S(E)
  C(E)
a: 1
 F1: {b}
  C(E)
';

$result_nodes_list{'empty_caption'} = '';

$result_sections_list{'empty_caption'} = '';

$result_sectioning_root{'empty_caption'} = '';

$result_headings_list{'empty_caption'} = '';


$result_converted{'plaintext'}->{'empty_caption'} = 'In float A, B

a 1: 

In float , C

1: 

In float

';


$result_converted{'html'}->{'empty_caption'} = '<!DOCTYPE html>
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
<div class="float" id="b">
<p>In float A, B
</p><div class="type-number-float"><p><strong class="strong">a 1: </strong></p></div></div>
<div class="float" id="c">
<p>In float , C
</p><div class="type-number-float"><p><strong class="strong">1: </strong></p></div></div>
<div class="float">
<p>In float
</p></div>


</body>
</html>
';

$result_converted_errors{'html'}->{'empty_caption'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'empty_caption'} = '<float identifier="b" type="a" number="1" spaces=" " endspaces=" "><floattype>a</floattype><floatname spaces=" ">b</floatname>
<para>In float A, B
</para><caption></caption>
</float>

<float identifier="c" type="" number="1" spaces=" " endspaces=" "><floatname spaces=" ">c</floatname>
<para>In float , C
</para><shortcaption></shortcaption>
</float>

<float type="" endspaces=" ">
<para>In float
</para><shortcaption></shortcaption>
<caption></caption>
</float>
';


$result_converted{'latex'}->{'empty_caption'} = '\\documentclass{book}
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
% new float for type `a\'
\\newfloat{TexinfoFloata}{htb}{tfl}[chapter]
\\floatname{TexinfoFloata}{}
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
\\begin{TexinfoFloata}
In float A, B
\\caption{}
\\label{anchor:b}%
\\end{TexinfoFloata}

\\begin{TexinfoFloat}
In float , C
\\caption{}
\\label{anchor:c}%
\\end{TexinfoFloat}

\\begin{TexinfoFloat}
In float
\\caption{}
\\end{TexinfoFloat}
\\end{document}
';

1;
