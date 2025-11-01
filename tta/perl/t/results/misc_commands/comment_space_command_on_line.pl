use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comment_space_command_on_line'} = '*document_root C6
 *before_node_section C2
  *@settitle C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C2
   |INFO
   |comment_at_end:
    |*@c C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:settittle}
    {Settitle }
    *@ 
  {empty_line:\\n}
 *@node C1 l3 {Top}
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
   |comment_at_end:
    |*@comment C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:@node Top}
   |spaces_after_argument:
    |{spaces_after_argument:  }
    {Top}
 *@top C2 l4 {top element@ }
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C2
   |INFO
   |comment_at_end:
    |*@comment C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:@top}
   |spaces_after_argument:
    |{spaces_after_argument: }
    {top element}
    *@ 
  {empty_line:\\n}
 *@node C1 l6 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |comment_at_end:
    |*@comment C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:@node chap}
   |spaces_after_argument:
    |{spaces_after_argument: }
    {chap}
 *@chapter C16 l7 {Chapter@ }
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C2
   |INFO
   |comment_at_end:
    |*@comment C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:@chapter}
   |spaces_after_argument:
    |{spaces_after_argument: }
    {Chapter}
    *@ 
  {empty_line:\\n}
  *@frenchspacing C1 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{on}
   *line_arg C1
   |INFO
   |comment_at_end:
    |*@c C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:comment frenchspacing}
   |spaces_after_argument:
    |{spaces_after_argument: }
    {on}
  {empty_line:\\n}
  *@microtype C1 l11
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{off}
   *line_arg C1
   |INFO
   |comment_at_end:
    |*@c C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:comment microtype}
    {off}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,1}
   *line_arg C2
   |INFO
   |comment_at_end:
    |*@c C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:index entry}
   |spaces_after_argument:
    |{spaces_after_argument: }
    {index entry }
    *@ 
  {empty_line:\\n}
  *@heading C1 l15
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C2
   |INFO
   |comment_at_end:
    |*@c C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:heading}
   |spaces_after_argument:
    |{spaces_after_argument:    }
    {Heading }
    *@ 
  {empty_line:\\n}
  *@printindex C1 l17
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |comment_at_end:
    |*@c C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:printindex }
   |spaces_after_argument:
    |{spaces_after_argument: }
    {cp}
  {empty_line:\\n}
  *@float C3 l19
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1.1}
  |float_type:{Text}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{label}
   *arguments_line C2
    *block_line_arg C1
     {Text}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {label}
   *paragraph C1
    {float\\n}
   *@end C1 l21
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{float}
    *line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:end}
    |spaces_after_argument:
     |{spaces_after_argument: }
     {float}
  {empty_line:\\n}
  *@listoffloats C1 l23
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_type:{Text  }
  |global_command_number:{1}
   *line_arg C2
   |INFO
   |comment_at_end:
    |*@c C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:listoffloats}
    {Text }
    *@ 
  {empty_line:\\n}
 *@bye C1
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
  *line_arg
  |INFO
  |comment_at_end:
   |*@c C1
   ||INFO
   ||spaces_before_argument:
    ||{spaces_before_argument: }
    |*line_arg C1
    ||INFO
    ||spaces_after_argument:
     ||{spaces_after_argument:\\n}
     |{rawline_text:bye}
';


$result_texis{'comment_space_command_on_line'} = '@settitle Settitle @ @c settittle

@node Top  @comment @node Top
@top top element@  @comment @top

@node chap @comment @node chap
@chapter Chapter@  @comment @chapter

@frenchspacing on @c comment frenchspacing

@microtype off@c comment microtype

@cindex index entry @  @c index entry

@heading Heading @     @c heading

@printindex cp @c printindex 

@float Text, label
float
@end float @c end

@listoffloats Text @ @c listoffloats

@bye @c bye
';


$result_texts{'comment_space_command_on_line'} = '
top element 
************

1 Chapter 
**********




Heading  
=========


Text, label
float


';

$result_errors{'comment_space_command_on_line'} = '';

$result_floats{'comment_space_command_on_line'} = 'Text: 1
 F1.1: {label}
';

$result_nodes_list{'comment_space_command_on_line'} = '1|Top
 associated_section: top element@ 
 associated_title_command: top element@ 
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter@ 
 associated_title_command: 1 Chapter@ 
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'comment_space_command_on_line'} = '1|top element@ 
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter@ 
 section_children:
  1|Chapter@ 
2|Chapter@ 
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top element@ 
 toplevel_directions:
  prev->top element@ 
  up->top element@ 
';

$result_sectioning_root{'comment_space_command_on_line'} = 'level: -1
list:
 1|top element@ 
';

