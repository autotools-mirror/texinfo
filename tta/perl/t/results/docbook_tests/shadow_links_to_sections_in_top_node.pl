use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'shadow_links_to_sections_in_top_node'} = '*document_root C10
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C4 l2 {Shadow}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Shadow}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l4
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{two}
     {normal_text:two}
   {normal_text:. --- goes to one of the section named two\\n}
  {empty_line:\\n}
 *@chapter C4 l6 {foo}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:foo}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Aaaaaaaaaa.  }
   *@xref C1 l8
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{bar}
     {normal_text:bar}
   {normal_text:.\\n}
  {empty_line:\\n}
 *@chapter C4 l10 {bar}
 |EXTRA
 |identifier:{bar}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:bar}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Bbbbbbbbbbb.  }
   *@xref C1 l12
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{foo}
     {normal_text:foo}
   {normal_text:. -- goes to baz chapter.\\n}
  {empty_line:\\n}
 *@section C6 l14 {two}
 |EXTRA
 |identifier:{two}
 |is_target:{1}
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:two}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:CCCCCCC.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l18
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{baz}
     {normal_text:baz}
   {normal_text:. --- fails\\n}
  {empty_line:\\n}
 *@node C1 l20 {foo}
 |EXTRA
 |identifier:{foo}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:foo}
    {spaces_after_argument:\\n}
 *@chapter C4 l21 {baz}
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:baz}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:LLLLLLLLLLL.\\n}
  {empty_line:\\n}
 *@section C4 l25 {two}
 |EXTRA
 |section_heading_number:{3.1}
 |section_level:{2}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:two}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:DDDDDDDDD.\\n}
  {empty_line:\\n}
 *@section C5 l29 {with @ref{foo, b} after}
 |EXTRA
 |identifier:{with-foo-after}
 |is_target:{1}
 |section_heading_number:{3.2}
 |section_level:{2}
 |section_number:{7}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:with }
    *@ref C2 l29
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{foo}
      {normal_text:foo}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:b}
    {normal_text: after}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@xref C1 l31
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{with-foo-after}
     {normal_text:with foo after}
   {normal_text:. --- link to section with }
   *@@
   {normal_text:ref in name\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l33
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{two}
     {normal_text:two}
   {normal_text:. --- another link to a section named two.\\n}
';


$result_texis{'shadow_links_to_sections_in_top_node'} = '@node Top
@top Shadow

@xref{two}. --- goes to one of the section named two

@chapter foo

Aaaaaaaaaa.  @xref{bar}.

@chapter bar

Bbbbbbbbbbb.  @xref{foo}. -- goes to baz chapter.

@section two

CCCCCCC.

@xref{baz}. --- fails

@node foo
@chapter baz

LLLLLLLLLLL.

@section two

DDDDDDDDD.

@section with @ref{foo, b} after

@xref{with foo after}. --- link to section with @@ref in name

@xref{two}. --- another link to a section named two.
';


$result_texts{'shadow_links_to_sections_in_top_node'} = 'Shadow
******

two. -- goes to one of the section named two

1 foo
*****

Aaaaaaaaaa.  bar.

2 bar
*****

Bbbbbbbbbbb.  foo. - goes to baz chapter.

2.1 two
=======

CCCCCCC.

baz. -- fails

3 baz
*****

LLLLLLLLLLL.

3.1 two
=======

DDDDDDDDD.

3.2 with foo after
==================

with foo after. -- link to section with @ref in name

two. -- another link to a section named two.
';

$result_errors{'shadow_links_to_sections_in_top_node'} = '* W l25|@section `two\' already added target
 warning: @section `two\' already added target

* WC l14|added for @section
 warning: added for @section

* E l18|@xref reference to nonexistent node `baz\'
 @xref reference to nonexistent node `baz\'

* W l31|@xref to `with foo after\', different from section name `with @ref{foo, b} after\'
 warning: @xref to `with foo after\', different from section name `with @ref{foo, b} after\'

';

$result_nodes_list{'shadow_links_to_sections_in_top_node'} = '1|Top
 associated_section: Shadow
 associated_title_command: Shadow
 node_directions:
  next->foo
2|foo
 associated_section: 3 baz
 associated_title_command: 3 baz
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'shadow_links_to_sections_in_top_node'} = '1|Shadow
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->foo
 section_children:
  1|foo
  2|bar
  3|baz
2|foo
 section_directions:
  next->bar
  up->Shadow
 toplevel_directions:
  next->bar
  prev->Shadow
  up->Shadow
3|bar
 section_directions:
  next->baz
  prev->foo
  up->Shadow
 toplevel_directions:
  next->baz
  prev->foo
  up->Shadow
 section_children:
  1|two
4|two
 section_directions:
  up->bar
5|baz
 associated_anchor_command: foo
 associated_node: foo
 section_directions:
  prev->bar
  up->Shadow
 toplevel_directions:
  prev->bar
  up->Shadow
 section_children:
  1|two
  2|with @ref{foo, b} after
6|two
 section_directions:
  next->with @ref{foo, b} after
  up->baz
7|with @ref{foo, b} after
 section_directions:
  prev->two
  up->baz
';

$result_sectioning_root{'shadow_links_to_sections_in_top_node'} = 'level: -1
list:
 1|Shadow
';

$result_headings_list{'shadow_links_to_sections_in_top_node'} = '';


$result_converted{'latex'}->{'shadow_links_to_sections_in_top_node'} = '\\documentclass{book}
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

\\hypersetup{pdftitle={Shadow}}

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
\\label{anchor:bar}%
\\label{anchor:two}%
\\Texinfochapter{{baz}}
\\label{anchor:foo}%

LLLLLLLLLLL.

\\section{{two}}

DDDDDDDDD.

\\section{{with \\texorpdfstring{\\hyperref[anchor:foo]{\\chaptername~\\ref*{anchor:foo} [foo], page~\\pageref*{anchor:foo}}}{foo} after}}
\\label{anchor:with-foo-after}%

See \\hyperref[anchor:with-foo-after]{[with \\hyperref[anchor:foo]{\\chaptername~\\ref*{anchor:foo} [foo], page~\\pageref*{anchor:foo}} after], page~\\pageref*{anchor:with-foo-after}}. --- link to section with @ref in name

See \\hyperref[anchor:two]{[two], page~\\pageref*{anchor:two}}. --- another link to a section named two.
\\end{document}
';


$result_converted{'docbook_doc'}->{'shadow_links_to_sections_in_top_node'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book>
<chapter label="3" id="foo">
<title>baz</title>

<para>LLLLLLLLLLL.
</para>
<sect1 label="3.1">
<title>two</title>

<para>DDDDDDDDD.
</para>
</sect1>
<sect1 label="3.2" id="with-foo-after">
<title>with <link linkend="foo">b</link> after</title>

<para>See <link linkend="with-foo-after">with foo after</link>. &#8212; link to section with @ref in name
</para>
<para>See <link linkend="two">two</link>. &#8212; another link to a section named two.
</para></sect1>
</chapter>
</book>
';

1;
