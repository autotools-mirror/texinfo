use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'subentries'} = '*document_root C5
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
 *normal_command@top C2 l2
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chapter index}
 |identifier:{chapter-index}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter index}
    {spaces_after_argument:\\n}
 *normal_command@chapter C14 l5 {Index}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Index}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l7
  |element_node:{chapter-index}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a---a}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l8
  |element_node:{chapter-index}
  |index_entry:I{cp,2}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:b---b}
    {spaces_after_argument: }
    *normal_command@subentry C1 l8
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:c---c}
      {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l9
  |element_node:{chapter-index}
  |index_entry:I{cp,3}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:d---dd}
    {spaces_after_argument: }
    *normal_command@subentry C1 l9
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:e---ee}
      {spaces_after_argument: }
      *normal_command@subentry C1 l9
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:f---ff}
        {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l10
  |element_node:{chapter-index}
  |index_entry:I{cp,4}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:g---gg}
    {spaces_after_argument: }
    *normal_command@subentry C1 l10
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:h---hh jjj}
      {spaces_after_argument: }
      *normal_command@subentry C1 l10
       *line_arg C4
        {spaces_before_argument: }
        {normal_text:k---kk}
        {spaces_after_argument: }
        *normal_command@subentry C1 l10
         *line_arg C3
          {spaces_before_argument: }
          {normal_text:l---ll}
          {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 l12
  |element_node:{chapter-index}
  |index_entry:I{fn,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:f---aa}
    {spaces_after_argument:\\n}
  *index_entry_command@findex C1 l13
  |element_node:{chapter-index}
  |index_entry:I{fn,2}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:f---bb}
    {spaces_after_argument: }
    *normal_command@subentry C1 l13
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:f---cc}
      {spaces_after_argument:\\n}
  *index_entry_command@findex C1 l14
  |element_node:{chapter-index}
  |index_entry:I{fn,3}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:f---ddd}
    {spaces_after_argument: }
    *normal_command@subentry C1 l14
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:f---eee}
      {spaces_after_argument: }
      *normal_command@subentry C1 l14
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:ffff}
        {spaces_after_argument:\\n}
  *index_entry_command@findex C1 l15
  |element_node:{chapter-index}
  |index_entry:I{fn,4}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:f---ggg}
    {spaces_after_argument: }
    *normal_command@subentry C1 l15
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:f---hhh fjjj}
      {spaces_after_argument: }
      *normal_command@subentry C1 l15
       *line_arg C4
        {spaces_before_argument: }
        {normal_text:f---kkk}
        {spaces_after_argument: }
        *normal_command@subentry C1 l15
         *line_arg C3
          {spaces_before_argument: }
          {normal_text:f---lll}
          {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l17
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  *normal_command@printindex C1 l18
  |global_command_number:{2}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
';


$result_texis{'subentries'} = '@node Top
@top

@node chapter index
@chapter Index

@cindex a---a
@cindex b---b @subentry c---c
@cindex d---dd @subentry e---ee @subentry f---ff
@cindex g---gg @subentry h---hh jjj @subentry k---kk @subentry l---ll

@findex f---aa
@findex f---bb @subentry f---cc
@findex f---ddd @subentry f---eee @subentry ffff
@findex f---ggg @subentry f---hhh fjjj @subentry f---kkk @subentry f---lll

@printindex cp
@printindex fn
';


$result_texts{'subentries'} = '
1 Index
*******



';

$result_errors{'subentries'} = '* E l10|no more than two levels of index subentry are allowed
 no more than two levels of index subentry are allowed

* E l15|no more than two levels of index subentry are allowed
 no more than two levels of index subentry are allowed

';

$result_nodes_list{'subentries'} = '1|Top
 associated_section
 associated_title_command
 node_directions:
  next->chapter index
2|chapter index
 associated_section: 1 Index
 associated_title_command: 1 Index
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'subentries'} = '1
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Index
 section_children:
  1|Index
2|Index
 associated_anchor_command: chapter index
 associated_node: chapter index
 section_directions:
  up->
 toplevel_directions:
  prev->
  up->
';

