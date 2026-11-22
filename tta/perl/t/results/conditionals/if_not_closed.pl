use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'if_not_closed'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*normal_command@iftex C1 l1
     >*arguments_line C1
      >*block_line_arg
';


$result_texis{'if_not_closed'} = '';


$result_texts{'if_not_closed'} = '';

$result_errors{'if_not_closed'} = '* E l1|no matching `@end iftex\'
 no matching `@end iftex\'

';

$result_nodes_list{'if_not_closed'} = '';

$result_sections_list{'if_not_closed'} = '';

$result_sectioning_root{'if_not_closed'} = '';

$result_headings_list{'if_not_closed'} = '';

1;
