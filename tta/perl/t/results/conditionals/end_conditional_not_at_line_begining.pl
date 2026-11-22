use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'end_conditional_not_at_line_begining'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*normal_command@ifhtml C4 l1
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:inhtml\\n}
     >{raw:  }
     >*normal_command@end C1 l3
     >|EXTRA
     >|text_arg:{ifhtml}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifhtml}
       >{spaces_after_argument:\\n}
';


$result_texis{'end_conditional_not_at_line_begining'} = '';


$result_texts{'end_conditional_not_at_line_begining'} = '';

$result_errors{'end_conditional_not_at_line_begining'} = '* W l3|@end ifhtml should only appear at the beginning of a line
 warning: @end ifhtml should only appear at the beginning of a line

';

$result_nodes_list{'end_conditional_not_at_line_begining'} = '';

$result_sections_list{'end_conditional_not_at_line_begining'} = '';

$result_sectioning_root{'end_conditional_not_at_line_begining'} = '';

$result_headings_list{'end_conditional_not_at_line_begining'} = '';

1;
