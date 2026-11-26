use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'txiinternalvalue'} = '*document_root C1
 *before_node_section C1
  *preamble C1
   {empty_line:\\n}
';


$result_texis{'txiinternalvalue'} = '
';


$result_texts{'txiinternalvalue'} = '
';

$result_errors{'txiinternalvalue'} = '* E l1|unknown command `txiinternalvalue\'
 unknown command `txiinternalvalue\'

';

$result_nodes_list{'txiinternalvalue'} = '';

$result_sections_list{'txiinternalvalue'} = '';

$result_sectioning_root{'txiinternalvalue'} = '';

$result_headings_list{'txiinternalvalue'} = '';

1;
