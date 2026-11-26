use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'displaymath'} = '*document_root C1
 *before_node_section C6
  *preamble
  *normal_command@displaymath C7 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {normal_text:\\int_D (}
   *balanced_braces C1 l2
    {normal_text:{\\nabla\\cdot}}
   {normal_text: F)dV=\\int_}
   *balanced_braces C1 l2
    {normal_text:{\\partial D}}
   {normal_text: F\\cdot ndS\\n}
   *normal_command@end C1 l3
   |text_arg:{displaymath}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:displaymath}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:before\\n}
  *normal_command@displaymath C7 l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {normal_text:\\int_D (}
   *balanced_braces C1 l7
    {normal_text:{\\nabla\\cdot}}
   {normal_text: F)dV=\\int_}
   *balanced_braces C1 l7
    {normal_text:{\\partial D}}
   {normal_text: F\\cdot ndS\\n}
   *normal_command@end C1 l8
   |text_arg:{displaymath}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:displaymath}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:after\\n}
';


$result_texis{'displaymath'} = '@displaymath
\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
@end displaymath

before
@displaymath
\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
@end displaymath
after
';


$result_texts{'displaymath'} = '\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS

before
\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
after
';

$result_errors{'displaymath'} = '';

$result_nodes_list{'displaymath'} = '';

$result_sections_list{'displaymath'} = '';

$result_sectioning_root{'displaymath'} = '';

$result_headings_list{'displaymath'} = '';


$result_converted{'html'}->{'displaymath'} = '<!DOCTYPE html>
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
<pre class="displaymath tex2jax_process">\\[\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
\\]</pre>
<p>before
</p><pre class="displaymath tex2jax_process">\\[\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
\\]</pre><p>after
</p>

<a href="js_licenses.html" rel="jslicense"><small>JavaScript license information</small></a>
</body>
</html>
';

$result_converted_errors{'html'}->{'displaymath'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'displaymath'} = '<informalequation><mathphrase>\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
</mathphrase></informalequation>
<para>before
</para><informalequation><mathphrase>\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
</mathphrase></informalequation><para>after
</para>';


$result_converted{'plaintext'}->{'displaymath'} = '\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS

   before
\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
   after
';


$result_converted{'xml'}->{'displaymath'} = '<displaymath endspaces=" ">
\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
</displaymath>

<para>before
</para><displaymath endspaces=" ">
\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
</displaymath>
<para>after
</para>';

1;
