use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'no_empty_line_between_headings'} = '*document_root C4
 *before_node_section
 *@top C2 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  *@subheading C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Subheading}
 *@chapter C1 l3 {Chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter}
 *@section C1 l4 {Section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Section}
';


$result_texis{'no_empty_line_between_headings'} = '@top Top
@subheading Subheading
@chapter Chapter
@section Section
';


$result_texts{'no_empty_line_between_headings'} = 'Top
***
Subheading
----------
1 Chapter
*********
1.1 Section
===========
';

$result_errors{'no_empty_line_between_headings'} = '';

$result_nodes_list{'no_empty_line_between_headings'} = '';

$result_sections_list{'no_empty_line_between_headings'} = '1|Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 section_directions:
  up->Top
 toplevel_directions:
  prev->Top
  up->Top
 section_children:
  1|Section
3|Section
 section_directions:
  up->Chapter
';

$result_sectioning_root{'no_empty_line_between_headings'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'no_empty_line_between_headings'} = '1|Subheading
';


$result_converted{'plaintext'}->{'no_empty_line_between_headings'} = 'Top
***

Subheading
----------

1 Chapter
*********

1.1 Section
===========

';


$result_converted{'html_text'}->{'no_empty_line_between_headings'} = '<div class="top-level-extent" id="Top">
<h1 class="top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<h4 class="subheading" id="Subheading"><span>Subheading<a class="copiable-link" href="#Subheading"> &para;</a></span></h4>
<ul class="mini-toc">
<li><a href="#Chapter">Chapter</a></li>
</ul>
<div class="chapter-level-extent" id="Chapter">
<h2 class="chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>
<ul class="mini-toc">
<li><a href="#Section">Section</a></li>
</ul>
<div class="section-level-extent" id="Section">
<h3 class="section"><span>1.1 Section<a class="copiable-link" href="#Section"> &para;</a></span></h3>
</div>
</div>
</div>
';


$result_converted{'latex'}->{'no_empty_line_between_headings'} = '\\documentclass{book}
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

\\part*{{Top}}
\\subsection*{{Subheading}}
\\chapter{{Chapter}}
\\section{{Section}}
\\end{document}
';


$result_converted{'docbook'}->{'no_empty_line_between_headings'} = '<chapter label="">
<title>Top</title>
<bridgehead renderas="sect2">Subheading</bridgehead>
</chapter>
<chapter label="1">
<title>Chapter</title>
<sect1 label="1.1">
<title>Section</title>
</sect1>
</chapter>
';

1;
