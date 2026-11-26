use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'url_no_braces'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C1
   *normal_command@url l1
';


$result_texis{'url_no_braces'} = '@url';


$result_texts{'url_no_braces'} = '';

$result_errors{'url_no_braces'} = '* E l1|@url expected braces
 @url expected braces

';

$result_nodes_list{'url_no_braces'} = '';

$result_sections_list{'url_no_braces'} = '';

$result_sectioning_root{'url_no_braces'} = '';

$result_headings_list{'url_no_braces'} = '';


$result_converted{'plaintext'}->{'url_no_braces'} = '';


$result_converted{'html_text'}->{'url_no_braces'} = '';


$result_converted{'latex_text'}->{'url_no_braces'} = '\\begin{document}
';


$result_converted{'docbook'}->{'url_no_braces'} = '<para></para>';

1;