$result_sectioning_root{'subentries'} = 'level: -1
list:
 1|
';

$result_headings_list{'subentries'} = '';

$result_indices_sort_strings{'subentries'} = 'cp:
 a--a
 b--b, c--c
 d--dd, e--ee, f--ff
 g--gg, h--hh jjj, k--kk, l--ll
fn:
 f---aa
 f---bb, f---cc
 f---ddd, f---eee, ffff
 f---ggg, f---hhh fjjj, f---kkk, f---lll
';


$result_converted{'docbook'}->{'subentries'} = '<chapter label="1" id="chapter-index">
<title>Index</title>

<indexterm role="cp"><primary>a&#8212;a</primary></indexterm>
<indexterm role="cp"><primary>b&#8212;b</primary><secondary>c&#8212;c</secondary></indexterm><indexterm role="cp"><primary>d&#8212;dd</primary><secondary>e&#8212;ee</secondary><tertiary>f&#8212;ff</tertiary></indexterm><indexterm role="cp"><primary>g&#8212;gg</primary><secondary>h&#8212;hh jjj</secondary><tertiary>k&#8212;kk</tertiary><tertiary>l&#8212;ll</tertiary></indexterm>
<indexterm role="fn"><primary>f---aa</primary></indexterm>
<indexterm role="fn"><primary>f---bb</primary><secondary>f---cc</secondary></indexterm><indexterm role="fn"><primary>f---ddd</primary><secondary>f---eee</secondary><tertiary>ffff</tertiary></indexterm><indexterm role="fn"><primary>f---ggg</primary><secondary>f---hhh fjjj</secondary><tertiary>f---kkk</tertiary><tertiary>f---lll</tertiary></indexterm>
<index role="cp"></index>
<index role="fn"></index>
</chapter>
';


