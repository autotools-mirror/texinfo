use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'hyphenation_no_braces'} = '*document_root C1
 *before_node_section C1
  *preamble C1
   *normal_command@hyphenation l1
';


$result_texis{'hyphenation_no_braces'} = '@hyphenation';


$result_texts{'hyphenation_no_braces'} = '';

$result_errors{'hyphenation_no_braces'} = '* E l1|@hyphenation expected braces
 @hyphenation expected braces

';

$result_nodes_list{'hyphenation_no_braces'} = '';

$result_sections_list{'hyphenation_no_braces'} = '';

$result_sectioning_root{'hyphenation_no_braces'} = '';

$result_headings_list{'hyphenation_no_braces'} = '';


$result_converted{'plaintext'}->{'hyphenation_no_braces'} = '';


$result_converted{'html_text'}->{'hyphenation_no_braces'} = '';


$result_converted{'latex_text'}->{'hyphenation_no_braces'} = '\\hyphenation{}\\begin{document}
';


$result_converted{'docbook'}->{'hyphenation_no_braces'} = '';

1;
