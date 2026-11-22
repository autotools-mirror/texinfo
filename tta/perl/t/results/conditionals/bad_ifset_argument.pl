use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'bad_ifset_argument'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*normal_command@ifset C3 l1
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a|b}
       >{spaces_after_argument:\\n}
     >{raw:Ra&b\\n}
     >*normal_command@end C1 l3
     >|EXTRA
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
';


$result_texis{'bad_ifset_argument'} = '';


$result_texts{'bad_ifset_argument'} = '';

$result_errors{'bad_ifset_argument'} = '* E l1|bad name for @ifset
 bad name for @ifset

';

$result_nodes_list{'bad_ifset_argument'} = '';

$result_sections_list{'bad_ifset_argument'} = '';

$result_sectioning_root{'bad_ifset_argument'} = '';

$result_headings_list{'bad_ifset_argument'} = '';

1;
