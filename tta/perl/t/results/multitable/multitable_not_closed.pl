use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@multitable C1 l1
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      {normal_text:r}
     {normal_text: }
     *bracketed_arg C1 l1
      {normal_text:t}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable_not_closed'} = '@multitable {r} {t}
';


$result_texts{'multitable_not_closed'} = '';

$result_errors{'multitable_not_closed'} = '* E l1|no matching `@end multitable\'
 no matching `@end multitable\'

';

$result_nodes_list{'multitable_not_closed'} = '';

$result_sections_list{'multitable_not_closed'} = '';

$result_sectioning_root{'multitable_not_closed'} = '';

$result_headings_list{'multitable_not_closed'} = '';

1;
