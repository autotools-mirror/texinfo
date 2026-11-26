use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_no_argument'} = '*document_root C1
 *before_node_section C1
  *preamble C1
   *normal_command@macro C1 l1
   |invalid_syntax:{1}
    *arguments_line C1
     {macro_line:}
';


$result_texis{'macro_no_argument'} = '@macro';


$result_texts{'macro_no_argument'} = '';

$result_errors{'macro_no_argument'} = '* E l1|@macro requires a name
 @macro requires a name

* E l1|no matching `@end macro\'
 no matching `@end macro\'

';

$result_nodes_list{'macro_no_argument'} = '';

$result_sections_list{'macro_no_argument'} = '';

$result_sectioning_root{'macro_no_argument'} = '';

$result_headings_list{'macro_no_argument'} = '';

1;
