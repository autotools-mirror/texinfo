use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'footnote_in_caption'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@node C5 l2 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  {empty_line:\\n}
  *@listoffloats C1 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_type:{fl}
  |global_command_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fl}
  {empty_line:\\n}
  *@float C5 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{fl}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{label}
   *arguments_line C2
    *block_line_arg C1
     {fl}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {label}
   *paragraph C1
    {In float.\\n}
   *@caption C1 l8
    *brace_command_context C1
     *paragraph C2
      {in caption}
      *@footnote C1 l8
      |EXTRA
      |global_command_number:{1}
       *brace_command_context C1
        *paragraph C1
         {in footnote}
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
';


$result_texis{'footnote_in_caption'} = '@node Top
@node chap

@listoffloats fl

@float fl, label
In float.
@caption{in caption@footnote{in footnote}}
@end float
';


$result_texts{'footnote_in_caption'} = '

fl, label
In float.
';

$result_errors{'footnote_in_caption'} = '* W l2|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_floats{'footnote_in_caption'} = 'fl: 1
 F1: {label}
  C: in caption@footnote{in footnote}
';

$result_nodes_list{'footnote_in_caption'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'footnote_in_caption'} = '';

$result_sectioning_root{'footnote_in_caption'} = '';

$result_headings_list{'footnote_in_caption'} = '';


$result_converted{'plaintext'}->{'footnote_in_caption'} = '* Menu:

* fl 1: label.                           in caption(0)

In float.

fl 1: in caption(1)

   ---------- Footnotes ----------

   (1) in footnote

';


$result_converted{'info'}->{'footnote_in_caption'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

* Menu:

* fl 1: label.                           in caption(0)

In float.

fl 1: in caption(1)

   ---------- Footnotes ----------

   (1) in footnote


Tag Table:
Node: Top27
Node: chap74
Ref: label174
Ref: chap-Footnote-1242

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'footnote_in_caption'} = '<!DOCTYPE html>
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

<body lang="">
<a class="node-id" id="Top"></a><div class="nav-panel">
<p>
Next: <a href="#chap" accesskey="n" rel="next">chap</a> &nbsp; </p>
</div>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<a class="node-id" id="chap"></a><div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">Top</a> &nbsp; </p>
</div>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>

<dl class="listoffloats">
<dt><a href="#label">fl 1</a></dt><dd class="caption-in-listoffloats"><p>in caption<a class="footnote" id="t_flistoffloats_DOCF1_1" href="#t_flistoffloats_FOOT1_1"><sup>1</sup></a></p></dd>
</dl>

<div class="float" id="label">
<p>In float.
</p><div class="caption"><p><strong class="strong">fl 1: </strong>in caption<a class="footnote" id="DOCF1" href="#FOOT1"><sup>2</sup></a></p></div></div><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="t_flistoffloats_FOOT1_1" href="#t_flistoffloats_DOCF1_1">(1)</a></h5>
<p>in footnote</p>
<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(2)</a></h5>
<p>in footnote</p>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'footnote_in_caption'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'footnote_in_caption'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<node identifier="chap" spaces=" "><nodename>chap</nodename><nodeprev automatic="on">Top</nodeprev></node>

<listoffloats type="fl" spaces=" ">fl</listoffloats>

<float identifier="label" type="fl" number="1" spaces=" " endspaces=" "><floattype>fl</floattype><floatname spaces=" ">label</floatname>
<para>In float.
</para><caption><para>in caption<footnote><para>in footnote</para></footnote></para></caption>
</float>
';


$result_converted{'latex'}->{'footnote_in_caption'} = '\\documentclass{book}
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

% new float for type `fl\'
\\newfloat{TexinfoFloatfl}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatfl}{}
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
\\label{anchor:Top}%
\\label{anchor:chap}%

\\listof{TexinfoFloatfl}{}

\\begin{TexinfoFloatfl}
In float.
\\caption{in caption\\footnote{in footnote}}
\\label{anchor:label}%
\\end{TexinfoFloatfl}
\\end{document}
';

1;
