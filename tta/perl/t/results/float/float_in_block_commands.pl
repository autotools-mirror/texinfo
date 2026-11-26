use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'float_in_block_commands'} = '*document_root C1
 *before_node_section C7
  *preamble
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@float C5 l2
   |float_number:{1}
   |float_type:{Text}
   |global_command_number:{1}
   |identifier:{in-example}
   |is_target:{1}
    *arguments_line C2
     *block_line_arg C2
      {spaces_before_argument: }
      {normal_text:Text}
     *block_line_arg C3
      {spaces_before_argument: }
      {normal_text:in example}
      {spaces_after_argument:\\n}
    *normal_command@caption C1 l3
     *brace_command_context C1
      *paragraph C1
       {normal_text:float in example}
    {spaces_after_close_brace:}
    *preformatted C1
     {normal_text:\\n}
    *normal_command@end C1 l4
    |text_arg:{float}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:float}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l5
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@float C4 l8
   |float_number:{2}
   |float_type:{Text}
   |global_command_number:{2}
   |identifier:{in-quotation}
   |is_target:{1}
    *arguments_line C2
     *block_line_arg C2
      {spaces_before_argument: }
      {normal_text:Text}
     *block_line_arg C3
      {spaces_before_argument: }
      {normal_text:in quotation}
      {spaces_after_argument:\\n}
    *normal_command@caption C1 l9
     *brace_command_context C1
      *paragraph C1
       {normal_text:float in quotation}
    {spaces_after_close_brace:\\n}
    *normal_command@end C1 l10
    |text_arg:{float}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:float}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l11
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@cartouche C3 l13
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@float C4 l14
   |float_number:{3}
   |float_type:{Text}
   |global_command_number:{3}
   |identifier:{in-cartouche}
   |is_target:{1}
    *arguments_line C2
     *block_line_arg C2
      {spaces_before_argument: }
      {normal_text:Text}
     *block_line_arg C3
      {spaces_before_argument: }
      {normal_text:in cartouche}
      {spaces_after_argument:\\n}
    *normal_command@caption C1 l15
     *brace_command_context C1
      *paragraph C1
       {normal_text:float in cartouche}
    {spaces_after_close_brace:\\n}
    *normal_command@end C1 l16
    |text_arg:{float}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:float}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l17
   |text_arg:{cartouche}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:cartouche}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'float_in_block_commands'} = '@example
@float Text, in example
@caption{float in example}
@end float
@end example

@quotation
@float Text, in quotation
@caption{float in quotation}
@end float
@end quotation

@cartouche
@float Text, in cartouche
@caption{float in cartouche}
@end float
@end cartouche

';


$result_texts{'float_in_block_commands'} = 'Text, in example


Text, in quotation

Text, in cartouche

';

$result_errors{'float_in_block_commands'} = '';

$result_floats{'float_in_block_commands'} = 'Text: 3
 F1: {in-example}
  C: float in example
 F2: {in-quotation}
  C: float in quotation
 F3: {in-cartouche}
  C: float in cartouche
';

$result_nodes_list{'float_in_block_commands'} = '';

$result_sections_list{'float_in_block_commands'} = '';

$result_sectioning_root{'float_in_block_commands'} = '';

$result_headings_list{'float_in_block_commands'} = '';


$result_converted{'plaintext'}->{'float_in_block_commands'} = '
     Text 1: float in example

     Text 2: float in quotation

Text 3: float in cartouche

';


$result_converted{'html'}->{'float_in_block_commands'} = '<!DOCTYPE html>
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

<style type="text/css">
div.example {margin-left: 3.2em}
table.cartouche {border-style: solid; border-radius: 0.5em}
</style>


</head>

<body>
<div class="example">
<div class="float" id="in-example">
<pre class="example-preformatted">

</pre><div class="caption"><p><strong class="strong">Text 1: </strong>float in example</p></div></div></div>

<blockquote class="quotation">
<div class="float" id="in-quotation">
<div class="caption"><p><strong class="strong">Text 2: </strong>float in quotation</p></div></div></blockquote>

<table class="cartouche"><tr><td>
<div class="float" id="in-cartouche">
<div class="caption"><p><strong class="strong">Text 3: </strong>float in cartouche</p></div></div></td></tr></table>




</body>
</html>
';

$result_converted_errors{'html'}->{'float_in_block_commands'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'float_in_block_commands'} = '<example endspaces=" ">
<float identifier="in-example" type="Text" number="1" endspaces=" "><floattype> Text</floattype><floatname> in example</floatname>
<caption><para>float in example</para></caption><pre xml:space="preserve">
</pre></float>
</example>

<quotation endspaces=" ">
<float identifier="in-quotation" type="Text" number="2" endspaces=" "><floattype> Text</floattype><floatname> in quotation</floatname>
<caption><para>float in quotation</para></caption>
</float>
</quotation>

<cartouche endspaces=" ">
<float identifier="in-cartouche" type="Text" number="3" endspaces=" "><floattype> Text</floattype><floatname> in cartouche</floatname>
<caption><para>float in cartouche</para></caption>
</float>
</cartouche>

';


$result_converted{'latex'}->{'float_in_block_commands'} = '\\documentclass{book}
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
\\usepackage{tcolorbox}
\\usepackage{caption}
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

% environment for non floating floats
\\newenvironment{Texinfononfloatingfloat}
  {\\ignorespaces}
  {\\ignorespacesafterend}

\\newpagestyle{single}{\\sethead[\\Texinfothechapterheading{}\\chaptertitle{}][][\\thepage]
                              {\\Texinfothechapterheading{}\\chaptertitle{}}{}{\\thepage}}

% the tcolorbox environment for @cartouche
\\newtcolorbox{Texinfocartouche}[1][]{#1}

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
\\begin{Texinfoindented}
\\begin{TexinfoFloatText}
\\caption{float in example}
\\begin{Texinfopreformatted}%
\\ttfamily 
\\end{Texinfopreformatted}
\\label{anchor:in-example}%
\\end{TexinfoFloatText}
\\end{Texinfoindented}

\\begin{quote}
\\begin{TexinfoFloatText}
\\caption{float in quotation}
\\label{anchor:in-quotation}%
\\end{TexinfoFloatText}
\\end{quote}

\\begin{Texinfocartouche}
\\begin{Texinfononfloatingfloat}
\\captionof{TexinfoFloatText}{float in cartouche}
\\label{anchor:in-cartouche}%
\\end{Texinfononfloatingfloat}
\\end{Texinfocartouche}

\\end{document}
';

1;
