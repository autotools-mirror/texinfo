use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'katex_with_texinfo'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *@displaymath C7 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {a}
   *@sup C1 l2
    *brace_container C3
     {b - \\frac}
     *balanced_braces C1 l2
      {{\\xi}}
     *balanced_braces C3 l2
      {{phi }
      *@copyright C1 l2
       *brace_container
      {}}
   { }
   *@dotless C1 l2
    *brace_container C1
     {i}
   {\\n}
   *@end C1 l3
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C3
     {spaces_before_argument: }
     {displaymath}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {Some }
   *@math C1 l5
    *brace_arg C8
     {a }
     *@minus C1 l5
      *brace_container
     { b }
     *@geq C1 l5
      *brace_container
     { }
     *@AA C1 l5
      *brace_container
     { }
     *@^ C1 l5
      *following_arg C1
       {e}
   {.\\n}
';


$result_texis{'katex_with_texinfo'} = '@displaymath
a@sup{b - \\frac{\\xi}{phi @copyright{}}} @dotless{i}
@end displaymath

Some @math{a @minus{} b @geq{} @AA{} @^e}.
';


$result_texts{'katex_with_texinfo'} = 'ab - \\frac{\\xi}{phi (C)} i

Some a - b >= AA e^.
';

$result_errors{'katex_with_texinfo'} = '';

$result_nodes_list{'katex_with_texinfo'} = '';

$result_sections_list{'katex_with_texinfo'} = '';

$result_sectioning_root{'katex_with_texinfo'} = '';

$result_headings_list{'katex_with_texinfo'} = '';


$result_converted{'html'}->{'katex_with_texinfo'} = '<!DOCTYPE html>
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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.19.1/dist/katex.css" integrity="sha384-dyEuTchRIWTUUS5esbTCpMfx+B+xfO8EoTt5SiUbKmafuP0Gilzcq4YNJuy9EkCC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/katex@0.19.1/dist/katex.js" integrity="sha384-H4X0CTVqduiMCy79KQw+noSKkBB6tvyQopi29LC//G1uFcl52atjOC6Ltc9br/U7" crossorigin="anonymous"></script>
<script>
const macros = {};
</script>

</head>

<body>
<pre class="displaymath" id="_katex_displaymath_0">a^{b - \\frac{\\xi}{phi \\copyright{}}} \\imath{}
</pre>
<script>
katex.render("a^{b - \\\\frac{\\\\xi}{phi \\\\copyright{}}} \\\\imath{}\\n"
+"", _katex_displaymath_0, {throwOnError: false,
displayMode: true,
macros})
</script>

<p>Some <em class="math" id="_katex_math_1">a - b \\geq{} \\mathord{\\text{\\AA{}}} \\hat{e}</em>
<script>
katex.render("a - b \\\\geq{} \\\\mathord{\\\\text{\\\\AA{}}} \\\\hat{e}", _katex_math_1, {throwOnError: false,
macros})
</script>
.
</p>

<a href="js_licenses.html" rel="jslicense"><small>JavaScript license information</small></a>
</body>
</html>
';

$result_converted_errors{'html'}->{'katex_with_texinfo'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
