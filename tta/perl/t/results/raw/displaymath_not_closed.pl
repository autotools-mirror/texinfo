use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'displaymath_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@displaymath C2 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {normal_text:in displaymath\\n}
';


$result_texis{'displaymath_not_closed'} = '@displaymath
in displaymath
';


$result_texts{'displaymath_not_closed'} = 'in displaymath
';

$result_errors{'displaymath_not_closed'} = '* E l1|no matching `@end displaymath\'
 no matching `@end displaymath\'

';

$result_nodes_list{'displaymath_not_closed'} = '';

$result_sections_list{'displaymath_not_closed'} = '';

$result_sectioning_root{'displaymath_not_closed'} = '';

$result_headings_list{'displaymath_not_closed'} = '';

1;
