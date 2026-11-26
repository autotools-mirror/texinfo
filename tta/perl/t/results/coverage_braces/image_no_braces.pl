use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'image_no_braces'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@image C1 l1
   {spaces_after_cmd_before_arg: }
';


$result_texis{'image_no_braces'} = '@image ';


$result_texts{'image_no_braces'} = '';

$result_errors{'image_no_braces'} = '* E l1|@image expected braces
 @image expected braces

';

$result_nodes_list{'image_no_braces'} = '';

$result_sections_list{'image_no_braces'} = '';

$result_sectioning_root{'image_no_braces'} = '';

$result_headings_list{'image_no_braces'} = '';


$result_converted{'plaintext'}->{'image_no_braces'} = '';


$result_converted{'html_text'}->{'image_no_braces'} = '';


$result_converted{'latex_text'}->{'image_no_braces'} = '\\begin{document}
';


$result_converted{'docbook'}->{'image_no_braces'} = '';

1;
