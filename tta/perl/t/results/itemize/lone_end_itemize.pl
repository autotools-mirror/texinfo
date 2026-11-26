use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'lone_end_itemize'} = '*document_root C1
 *before_node_section C1
  *preamble
';


$result_texis{'lone_end_itemize'} = '';


$result_texts{'lone_end_itemize'} = '';

$result_errors{'lone_end_itemize'} = '* E l1|unmatched `@end itemize\'
 unmatched `@end itemize\'

';

$result_nodes_list{'lone_end_itemize'} = '';

$result_sections_list{'lone_end_itemize'} = '';

$result_sectioning_root{'lone_end_itemize'} = '';

$result_headings_list{'lone_end_itemize'} = '';

1;
