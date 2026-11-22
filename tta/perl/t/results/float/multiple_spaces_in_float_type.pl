use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multiple_spaces_in_float_type'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *normal_command@float C3 l1
  |float_number:{1}
  |float_type:{Type of Float}
  |global_command_number:{1}
  |identifier:{myfloat}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Type  of  \\f  Float}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:myfloat}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:inside\\n}
   *normal_command@end C1 l3
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l5
  |float_type:{Type of Float}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Type of Float}
    {spaces_after_argument:\\n}
';


$result_texis{'multiple_spaces_in_float_type'} = '@float Type  of    Float, myfloat
inside
@end float

@listoffloats Type of Float
';


$result_texts{'multiple_spaces_in_float_type'} = 'Type  of    Float, myfloat
inside

';

$result_errors{'multiple_spaces_in_float_type'} = '';

$result_floats{'multiple_spaces_in_float_type'} = 'Type of Float: 1
 F1: {myfloat}
';

$result_nodes_list{'multiple_spaces_in_float_type'} = '';

$result_sections_list{'multiple_spaces_in_float_type'} = '';

$result_sectioning_root{'multiple_spaces_in_float_type'} = '';

$result_headings_list{'multiple_spaces_in_float_type'} = '';


$result_converted{'plaintext'}->{'multiple_spaces_in_float_type'} = 'inside

Type of Float 1

* Menu:

* Type of Float 1: myfloat.              

';


$result_converted{'html'}->{'multiple_spaces_in_float_type'} = '<!DOCTYPE html>
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
<div class="float" id="myfloat">
<p>inside
</p><div class="type-number-float"><p><strong class="strong">Type  of  &#12;  Float 1</strong></p></div></div>
<dl class="listoffloats">
<dt><a href="#myfloat">Type  of  &#12;  Float 1</a></dt><dd></dd>
</dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'multiple_spaces_in_float_type'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'multiple_spaces_in_float_type'} = '<float identifier="myfloat" type="Type of Float" number="1" endspaces=" "><floattype> Type  of  &formfeed;  Float</floattype><floatname> myfloat</floatname>
<para>inside
</para></float>

<listoffloats type="Type of Float"> Type of Float</listoffloats>
';


$result_converted{'latex'}->{'multiple_spaces_in_float_type'} = '\\documentclass{book}
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

% new float for type `Type of Float\'
\\newfloat{TexinfoFloatTypeofFloat}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatTypeofFloat}{Type  of    Float}
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
\\begin{TexinfoFloatTypeofFloat}
inside
\\label{anchor:myfloat}%
\\end{TexinfoFloatTypeofFloat}

\\listof{TexinfoFloatTypeofFloat}{}
\\end{document}
';

1;
