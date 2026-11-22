use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'format_in_titlepage_titlepage'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@titlepage C5 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *normal_command@format C3 l3
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *preformatted C1
      {normal_text:Published\\n}
     *normal_command@end C1 l5
     |text_arg:{format}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:format}
       {spaces_after_argument:\\n}
    {empty_line:\\n}
    *normal_command@end C1 l7
    |text_arg:{titlepage}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:titlepage}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l9 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C2 l10 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'format_in_titlepage_titlepage'} = '@titlepage

@format
Published
@end format

@end titlepage

@node Top
@node chap

';


$result_texts{'format_in_titlepage_titlepage'} = '

';

$result_errors{'format_in_titlepage_titlepage'} = '* W l10|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'format_in_titlepage_titlepage'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'format_in_titlepage_titlepage'} = '';

$result_sectioning_root{'format_in_titlepage_titlepage'} = '';

$result_headings_list{'format_in_titlepage_titlepage'} = '';


$result_converted{'info'}->{'format_in_titlepage_titlepage'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top


Tag Table:
Node: Top27
Node: chap74

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'format_in_titlepage_titlepage'} = '<!DOCTYPE html>
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
pre.format-preformatted {font-family: inherit}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>

<div class="format">
<pre class="format-preformatted">Published
</pre></div>

<hr>

<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<a class="node-id" id="chap"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>




</body>
</html>
';

$result_converted_errors{'html'}->{'format_in_titlepage_titlepage'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'latex_text'}->{'format_in_titlepage_titlepage'} = '
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

\\begin{Texinfopreformatted}%
Published
\\end{Texinfopreformatted}

\\endgroup
\\end{titlepage}
\\mainmatter
\\pagestyle{single}%
\\label{anchor:Top}%
\\label{anchor:chap}%

';

1;
