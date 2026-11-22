use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_string_index_entry'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C9 l2 {chap}
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 l4
  |element_node:{chap}
  |index_entry:I{fn,1}
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@w C1 l4
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@ftable C3 l6
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l6
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l7
     |element_node:{chap}
     |index_entry:I{fn,2}
      *line_arg C3
       {spaces_before_argument: }
       *normal_command@w C1 l7
        *brace_container
       {spaces_after_argument:\\n}
   *normal_command@end C1 l8
   |text_arg:{ftable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ftable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defun C3 l10
   *def_line C1 l10
   |def_command:{defun}
   |element_node:{chap}
   |index_entry:I{fn,3}
   |original_def_cmdname:{defun}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l10
       *normal_command@w C1 l10
        *brace_container
     {spaces: }
     *def_arg C1
      *bracketed_arg l10
     {spaces: }
     *def_arg C1
      *bracketed_arg l10
     {spaces_after_argument:\\n}
   *normal_command@defunx C1 l11
   |def_command:{defun}
   |element_node:{chap}
   |index_entry:I{fn,4}
   |original_def_cmdname:{defunx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l11
       *normal_command@w C1 l11
        *brace_container
     {spaces: }
     *def_arg C1
      *bracketed_arg l11
     {spaces: }
     *def_arg C1
      *bracketed_arg l11
     {spaces_after_argument:\\n}
   *normal_command@end C1 l12
   |text_arg:{defun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l14
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
';


$result_texis{'empty_string_index_entry'} = '@node Top
@node chap

@findex @w{}

@ftable @code
@item @w{}
@end ftable

@defun {@w{}} {} {}
@defunx {@w{}} {} {}
@end defun

@printindex fn
';


$result_texts{'empty_string_index_entry'} = '



Function:   
Function:   

';

$result_errors{'empty_string_index_entry'} = '* W l2|node `chap\' not in menu
 warning: node `chap\' not in menu

* W l4|empty index key in @findex
 warning: empty index key in @findex

* W l7|empty index key in @item
 warning: empty index key in @item

* W l10|empty index key in @defun
 warning: empty index key in @defun

* W l11|empty index key in @defunx
 warning: empty index key in @defunx

';

$result_nodes_list{'empty_string_index_entry'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'empty_string_index_entry'} = '';

$result_sectioning_root{'empty_string_index_entry'} = '';

$result_headings_list{'empty_string_index_entry'} = '';


$result_converted{'info'}->{'empty_string_index_entry'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

‘’

 -- Function: 
 -- Function: 


Tag Table:
Node: Top27
Node: chap74

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'empty_string_index_entry'} = '* W l4|empty index key in @findex
 warning: empty index key in @findex

* W l7|empty index key in @item
 warning: empty index key in @item

* W l10|empty index key in @defun
 warning: empty index key in @defun

* W l11|empty index key in @defunx
 warning: empty index key in @defunx

';


$result_converted{'plaintext'}->{'empty_string_index_entry'} = '‘’

 -- Function: 
 -- Function: 

';

$result_converted_errors{'plaintext'}->{'empty_string_index_entry'} = '* W l4|empty index key in @findex
 warning: empty index key in @findex

* W l7|empty index key in @item
 warning: empty index key in @item

* W l10|empty index key in @defun
 warning: empty index key in @defun

* W l11|empty index key in @defunx
 warning: empty index key in @defunx

';


$result_converted{'html_text'}->{'empty_string_index_entry'} = '<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<a class="node-id" id="chap"></a><p class="nav-panel">
<span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>

<a class="index-entry-id" id="index-"></a>

<dl class="ftable">
<dt><a id="index--1"></a><span><code class="code"><!-- /@w --></code><a class="copiable-link" href="#index--1"> &para;</a></span></dt>
</dl>

<dl class="first-deffn first-defun-alias-first-deffn def-block">
<dt class="deffn defun-alias-deffn def-line" id="index--2"><span class="category-def">Function: </span><span><strong class="def-name"><!-- /@w --></strong><a class="copiable-link" href="#index--2"> &para;</a></span></dt>
<dt class="deffnx defunx-alias-deffnx def-cmd-deffn def-line" id="index--3"><span class="category-def">Function: </span><span><strong class="def-name"><!-- /@w --></strong><a class="copiable-link" href="#index--3"> &para;</a></span></dt>
</dl>

';

$result_converted_errors{'html_text'}->{'empty_string_index_entry'} = '* W l4|empty index key in @findex
 warning: empty index key in @findex

* W l7|empty index key in @item
 warning: empty index key in @item

* W l10|empty index key in @defun
 warning: empty index key in @defun

* W l11|empty index key in @defunx
 warning: empty index key in @defunx

';


$result_converted{'xml'}->{'empty_string_index_entry'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev></node>

<findex index="fn"> <indexterm index="fn" number="1"><w></w></indexterm></findex>

<ftable commandarg="code" endspaces=" ">
<tableentry><tableterm><item><itemformat command="code"><indexterm index="fn" number="2"><w></w></indexterm> <w></w></itemformat></item>
</tableterm></tableentry></ftable>

<defun endspaces=" "><definitionterm><indexterm index="fn" number="3"><w></w></indexterm> <defcategory automatic="on">Function</defcategory> <deffunction bracketed="on"><w></w></deffunction> <defparam bracketed="on"></defparam> <defparam bracketed="on"></defparam></definitionterm>
<defunx><definitionterm><indexterm index="fn" number="4"><w></w></indexterm> <defcategory automatic="on">Function</defcategory> <deffunction bracketed="on"><w></w></deffunction> <defparam bracketed="on"></defparam> <defparam bracketed="on"></defparam></definitionterm></defunx>
</defun>

<printindex value="fn" line=" fn"></printindex>
';


$result_converted{'latex'}->{'empty_string_index_entry'} = '\\documentclass{book}
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
\\usepackage{imakeidx}
\\usepackage{embrac}
\\usepackage{expl3}
\\usepackage{tabularx}
\\usepackage{enumitem}
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

% no index headers
\\indexsetup{level=\\relax,toclevel=section}%
\\makeindex[name=fn,title=]%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

% set defaults for lists that match Texinfo TeX formatting
\\setlist[description]{style=nextline, font=\\normalfont}

% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\Texinfothechapterheading{}\\chaptertitle{}][][\\thepage]
                              {\\Texinfothechapterheading{}\\chaptertitle{}}{}{\\thepage}}

% braces are upright in italic and slanted only in @def*
% so it is turned off here, and turned on @def* lines
\\EmbracOff{}%

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

\\index[fn]{@\\texttt{\\hbox{}}}%

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\texttt{\\hbox{}}
\\index[fn]{@\\texttt{\\hbox{}}}%
}}]
\\end{description}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{\\hbox{} \\EmbracOn{}\\textnormal{\\textsl{ }}\\EmbracOff{}}& [Function]
\\end{tabularx}

\\index[fn]{@\\texttt{\\hbox{}}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{\\hbox{} \\EmbracOn{}\\textnormal{\\textsl{ }}\\EmbracOff{}}& [Function]
\\end{tabularx}

\\index[fn]{@\\texttt{\\hbox{}}}%

\\printindex[fn]
\\end{document}
';

1;