$result_converted{'info'}->{'subentries'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chapter index,  Up: (dir)

* Menu:

* chapter index::


File: ,  Node: chapter index,  Prev: Top,  Up: Top

1 Index
*******

 [index ]
* Menu:

* a--a:                                  chapter index.         (line 6)
* b--b, c--c:                            chapter index.         (line 6)
* d--dd, e--ee, f--ff:                   chapter index.         (line 6)
* g--gg, h--hh jjj, k--kk, l--ll:        chapter index.         (line 6)

 [index ]
* Menu:

* f---aa:                                chapter index.         (line 6)
* f---bb, f---cc:                        chapter index.         (line 6)
* f---ddd, f---eee, ffff:                chapter index.         (line 6)
* f---ggg, f---hhh fjjj, f---kkk, f---lll: chapter index.       (line 6)


Tag Table:
Node: Top27
Node: chapter index111
Ref: Index: cp182
Ref: Index: fn496

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_sort_strings{'info'}->{'subentries'} = 'cp:
 a--a
 b--b, c--c
 d--dd, e--ee, f--ff
 g--gg, h--hh jjj, k--kk, l--ll
fn:
 f---aa
 f---bb, f---cc
 f---ddd, f---eee, ffff
 f---ggg, f---hhh fjjj, f---kkk, f---lll
';


$result_converted{'plaintext'}->{'subentries'} = '1 Index
*******

* Menu:

* a--a:                                  chapter index.         (line 3)
* b--b, c--c:                            chapter index.         (line 3)
* d--dd, e--ee, f--ff:                   chapter index.         (line 3)
* g--gg, h--hh jjj, k--kk, l--ll:        chapter index.         (line 3)

* Menu:

* f---aa:                                chapter index.         (line 3)
* f---bb, f---cc:                        chapter index.         (line 3)
* f---ddd, f---eee, ffff:                chapter index.         (line 3)
* f---ggg, f---hhh fjjj, f---kkk, f---lll: chapter index.       (line 3)

';

$result_converted_sort_strings{'plaintext'}->{'subentries'} = 'cp:
 a--a
 b--b, c--c
 d--dd, e--ee, f--ff
 g--gg, h--hh jjj, k--kk, l--ll
fn:
 f---aa
 f---bb, f---cc
 f---ddd, f---eee, ffff
 f---ggg, f---hhh fjjj, f---kkk, f---lll
';


$result_converted{'html_text'}->{'subentries'} = '<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button">[<a href="#chapter-index" title="Index" rel="index">Index</a>]</span></p>
<a class="top" id="SEC_Top"></a>
<ul class="mini-toc">
<li><a href="#chapter-index">Index</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter-index">
<p class="nav-panel">
<span class="nav-button">[<a href="#chapter-index" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="Index"><span>1 Index<a class="copiable-link" href="#Index"> &para;</a></span></h2>

<a class="index-entry-id" id="index-a_002d_002d_002da"></a>
<a class="index-entry-id" id="index-b_002d_002d_002db-c_002d_002d_002dc"></a>
<a class="index-entry-id" id="index-d_002d_002d_002ddd-e_002d_002d_002dee-f_002d_002d_002dff"></a>
<a class="index-entry-id" id="index-g_002d_002d_002dgg-h_002d_002d_002dhh-jjj-k_002d_002d_002dkk-l_002d_002d_002dll"></a>

<a class="index-entry-id" id="index-f_002d_002d_002daa"></a>
<a class="index-entry-id" id="index-f_002d_002d_002dbb-f_002d_002d_002dcc"></a>
<a class="index-entry-id" id="index-f_002d_002d_002dddd-f_002d_002d_002deee-ffff"></a>
<a class="index-entry-id" id="index-f_002d_002d_002dggg-f_002d_002d_002dhhh-fjjj-f_002d_002d_002dkkk-f_002d_002d_002dlll"></a>

<div class="printindex cp-printindex">
<table class="index-letters-header-printindex cp-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chapter-index_cp_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter-index_cp_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter-index_cp_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter-index_cp_letter-G"><b>G</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chapter-index_cp_letter-A">A</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-a_002d_002d_002da">a&mdash;a</a></td><td class="printindex-index-section"><a href="#chapter-index">chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chapter-index_cp_letter-B">B</th></tr>
<tr><td class="printindex-index-entry">b&mdash;b</td><td></td></tr>
<tr><td class="printindex-index-subentry-level-1"><a href="#index-b_002d_002d_002db-c_002d_002d_002dc">c&mdash;c</a></td><td class="printindex-index-section"><a href="#chapter-index">chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chapter-index_cp_letter-D">D</th></tr>
<tr><td class="printindex-index-entry">d&mdash;dd</td><td></td></tr>
<tr><td class="printindex-index-subentry-level-1">e&mdash;ee</td><td></td></tr>
<tr><td class="printindex-index-subentry-level-2"><a href="#index-d_002d_002d_002ddd-e_002d_002d_002dee-f_002d_002d_002dff">f&mdash;ff</a></td><td class="printindex-index-section"><a href="#chapter-index">chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chapter-index_cp_letter-G">G</th></tr>
<tr><td class="printindex-index-entry">g&mdash;gg</td><td></td></tr>
<tr><td class="printindex-index-subentry-level-1">h&mdash;hh jjj</td><td></td></tr>
<tr><td class="printindex-index-subentry-level-2"><a href="#index-g_002d_002d_002dgg-h_002d_002d_002dhh-jjj-k_002d_002d_002dkk-l_002d_002d_002dll">k&mdash;kk, l&mdash;ll</a></td><td class="printindex-index-section"><a href="#chapter-index">chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex cp-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chapter-index_cp_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter-index_cp_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter-index_cp_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter-index_cp_letter-G"><b>G</b></a>
 &nbsp; 
</td></tr></table>
</div>
<div class="printindex fn-printindex">
<table class="index-entries-printindex fn-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chapter-index_fn_letter-F">F</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-f_002d_002d_002daa"><code>f---aa</code></a></td><td class="printindex-index-section"><a href="#chapter-index">chapter index</a></td></tr>
<tr><td class="printindex-index-entry"><code>f---bb</code></td><td></td></tr>
<tr><td class="printindex-index-subentry-level-1"><a href="#index-f_002d_002d_002dbb-f_002d_002d_002dcc"><code>f---cc</code></a></td><td class="printindex-index-section"><a href="#chapter-index">chapter index</a></td></tr>
<tr><td class="printindex-index-entry"><code>f---ddd</code></td><td></td></tr>
<tr><td class="printindex-index-subentry-level-1"><code>f---eee</code></td><td></td></tr>
<tr><td class="printindex-index-subentry-level-2"><a href="#index-f_002d_002d_002dddd-f_002d_002d_002deee-ffff"><code>ffff</code></a></td><td class="printindex-index-section"><a href="#chapter-index">chapter index</a></td></tr>
<tr><td class="printindex-index-entry"><code>f---ggg</code></td><td></td></tr>
<tr><td class="printindex-index-subentry-level-1"><code>f---hhh fjjj</code></td><td></td></tr>
<tr><td class="printindex-index-subentry-level-2"><a href="#index-f_002d_002d_002dggg-f_002d_002d_002dhhh-fjjj-f_002d_002d_002dkkk-f_002d_002d_002dlll"><code>f---kkk, f---lll</code></a></td><td class="printindex-index-section"><a href="#chapter-index">chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>
</div>
</div>
';


$result_converted{'xml'}->{'subentries'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter index</nodenext></node>
<top><sectiontitle></sectiontitle>

</top>
<node identifier="chapter-index"><nodename> chapter index</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Index</sectiontitle>

<cindex index="cp"> <indexterm index="cp" number="1">a&textmdash;a</indexterm></cindex>
<cindex index="cp"> <indexterm index="cp" number="2">b&textmdash;b <subentry> c&textmdash;c</subentry>
</indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="3">d&textmdash;dd <subentry> e&textmdash;ee <subentry> f&textmdash;ff</subentry>
</subentry></indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="4">g&textmdash;gg <subentry> h&textmdash;hh jjj <subentry> k&textmdash;kk <subentry> l&textmdash;ll</subentry>
</subentry></subentry></indexterm></cindex>
<findex index="fn"> <indexterm index="fn" number="1">f---aa</indexterm></findex>
<findex index="fn"> <indexterm index="fn" number="2">f---bb <subentry> f---cc</subentry>
</indexterm></findex><findex index="fn"> <indexterm index="fn" number="3">f---ddd <subentry> f---eee <subentry> ffff</subentry>
</subentry></indexterm></findex><findex index="fn"> <indexterm index="fn" number="4">f---ggg <subentry> f---hhh fjjj <subentry> f---kkk <subentry> f---lll</subentry>
</subentry></subentry></indexterm></findex>
<printindex value="cp" line=" cp"></printindex>
<printindex value="fn" line=" fn"></printindex>
</chapter>
';


$result_converted{'latex'}->{'subentries'} = '\\documentclass{book}
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
\\makeindex[name=cp,title=]%
\\makeindex[name=fn,title=]%

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
\\Texinfochapter{{Index}}
\\label{anchor:chapter-index}%

\\index[cp]{a--a@a---a}%
\\index[cp]{b--b@b---b!c--c@c---c}%
\\index[cp]{d--dd@d---dd!e--ee@e---ee!f--ff@f---ff}%
\\index[cp]{g--gg@g---gg!h--hh jjj@h---hh jjj!k--kk@k---kk!l--ll@l---ll}%

\\index[fn]{f---aa@\\texttt{f{-}{-}{-}aa}}%
\\index[fn]{f---bb@\\texttt{f{-}{-}{-}bb}!f---cc@\\texttt{f{-}{-}{-}cc}}%
\\index[fn]{f---ddd@\\texttt{f{-}{-}{-}ddd}!f---eee@\\texttt{f{-}{-}{-}eee}!ffff@\\texttt{ffff}}%
\\index[fn]{f---ggg@\\texttt{f{-}{-}{-}ggg}!f---hhh fjjj@\\texttt{f{-}{-}{-}hhh fjjj}!f---kkk@\\texttt{f{-}{-}{-}kkk}!f---lll@\\texttt{f{-}{-}{-}lll}}%

\\printindex[cp]
\\printindex[fn]
\\end{document}
';

1;
