use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_titlepage_titlepage'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@titlepage C5 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *@anchor C1 l3
    |EXTRA
    |identifier:{in-titlepage}
    |is_target:{1}
     *brace_arg C1
     |EXTRA
     |element_region:{titlepage}
      {in titlepage}
    {spaces_after_close_brace:\\n}
    *@end C1 l4
    |EXTRA
    |text_arg:{titlepage}
     *line_arg C3
      {spaces_before_argument: }
      {titlepage}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@top C1 l6 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
 *@node C2 l7 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@chapter C1 l9 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chapter}
    {spaces_after_argument:\\n}
 *@node C3 l10 {nchap}
 |EXTRA
 |identifier:{nchap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {nchap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l12
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{in-titlepage}
     {in titlepage}
   {.\\n}
';


$result_texis{'anchor_in_titlepage_titlepage'} = '@titlepage

@anchor{in titlepage}
@end titlepage

@top top
@node Top

@chapter Chapter
@node nchap

@xref{in titlepage}.
';


$result_texts{'anchor_in_titlepage_titlepage'} = '
top
***

1 Chapter
*********

in titlepage.
';

$result_errors{'anchor_in_titlepage_titlepage'} = '* W l10|node `nchap\' not in menu
 warning: node `nchap\' not in menu

';

$result_nodes_list{'anchor_in_titlepage_titlepage'} = '1|Top
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  next->nchap
2|nchap
 node_directions:
  prev->Top
';

$result_sections_list{'anchor_in_titlepage_titlepage'} = '1|top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'anchor_in_titlepage_titlepage'} = 'level: -1
list:
 1|top
';

$result_headings_list{'anchor_in_titlepage_titlepage'} = '';


$result_converted{'info'}->{'anchor_in_titlepage_titlepage'} = Encode::encode('utf-8', 'This is , produced from .

top
***


File: ,  Node: Top,  Next: nchap,  Up: (dir)

1 Chapter
*********


File: ,  Node: nchap,  Prev: Top

*Note in titlepage::.


Tag Table:
Node: Top36
Node: nchap105

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'anchor_in_titlepage_titlepage'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
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

<a class="anchor" id="in-titlepage"></a><hr>

<div class="top-level-extent" id="top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#nchap" accesskey="n" rel="next">nchap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>
<ul class="mini-toc">
<li><a href="#Top" accesskey="1">Chapter</a></li>
</ul>
<div class="chapter-level-extent" id="Top">

<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>
<hr>
<a class="node-id" id="nchap"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>nchap<a class="copiable-link" href="#nchap"> &para;</a></span></h4>

<p>See <a class="xref" href="#in-titlepage">in titlepage</a>.
</p></div>
</div>



</body>
</html>
';


$result_converted{'latex_text'}->{'anchor_in_titlepage_titlepage'} = '
\\begin{document}

\\frontmatter
\\pagestyle{empty}%
\\begin{titlepage}
\\begingroup
\\newskip\\titlepagetopglue \\titlepagetopglue = 1.5in
\\newskip\\titlepagebottomglue \\titlepagebottomglue = 2pc
\\setlength{\\parindent}{0pt}
% Leave some space at the very top of the page.
    \\vglue\\titlepagetopglue

\\label{anchor:in-titlepage}%
\\endgroup
\\end{titlepage}
\\mainmatter
\\pagestyle{single}%
\\part*{{top}}
\\label{anchor:Top}%
\\label{anchor:nchap}%

See \\hyperref[anchor:in-titlepage]{[in titlepage], page~\\pageref*{anchor:in-titlepage}}.
';

1;
