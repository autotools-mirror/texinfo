use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'copying_not_closed'} = '*document_root C1
 *before_node_section C1
  *preamble C1
   *normal_command@copying C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *paragraph C1
     {normal_text:This is a copyright notice\\n}
';


$result_texis{'copying_not_closed'} = '@copying

This is a copyright notice
';


$result_texts{'copying_not_closed'} = '';

$result_errors{'copying_not_closed'} = '* E l1|no matching `@end copying\'
 no matching `@end copying\'

';

$result_nodes_list{'copying_not_closed'} = '';

$result_sections_list{'copying_not_closed'} = '';

$result_sectioning_root{'copying_not_closed'} = '';

$result_headings_list{'copying_not_closed'} = '';

1;
