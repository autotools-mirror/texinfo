use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'mathjax_with_texinfo_html_text'} = '*document_root C1
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


$result_texis{'mathjax_with_texinfo_html_text'} = '@displaymath
a@sup{b - \\frac{\\xi}{phi @copyright{}}} @dotless{i}
@end displaymath

Some @math{a @minus{} b @geq{} @AA{} @^e}.
';


$result_texts{'mathjax_with_texinfo_html_text'} = 'ab - \\frac{\\xi}{phi (C)} i

Some a - b >= AA e^.
';

$result_errors{'mathjax_with_texinfo_html_text'} = '';

$result_nodes_list{'mathjax_with_texinfo_html_text'} = '';

$result_sections_list{'mathjax_with_texinfo_html_text'} = '';

$result_sectioning_root{'mathjax_with_texinfo_html_text'} = '';

$result_headings_list{'mathjax_with_texinfo_html_text'} = '';


$result_converted{'html_text'}->{'mathjax_with_texinfo_html_text'} = '<pre class="displaymath tex2jax_process">\\[a^{b - \\frac{\\xi}{phi \\copyright{}}} \\imath{}
\\]</pre>
<p>Some <em class="math tex2jax_process">\\(a - b \\geq{} \\mathord{\\text{\\AA{}}} \\hat{e}\\)</em>.
</p>';

1;
