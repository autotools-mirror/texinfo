use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ifset_nonalpha'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*normal_command@ifset C2 l1
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:A/B}
       >{spaces_after_argument:\\n}
     >*normal_command@end C1 l2
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
';


$result_texis{'ifset_nonalpha'} = '';


$result_texts{'ifset_nonalpha'} = '';

$result_errors{'ifset_nonalpha'} = '';

$result_nodes_list{'ifset_nonalpha'} = '';

$result_sections_list{'ifset_nonalpha'} = '';

$result_sectioning_root{'ifset_nonalpha'} = '';

$result_headings_list{'ifset_nonalpha'} = '';

1;
