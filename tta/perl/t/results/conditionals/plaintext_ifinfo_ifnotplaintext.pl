use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'plaintext_ifinfo_ifnotplaintext'} = '*document_root C1
 *before_node_section C1
  {}
  >SOURCEMARKS
  >expanded_conditional_command<start;1>
   >*@ifinfo C1 l1
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
  >ignored_conditional_block<1>
   >*@ifnotplaintext C3 l2
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
    >{raw:This will be in Info, but not plain text.\\n}
    >*@end C1 l4
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnotplaintext}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnotplaintext}
  >expanded_conditional_command<end;1>
   >*@end C1 l5
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{ifinfo}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{ifinfo}
';


$result_texis{'plaintext_ifinfo_ifnotplaintext'} = '';


$result_texts{'plaintext_ifinfo_ifnotplaintext'} = '';

$result_errors{'plaintext_ifinfo_ifnotplaintext'} = '';

$result_nodes_list{'plaintext_ifinfo_ifnotplaintext'} = '';

$result_sections_list{'plaintext_ifinfo_ifnotplaintext'} = '';

$result_sectioning_root{'plaintext_ifinfo_ifnotplaintext'} = '';

$result_headings_list{'plaintext_ifinfo_ifnotplaintext'} = '';

1;
