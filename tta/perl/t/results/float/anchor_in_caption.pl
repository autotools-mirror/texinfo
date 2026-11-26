use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_caption'} = '*document_root C3
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C5 l2 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l4
  |float_type:{fl}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fl}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C5 l6
  |float_number:{1}
  |float_type:{fl}
  |global_command_number:{1}
  |identifier:{label}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:fl}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:label}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:In float.\\n}
   *normal_command@caption C1 l8
    *brace_command_context C1
     *paragraph C2
      {normal_text:in caption}
      *normal_command@anchor C1 l8
      |identifier:{in-anchor}
      |is_target:{1}
       *brace_arg C1
        {normal_text:in anchor}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l9
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
';


$result_texis{'anchor_in_caption'} = '@node Top
@node chap

@listoffloats fl

@float fl, label
In float.
@caption{in caption@anchor{in anchor}}
@end float
';


$result_texts{'anchor_in_caption'} = '

fl, label
In float.
';

$result_errors{'anchor_in_caption'} = '* W l2|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_floats{'anchor_in_caption'} = 'fl: 1
 F1: {label}
  C: in caption@anchor{in anchor}
';

$result_nodes_list{'anchor_in_caption'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'anchor_in_caption'} = '';

$result_sectioning_root{'anchor_in_caption'} = '';

$result_headings_list{'anchor_in_caption'} = '';


$result_converted{'plaintext'}->{'anchor_in_caption'} = '* Menu:

* fl 1: label.                           in caption

In float.

fl 1: in caption
';


$result_converted{'info'}->{'anchor_in_caption'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

* Menu:

* fl 1: label.                           in caption

In float.

fl 1: in caption


Tag Table:
Node: Top27
Node: chap74
Ref: label171
Ref: in anchor198

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'anchor_in_caption'} = '<!DOCTYPE html>
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

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<a class="node-id" id="chap"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>

<dl class="listoffloats">
<dt><a href="#label">fl 1</a></dt><dd class="caption-in-listoffloats"><p>in caption</p></dd>
</dl>

<div class="float" id="label">
<p>In float.
</p><div class="caption"><p><strong class="strong">fl 1: </strong>in caption<a class="anchor" id="in-anchor"></a></p></div></div>


</body>
</html>
';

$result_converted_errors{'html'}->{'anchor_in_caption'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'anchor_in_caption'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev></node>

<listoffloats type="fl"> fl</listoffloats>

<float identifier="label" type="fl" number="1" endspaces=" "><floattype> fl</floattype><floatname> label</floatname>
<para>In float.
</para><caption><para>in caption<anchor identifier="in-anchor">in anchor</anchor></para></caption>
</float>
';


$result_converted{'latex'}->{'anchor_in_caption'} = '\\documentclass{book}
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

% new float for type `fl\'
\\newfloat{TexinfoFloatfl}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatfl}{fl}
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
\\label{anchor:Top}%
\\label{anchor:chap}%

\\listof{TexinfoFloatfl}{}

\\begin{TexinfoFloatfl}
In float.
\\caption{in caption\\label{anchor:in-anchor}%
}
\\label{anchor:label}%
\\end{TexinfoFloatfl}
\\end{document}
';

1;
