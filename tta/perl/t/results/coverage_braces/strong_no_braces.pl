use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'strong_no_braces'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   *normal_command@strong l1
';


$result_texis{'strong_no_braces'} = '@strong';


$result_texts{'strong_no_braces'} = '';

$result_errors{'strong_no_braces'} = '* E l1|@strong expected braces
 @strong expected braces

';

$result_nodes_list{'strong_no_braces'} = '';

$result_sections_list{'strong_no_braces'} = '';

$result_sectioning_root{'strong_no_braces'} = '';

$result_headings_list{'strong_no_braces'} = '';


$result_converted{'plaintext'}->{'strong_no_braces'} = '**
';


$result_converted{'html_text'}->{'strong_no_braces'} = '';


$result_converted{'latex_text'}->{'strong_no_braces'} = '\\begin{document}
\\textbf{}';


$result_converted{'docbook'}->{'strong_no_braces'} = '<para></para>';

1;
