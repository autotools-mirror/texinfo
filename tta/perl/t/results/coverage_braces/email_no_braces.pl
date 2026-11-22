use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'email_no_braces'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   *normal_command@email l1
';


$result_texis{'email_no_braces'} = '@email';


$result_texts{'email_no_braces'} = '';

$result_errors{'email_no_braces'} = '* E l1|@email expected braces
 @email expected braces

';

$result_nodes_list{'email_no_braces'} = '';

$result_sections_list{'email_no_braces'} = '';

$result_sectioning_root{'email_no_braces'} = '';

$result_headings_list{'email_no_braces'} = '';


$result_converted{'plaintext'}->{'email_no_braces'} = '';


$result_converted{'html_text'}->{'email_no_braces'} = '';


$result_converted{'latex_text'}->{'email_no_braces'} = '\\begin{document}
';


$result_converted{'docbook'}->{'email_no_braces'} = '<para></para>';

1;
