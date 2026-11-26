use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'bad_ifclear_argument'} = '*document_root C1
 *before_node_section C2
  *before_beginning C1
  >SOURCEMARKS
  >ignored_conditional_block<1>
   >*normal_command@ifclear C3 l2
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:#something}
      >{spaces_after_argument:\\n}
    >{raw:R#something\\n}
    >*normal_command@end C1 l4
    >|text_arg:{ifclear}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifclear}
      >{spaces_after_argument:\\n}
   {empty_line:\\n}
  *preamble_before_content
';


$result_texis{'bad_ifclear_argument'} = '
';


$result_texts{'bad_ifclear_argument'} = '';

$result_errors{'bad_ifclear_argument'} = '* E l2|bad name for @ifclear
 bad name for @ifclear

';

$result_nodes_list{'bad_ifclear_argument'} = '';

$result_sections_list{'bad_ifclear_argument'} = '';

$result_sectioning_root{'bad_ifclear_argument'} = '';

$result_headings_list{'bad_ifclear_argument'} = '';

1;
