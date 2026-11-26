use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'lone_end_table'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C1
   {normal_text:Text.\\n}
';


$result_texis{'lone_end_table'} = 'Text.
';


$result_texts{'lone_end_table'} = 'Text.
';

$result_errors{'lone_end_table'} = '* E l2|unmatched `@end table\'
 unmatched `@end table\'

';

$result_nodes_list{'lone_end_table'} = '';

$result_sections_list{'lone_end_table'} = '';

$result_sectioning_root{'lone_end_table'} = '';

$result_headings_list{'lone_end_table'} = '';

1;
