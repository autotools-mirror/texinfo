use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'conditional_not_closed'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*normal_command@ifhtml C2 l1
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:in ifhtml\\n}
';


$result_texis{'conditional_not_closed'} = '';


$result_texts{'conditional_not_closed'} = '';

$result_errors{'conditional_not_closed'} = '* E l1|no matching `@end ifhtml\'
 no matching `@end ifhtml\'

';

$result_nodes_list{'conditional_not_closed'} = '';

$result_sections_list{'conditional_not_closed'} = '';

$result_sectioning_root{'conditional_not_closed'} = '';

$result_headings_list{'conditional_not_closed'} = '';

1;
