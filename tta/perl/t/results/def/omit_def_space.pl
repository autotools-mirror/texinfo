use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'omit_def_space'} = '*document_root C3
 *before_node_section
 *@node C2 l1 {Top}
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
  {empty_line:\\n}
 *@node C5 l3 {chap}
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
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{txidefnamenospace|}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:txidefnamenospace}
  {empty_line:\\n}
  *@defun C4 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l7
   |EXTRA
   |def_command:{defun}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{function}
   |element_node:{chap}
   |index_entry:I{fn,1}
   |omit_def_name_space:{1}
   |original_def_cmdname:{defun}
    *block_line_arg C10
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Function}
     (i){spaces: }
     *def_name C1
      *def_line_arg C1
       {function}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {arg1}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg2}
     {delimiter:)}
   *@defunx C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defun}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{another}
   |element_node:{chap}
   |index_entry:I{fn,2}
   |omit_def_name_space:{1}
   |original_def_cmdname:{defunx}
    *line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Function}
     (i){spaces: }
     *def_name C1
      *def_line_arg C1
       {another}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {aarg}
     {delimiter:)}
   *def_item C1
    *paragraph C1
     {explain\\n}
   *@end C1 l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defun}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defun}
';


$result_texis{'omit_def_space'} = '@node Top

@node chap

@set txidefnamenospace

@defun function (arg1, arg2)
@defunx another (aarg)
explain
@end defun
';


$result_texts{'omit_def_space'} = '


Function: function (arg1, arg2)
Function: another (aarg)
explain
';

$result_errors{'omit_def_space'} = '* W l3|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'omit_def_space'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'omit_def_space'} = '';

$result_sectioning_root{'omit_def_space'} = '';

$result_headings_list{'omit_def_space'} = '';

$result_indices_sort_strings{'omit_def_space'} = 'fn:
 another
 function
';


$result_converted{'plaintext'}->{'omit_def_space'} = ' -- Function: function(arg1, arg2)
 -- Function: another(aarg)
     explain
';


$result_converted{'html'}->{'omit_def_space'} = '<!DOCTYPE html>
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
strong.def-name {font-family: monospace; font-weight: bold; font-size: larger}
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


<dl class="first-deffn first-defun-alias-first-deffn def-block">
<dt class="deffn defun-alias-deffn def-line" id="index-function"><span class="category-def">Function: </span><span><strong class="def-name">function</strong><var class="def-var-arguments">(arg1, arg2)</var><a class="copiable-link" href="#index-function"> &para;</a></span></dt>
<dt class="deffnx defunx-alias-deffnx def-cmd-deffn def-line" id="index-another"><span class="category-def">Function: </span><span><strong class="def-name">another</strong><var class="def-var-arguments">(aarg)</var><a class="copiable-link" href="#index-another"> &para;</a></span></dt>
<dd><p>explain
</p></dd></dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'omit_def_space'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'latex_text'}->{'omit_def_space'} = '\\label{anchor:Top}%
\\label{anchor:chap}%



\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{function\\EmbracOn{}\\textnormal{\\textsl{(arg1, arg2)}}\\EmbracOff{}}& [Function]
\\end{tabularx}

\\index[fn]{function@\\texttt{function}}%

\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{another\\EmbracOn{}\\textnormal{\\textsl{(aarg)}}\\EmbracOff{}}& [Function]
\\end{tabularx}

\\index[fn]{another@\\texttt{another}}%
\\begin{quote}
\\unskip{\\parskip=0pt\\noindent}%
explain
\\end{quote}
';

1;
