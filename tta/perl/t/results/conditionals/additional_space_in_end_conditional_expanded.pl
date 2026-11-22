use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'additional_space_in_end_conditional_expanded'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >expanded_conditional_command<start;1>
    >*normal_command@ifnothtml C1 l1
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:not html\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:9>
    >*normal_command@end C1 l3
    >|EXTRA
    >|text_arg:{ifnothtml}
     >*line_arg C3
      >{spaces_before_argument:  }
      >{normal_text:ifnothtml}
      >{spaces_after_argument:\\n}
';


$result_texis{'additional_space_in_end_conditional_expanded'} = 'not html
';


$result_texts{'additional_space_in_end_conditional_expanded'} = 'not html
';

$result_errors{'additional_space_in_end_conditional_expanded'} = '';

$result_nodes_list{'additional_space_in_end_conditional_expanded'} = '';

$result_sections_list{'additional_space_in_end_conditional_expanded'} = '';

$result_sectioning_root{'additional_space_in_end_conditional_expanded'} = '';

$result_headings_list{'additional_space_in_end_conditional_expanded'} = '';

1;
