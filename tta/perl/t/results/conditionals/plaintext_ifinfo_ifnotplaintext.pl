use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'plaintext_ifinfo_ifnotplaintext'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >expanded_conditional_command<start;1>
    >*normal_command@ifinfo C1 l1
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
   >ignored_conditional_block<1>
    >*normal_command@ifnotplaintext C3 l2
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:This will be in Info, but not plain text.\\n}
     >*normal_command@end C1 l4
     >|EXTRA
     >|text_arg:{ifnotplaintext}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifnotplaintext}
       >{spaces_after_argument:\\n}
   >expanded_conditional_command<end;1>
    >*normal_command@end C1 l5
    >|EXTRA
    >|text_arg:{ifinfo}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifinfo}
      >{spaces_after_argument:\\n}
';


$result_texis{'plaintext_ifinfo_ifnotplaintext'} = '';


$result_texts{'plaintext_ifinfo_ifnotplaintext'} = '';

$result_errors{'plaintext_ifinfo_ifnotplaintext'} = '';

$result_nodes_list{'plaintext_ifinfo_ifnotplaintext'} = '';

$result_sections_list{'plaintext_ifinfo_ifnotplaintext'} = '';

$result_sectioning_root{'plaintext_ifinfo_ifnotplaintext'} = '';

$result_headings_list{'plaintext_ifinfo_ifnotplaintext'} = '';

1;