$result_headings_list{'comment_space_command_on_line'} = '1|Heading @ 
';

$result_indices_sort_strings{'comment_space_command_on_line'} = 'cp:
 index entry  
';


$result_converted{'plaintext'}->{'comment_space_command_on_line'} = 'top element 
************

1 Chapter 
**********

Heading  
=========

* Menu:

* index entry  :                         chap.                  (line 6)

float

Text 1.1

';


$result_converted{'html_text'}->{'comment_space_command_on_line'} = '
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
[<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="top" id="top-element-"><span>top element&nbsp;<a class="copiable-link" href="#top-element-"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chapter&nbsp;</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<div class="nav-panel">
<p>
[<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="chapter" id="Chapter-"><span>1 Chapter&nbsp;<a class="copiable-link" href="#Chapter-"> &para;</a></span></h2>



<a class="index-entry-id" id="index-index-entry-"></a>

<h3 class="heading" id="Heading-"><span>Heading &nbsp;<a class="copiable-link" href="#Heading-"> &para;</a></span></h3>

<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chap_cp_letter-I">I</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-index-entry-">index entry &nbsp;</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

<div class="float" id="label">
<p>float
</p><div class="type-number-float"><p><strong class="strong">Text 1.1</strong></p></div></div>

</div>
</div>
';


$result_converted{'latex'}->{'comment_space_command_on_line'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{imakeidx}
\\usepackage[activate=false]{microtype}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfosettitle}{Settitle \\ {}}%

% new float for type `Text\'
\\newfloat{TexinfoFloatText}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatText}{}
% no index headers
\\indexsetup{level=\\relax,toclevel=section}%
\\makeindex[name=cp,title=]%

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


\\label{anchor:Top}%
\\chapter{{Chapter\\ {}}}
\\label{anchor:chap}%

\\frenchspacing

\\microtypesetup{activate=false}%

\\index[cp]{index entry  @index entry \\ {}}%

\\section*{{Heading \\ {}}}

\\printindex[cp]

\\begin{TexinfoFloatText}
float
\\label{anchor:label}%
\\end{TexinfoFloatText}


\\end{document}
';


$result_converted{'docbook_doc'}->{'comment_space_command_on_line'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book>
<title>Settitle &#160;</title><!-- settittle -->
<bookinfo><title>Settitle &#160;</title><!-- settittle -->
</bookinfo>
<chapter label="1" id="chap">
<title>Chapter&#160;</title><!-- @chapter -->



<indexterm role="cp"><primary>index entry &#160;</primary></indexterm><!-- index entry -->

<bridgehead renderas="sect1">Heading &#160;</bridgehead><!-- heading -->

<index role="cp"></index>

<anchor id="label"/>
<para>float
</para>

</chapter>
</book>
';


$result_converted{'info'}->{'comment_space_command_on_line'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)

top element 
************

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 Chapter 
**********

Heading  
=========

 [index ]
* Menu:

* index entry  :                         chap.                  (line 6)

float

Text 1.1


Tag Table:
Node: Top27
Node: chap120
Ref: label304

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'xml'}->{'comment_space_command_on_line'} = '<settitle spaces=" ">Settitle <spacecmd type="spc"/></settitle><!-- c settittle -->

<node identifier="Top" spaces=" "><nodename trailingspaces="  ">Top</nodename><nodenext automatic="on">chap</nodenext></node><!-- comment @node Top -->
<top spaces=" "><sectiontitle>top element<spacecmd type="spc"/> </sectiontitle><!-- comment @top -->

</top>
<node identifier="chap" spaces=" "><nodename trailingspaces=" ">chap</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node><!-- comment @node chap -->
<chapter spaces=" "><sectiontitle>Chapter<spacecmd type="spc"/> </sectiontitle><!-- comment @chapter -->

<frenchspacing spaces=" " value="on" line="on @c comment frenchspacing"></frenchspacing><!-- c comment frenchspacing -->

<microtype spaces=" " value="off" line="off@c comment microtype"></microtype><!-- c comment microtype -->

<cindex index="cp" spaces=" "><indexterm index="cp" number="1">index entry <spacecmd type="spc"/></indexterm></cindex> <!-- c index entry -->

<heading spaces=" ">Heading <spacecmd type="spc"/>    </heading><!-- c heading -->

<printindex spaces=" " value="cp" line="cp @c printindex "></printindex><!-- c printindex  -->

<float identifier="label" type="Text" number="1.1" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">label</floatname>
<para>float
</para></float> <!-- c end -->

<listoffloats type="Text  " spaces=" ">Text <spacecmd type="spc"/></listoffloats><!-- c listoffloats -->

</chapter>
<bye spaces=" "></bye><!-- c bye -->
';

1;
