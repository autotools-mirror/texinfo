use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'math_no_braces'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C1
   *normal_command@math l1
';


$result_texis{'math_no_braces'} = '@math';


$result_texts{'math_no_braces'} = '';

$result_errors{'math_no_braces'} = '* E l1|@math expected braces
 @math expected braces

';

$result_nodes_list{'math_no_braces'} = '';

$result_sections_list{'math_no_braces'} = '';

$result_sectioning_root{'math_no_braces'} = '';

$result_headings_list{'math_no_braces'} = '';


$result_converted{'plaintext'}->{'math_no_braces'} = '';


$result_converted{'html_text'}->{'math_no_braces'} = '';


$result_converted{'latex_text'}->{'math_no_braces'} = '\\begin{document}
';


$result_converted{'docbook'}->{'math_no_braces'} = '<para></para>';

1;
