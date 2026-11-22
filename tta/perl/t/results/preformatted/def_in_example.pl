use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'def_in_example'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@defun C3 l2
    *def_line C1 l2
    |EXTRA
    |def_command:{defun}
    |index_entry:I{fn,1}
    |original_def_cmdname:{defun}
     *block_line_arg C7
      (i){spaces_before_argument: }
      *def_category C1
      |EXTRA
      |inserted:{1}
       *def_line_arg C1
        {normal_text:Function}
      {spaces: }
      *def_name C1
       *def_line_arg C1
        {normal_text:name}
      {spaces: }
      *def_arg C1
       *def_line_arg C1
        {normal_text:arg}
      {spaces_after_argument:\\n}
    *def_item C1
     *preformatted C1
      {normal_text:in defun\\n}
    *@end C1 l4
    |EXTRA
    |text_arg:{defun}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:defun}
      {spaces_after_argument:\\n}
   *@end C1 l5
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'def_in_example'} = '@example
@defun name arg
in defun
@end defun
@end example
';


$result_texts{'def_in_example'} = 'Function: name arg
in defun
';

$result_errors{'def_in_example'} = '* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'def_in_example'} = '';

$result_sections_list{'def_in_example'} = '';

$result_sectioning_root{'def_in_example'} = '';

$result_headings_list{'def_in_example'} = '';

$result_indices_sort_strings{'def_in_example'} = 'fn:
 name
';


$result_converted{'plaintext'}->{'def_in_example'} = '      -- Function: name arg
          in defun
';

$result_converted_sort_strings{'plaintext'}->{'def_in_example'} = 'fn:
 name
';


$result_converted{'html'}->{'def_in_example'} = '<!DOCTYPE html>
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

<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
div.example {margin-left: 3.2em}
dt.def-line {font-size: 1rem}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold}
</style>


</head>

<body>
<div class="example">
<dl class="first-deffn first-defun-alias-first-deffn def-block">
<dt class="deffn defun-alias-deffn def-line" id="index-name"><span class="category-def">Function: </span><span><strong class="def-name">name</strong> <var class="def-var-arguments">arg</var><a class="copiable-link" href="#index-name"> &para;</a></span></dt>
<dd><pre class="example-preformatted">in defun
</pre></dd></dl>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'def_in_example'} = 'fn:
 name
';

$result_converted_errors{'html'}->{'def_in_example'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'def_in_example'} = '<synopsis><indexterm role="fn"><primary>name</primary></indexterm><phrase role="category"><emphasis role="bold">Function</emphasis>:</phrase> <function>name</function> <emphasis role="arg">arg</emphasis></synopsis>
<blockquote><screen>in defun
</screen></blockquote>';


$result_converted{'xml'}->{'def_in_example'} = '<example endspaces=" ">
<defun endspaces=" "><definitionterm><indexterm index="fn" number="1">name</indexterm> <defcategory automatic="on">Function</defcategory> <deffunction>name</deffunction> <defparam>arg</defparam></definitionterm>
<definitionitem><pre xml:space="preserve">in defun
</pre></definitionitem></defun>
</example>
';


$result_converted{'latex_text'}->{'def_in_example'} = '\\begin{document}
\\begin{Texinfoindented}

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{name \\EmbracOn{}\\textnormal{\\textsl{arg}}\\EmbracOff{}}& [Function]
\\end{tabularx}

\\index[fn]{name@\\texttt{name}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
\\begin{Texinfopreformatted}%
\\ttfamily in defun
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{Texinfoindented}
';

1;
