use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'mathjax_with_texinfo_html_file'} = '*document_root C1
 *before_node_section C4
  *preamble
  *normal_command@displaymath C7 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {normal_text:a}
   *normal_command@sup C1 l2
    *brace_container C3
     {normal_text:b - \\frac}
     *balanced_braces C1 l2
      {normal_text:{\\xi}}
     *balanced_braces C3 l2
      {normal_text:{phi }
      *normal_command@copyright C1 l2
       *brace_container
      {normal_text:}}
   {normal_text: }
   *normal_command@dotless C1 l2
    *brace_container C1
     {normal_text:i}
   {normal_text:\\n}
   *normal_command@end C1 l3
   |text_arg:{displaymath}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:displaymath}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Some }
   *normal_command@math C1 l5
    *brace_arg C8
     {normal_text:a }
     *normal_command@minus C1 l5
      *brace_container
     {normal_text: b }
     *normal_command@geq C1 l5
      *brace_container
     {normal_text: }
     *normal_command@AA C1 l5
      *brace_container
     {normal_text: }
     *normal_command@^ C1 l5
      *following_arg C1
       {normal_text:e}
   {normal_text:.\\n}
';


$result_texis{'mathjax_with_texinfo_html_file'} = '@displaymath
a@sup{b - \\frac{\\xi}{phi @copyright{}}} @dotless{i}
@end displaymath

Some @math{a @minus{} b @geq{} @AA{} @^e}.
';


$result_texts{'mathjax_with_texinfo_html_file'} = 'ab - \\frac{\\xi}{phi (C)} i

Some a - b >= AA e^.
';

$result_errors{'mathjax_with_texinfo_html_file'} = '';

$result_nodes_list{'mathjax_with_texinfo_html_file'} = '';

$result_sections_list{'mathjax_with_texinfo_html_file'} = '';

$result_sectioning_root{'mathjax_with_texinfo_html_file'} = '';

$result_headings_list{'mathjax_with_texinfo_html_file'} = '';

$result_converted_errors{'file_html'}->{'mathjax_with_texinfo_html_file'} = '* W mathjax_with_texinfo_html_file.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
