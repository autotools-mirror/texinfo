use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ref_to_float'} = '*document_root C1
 *before_node_section C8
  *preamble_before_content
  *@float C3 l1
  |EXTRA
  |float_number:{1}
  |float_type:{Text}
  |global_command_number:{1}
  |identifier:{Label1}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Label1}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Float\\n}
   *@end C1 l3
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@float C3 l5
  |EXTRA
  |float_number:{1}
  |float_type:{}
  |global_command_number:{2}
  |identifier:{Label2}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C1
     {spaces_before_argument: }
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Label2}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:In foat 2.\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l9
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Label1}
     {normal_text:Label1}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l11
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Label2}
     {normal_text:Label2}
   {normal_text:\\n}
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

<body>
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

$result_converted_errors{'html'}->{'ref_to_float'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'ref_to_float'} = '<float identifier="Label1" type="Text" number="1" endspaces=" "><floattype> Text</floattype><floatname> Label1</floatname>
<para>Float
</para></float>

<float identifier="Label2" type="" number="1" endspaces=" "><floattype> </floattype><floatname> Label2</floatname>
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
% new float for type `Text\'
\\newfloat{TexinfoFloatText}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatText}{Text}
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
