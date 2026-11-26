use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unknown_index_entry'} = '*document_root C1
 *before_node_section C2
  *preamble C1
   {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:someindex entry.\\n}
';


$result_texis{'unknown_index_entry'} = ' someindex entry.
';


$result_texts{'unknown_index_entry'} = 'someindex entry.
';

$result_errors{'unknown_index_entry'} = '* E l1|unknown command `someindex\'
 unknown command `someindex\'

';

$result_nodes_list{'unknown_index_entry'} = '';

$result_sections_list{'unknown_index_entry'} = '';

$result_sectioning_root{'unknown_index_entry'} = '';

$result_headings_list{'unknown_index_entry'} = '';

1;
