use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_listoffloats_with_floats'} = '*document_root C1
 *before_node_section C11
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *normal_command@float C3 l2
  |float_number:{1}
  |float_type:{}
  |global_command_number:{1}
  |identifier:{label1}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C1
     {spaces_before_argument: }
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:label1}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Label no caption.\\n}
   *normal_command@end C1 l4
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C5 l6
  |float_number:{2}
  |float_type:{}
  |global_command_number:{2}
  |identifier:{label2}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C1
     {spaces_before_argument: }
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:label2}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Label and caption.\\n}
   *normal_command@caption C1 l8
    *brace_command_context C1
     *paragraph C1
      {normal_text:caption with label}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l9
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C3 l11
  |float_type:{}
  |global_command_number:{3}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:no label no caption\\n}
   *normal_command@end C1 l13
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C5 l15
  |float_type:{}
  |global_command_number:{4}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:no label caption\\n}
   *normal_command@caption C1 l17
    *brace_command_context C1
     *paragraph C1
      {normal_text:caption no label}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l18
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l20
  |float_type:{}
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'empty_listoffloats_with_floats'} = '
@float , label1
Label no caption.
@end float

@float , label2
Label and caption.
@caption{caption with label}
@end float

@float
no label no caption
@end float

@float
no label caption
@caption{caption no label}
@end float

@listoffloats
';


$result_texts{'empty_listoffloats_with_floats'} = 'label1
Label no caption.

label2
Label and caption.

no label no caption

no label caption

';

$result_errors{'empty_listoffloats_with_floats'} = '';

$result_floats{'empty_listoffloats_with_floats'} = ': 4
 F1: {label1}
 F2: {label2}
  C: caption with label
 F
 F
  C: caption no label
';

$result_nodes_list{'empty_listoffloats_with_floats'} = '';

$result_sections_list{'empty_listoffloats_with_floats'} = '';

$result_sectioning_root{'empty_listoffloats_with_floats'} = '';

$result_headings_list{'empty_listoffloats_with_floats'} = '';


$result_converted{'plaintext'}->{'empty_listoffloats_with_floats'} = 'Label no caption.

1

Label and caption.

2: caption with label

no label no caption

no label caption

caption no label

* Menu:

* 1: label1.                             
* 2: label2.                             caption with label

';


$result_converted{'html'}->{'empty_listoffloats_with_floats'} = '<!DOCTYPE html>
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
<div class="float" id="label1">
<p>Label no caption.
</p><div class="type-number-float"><p><strong class="strong">1</strong></p></div></div>
<div class="float" id="label2">
<p>Label and caption.
</p><div class="caption"><p><strong class="strong">2: </strong>caption with label</p></div></div>
<div class="float">
<p>no label no caption
</p></div>
<div class="float">
<p>no label caption
</p><div class="caption"><p>caption no label</p></div></div>
<dl class="listoffloats">
<dt><a href="#label1">1</a></dt><dd></dd>
<dt><a href="#label2">2</a></dt><dd class="caption-in-listoffloats"><p>caption with label</p></dd>
</dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'empty_listoffloats_with_floats'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'empty_listoffloats_with_floats'} = '<preamblebeforebeginning>
</preamblebeforebeginning><float identifier="label1" type="" number="1" endspaces=" "><floattype> </floattype><floatname> label1</floatname>
<para>Label no caption.
</para></float>

<float identifier="label2" type="" number="2" endspaces=" "><floattype> </floattype><floatname> label2</floatname>
<para>Label and caption.
</para><caption><para>caption with label</para></caption>
</float>

<float type="" endspaces=" ">
<para>no label no caption
</para></float>

<float type="" endspaces=" ">
<para>no label caption
</para><caption><para>caption no label</para></caption>
</float>

<listoffloats type=""></listoffloats>
';


$result_converted{'latex'}->{'empty_listoffloats_with_floats'} = '\\documentclass{book}
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
\\begin{TexinfoFloat}
Label no caption.
\\label{anchor:label1}%
\\end{TexinfoFloat}

\\begin{TexinfoFloat}
Label and caption.
\\caption{caption with label}
\\label{anchor:label2}%
\\end{TexinfoFloat}

\\begin{TexinfoFloat}
no label no caption
\\end{TexinfoFloat}

\\begin{TexinfoFloat}
no label caption
\\caption{caption no label}
\\end{TexinfoFloat}

\\listof{TexinfoFloat}{}
\\end{document}
';

1;
