use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'mathjax_with_texinfo_enable_encoding'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *@displaymath C7 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {normal_text:a}
   *@sup C1 l2
    *brace_container C3
     {normal_text:b - \\frac}
     *balanced_braces C1 l2
      {normal_text:{\\xi}}
     *balanced_braces C3 l2
      {normal_text:{phi }
      *@copyright C1 l2
       *brace_container
      {normal_text:}}
   {normal_text: }
   *@dotless C1 l2
    *brace_container C1
     {normal_text:i}
   {normal_text:\\n}
   *@end C1 l3
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:displaymath}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Some }
   *@math C1 l5
    *brace_arg C8
     {normal_text:a }
     *@minus C1 l5
      *brace_container
     {normal_text: b }
     *@geq C1 l5
      *brace_container
     {normal_text: }
     *@AA C1 l5
      *brace_container
     {normal_text: }
     *@^ C1 l5
      *following_arg C1
       {normal_text:e}
   {normal_text:.\\n}
';


$result_texis{'mathjax_with_texinfo_enable_encoding'} = '@displaymath
a@sup{b - \\frac{\\xi}{phi @copyright{}}} @dotless{i}
@end displaymath

Some @math{a @minus{} b @geq{} @AA{} @^e}.
';


$result_texts{'mathjax_with_texinfo_enable_encoding'} = 'ab - \\frac{\\xi}{phi (C)} i

Some a - b >= AA e^.
';

$result_errors{'mathjax_with_texinfo_enable_encoding'} = '';

$result_nodes_list{'mathjax_with_texinfo_enable_encoding'} = '';

$result_sections_list{'mathjax_with_texinfo_enable_encoding'} = '';

$result_sectioning_root{'mathjax_with_texinfo_enable_encoding'} = '';

$result_headings_list{'mathjax_with_texinfo_enable_encoding'} = '';


$result_converted{'latex_text'}->{'mathjax_with_texinfo_enable_encoding'} = '\\begin{document}
\\[
a^{b - \\frac{\\xi}{phi \\copyright{}}} ı
\\]

Some $a - b \\geq{} Å ê$.
';


$result_converted{'html'}->{'mathjax_with_texinfo_enable_encoding'} = '<!DOCTYPE html>
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
pre.displaymath {font-style: italic; font-family: serif; display: flex; justify-content: center}
</style>

<script type=\'text/javascript\'>
MathJax = {
  options: {
    skipHtmlTags: {\'[-]\': [\'pre\']},       // do not skip pre
    ignoreHtmlClass: \'tex2jax_ignore\',
    processHtmlClass: \'tex2jax_process\'
  },
  tex: {
    processEscapes: false,      // do not use \\$ to produce a literal dollar sign
    processEnvironments: false, // do not process \\begin{xxx}...\\end{xxx} outside math mode
    processRefs: false,         // do not process \\ref{...} outside of math mode
    displayMath: [             // start/end delimiter pairs for display math
      [\'\\\\[\', \'\\\\]\']
    ],
  },
};
</script><script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js">
</script>
</head>

<body class="tex2jax_ignore">
<pre class="displaymath tex2jax_process">\\[a^{b - \\frac{\\xi}{phi \\copyright{}}} ı
\\]</pre>
<p>Some <em class="math tex2jax_process">\\(a - b \\geq{} Å ê\\)</em>.
</p>

<a href="js_licenses.html" rel="jslicense"><small>JavaScript license information</small></a>
</body>
</html>
';

$result_converted_errors{'html'}->{'mathjax_with_texinfo_enable_encoding'} = '* W mathjax_with_texinfo_enable_encoding.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
