use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_caption'} = '*document_root C1
 *before_node_section C6
  *preamble
  *normal_command@float C5 l1
  |float_number:{1}
  |float_type:{a}
  |global_command_number:{1}
  |identifier:{b}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:a}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:b}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:In float A, B\\n}
   *normal_command@caption C1 l3
    *brace_command_context
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l4
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C5 l6
  |float_number:{1}
  |float_type:{}
  |global_command_number:{2}
  |identifier:{c}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C1
     {spaces_before_argument: }
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:c}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:In float , C\\n}
   *normal_command@shortcaption C1 l8
    *brace_command_context
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l9
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C7 l11
  |float_type:{}
  |global_command_number:{3}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:In float\\n}
   *normal_command@shortcaption C1 l13
    *brace_command_context
   {spaces_after_close_brace:\\n}
   *normal_command@caption C1 l14
    *brace_command_context
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l15
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
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

<body>
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


$result_converted{'xml'}->{'empty_caption'} = '<float identifier="b" type="a" number="1" endspaces=" "><floattype> a</floattype><floatname> b</floatname>
<para>In float A, B
</para><caption></caption>
</float>

<float identifier="c" type="" number="1" endspaces=" "><floattype> </floattype><floatname> c</floatname>
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

% new float for type `\'
\\newfloat{TexinfoFloat}{htb}{tfl}[chapter]
\\floatname{TexinfoFloat}{}
% new float for type `a\'
\\newfloat{TexinfoFloata}{htb}{tfl}[chapter]
\\floatname{TexinfoFloata}{a}
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
