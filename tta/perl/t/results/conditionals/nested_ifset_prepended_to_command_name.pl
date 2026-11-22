use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_ifset_prepended_to_command_name'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*@ifset C4 l1
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a}
       >{spaces_after_argument:\\n}
     >{raw:@ifsettoto b\\n}
     >{raw:GG\\n}
     >*@end C1 l4
     >|EXTRA
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
';


$result_texis{'nested_ifset_prepended_to_command_name'} = '';


$result_texts{'nested_ifset_prepended_to_command_name'} = '';

$result_errors{'nested_ifset_prepended_to_command_name'} = '* E l5|unmatched `@end ifset\'
 unmatched `@end ifset\'

';

$result_nodes_list{'nested_ifset_prepended_to_command_name'} = '';

$result_sections_list{'nested_ifset_prepended_to_command_name'} = '';

$result_sectioning_root{'nested_ifset_prepended_to_command_name'} = '';

$result_headings_list{'nested_ifset_prepended_to_command_name'} = '';

1;
