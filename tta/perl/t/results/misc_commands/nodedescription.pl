use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'nodedescription'} = '*document_root C5
 *before_node_section C2
  *@nodedescription C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {out of any node}
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
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C2 l4 {top}
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
    {top}
  {empty_line:\\n}
 *@node C1 l6 {chap}
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
 *@chapter C7 l7 {Chapter}
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
  {empty_line:\\n}
  *@nodedescription C1 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@emph C1 l9
     *brace_container C1
      {first description}
    { of chapter}
  {empty_line:\\n}
  *@nodedescription C1 l11
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C2
    {second description }
    *@\\n
  {spaces_before_paragraph:  }
  *paragraph C1
   {of chapter\\n}
';


$result_texis{'nodedescription'} = '@nodedescription out of any node

@node Top
@top top

@node chap
@chapter Chapter

@nodedescription @emph{first description} of chapter

@nodedescription second description @
  of chapter
';


$result_texts{'nodedescription'} = '
top
***

1 Chapter
*********


of chapter
';

$result_errors{'nodedescription'} = '* W l1|@nodedescription outside of any node
 warning: @nodedescription outside of any node

* W l11|multiple node @nodedescription
 warning: multiple node @nodedescription

* W l11|@ should not occur at end of argument to line command
 warning: @ should not occur at end of argument to line command

';

$result_nodes_list{'nodedescription'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_description: @nodedescription @emph{first description} of chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'nodedescription'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'nodedescription'} = 'level: -1
list:
 1|top
';

$result_headings_list{'nodedescription'} = '';


$result_converted{'plaintext'}->{'nodedescription'} = 'top
***

1 Chapter
*********

of chapter
';


$result_converted{'html_text'}->{'nodedescription'} = '
<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>


<p>of chapter
</p></div>
</div>
';


$result_converted{'latex'}->{'nodedescription'} = '\\documentclass{book}
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


\\label{anchor:Top}%
\\chapter{{Chapter}}
\\label{anchor:chap}%


  of chapter
\\end{document}
';

1;
