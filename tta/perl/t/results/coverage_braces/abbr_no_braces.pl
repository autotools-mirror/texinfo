use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'abbr_no_braces'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   *@abbr l1
';


$result_texis{'abbr_no_braces'} = '@abbr';


$result_texts{'abbr_no_braces'} = '';

$result_errors{'abbr_no_braces'} = '* E l1|@abbr expected braces
 @abbr expected braces

';

$result_nodes_list{'abbr_no_braces'} = '';

$result_sections_list{'abbr_no_braces'} = '';

$result_sectioning_root{'abbr_no_braces'} = '';

$result_headings_list{'abbr_no_braces'} = '';


$result_converted{'plaintext'}->{'abbr_no_braces'} = '';


$result_converted{'html_text'}->{'abbr_no_braces'} = '<p><abbr class="abbr"></abbr></p>';


$result_converted{'latex_text'}->{'abbr_no_braces'} = '';


$result_converted{'docbook'}->{'abbr_no_braces'} = '<para></para>';

1;
