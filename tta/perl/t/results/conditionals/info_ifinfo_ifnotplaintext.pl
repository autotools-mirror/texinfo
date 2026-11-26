use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'info_ifinfo_ifnotplaintext'} = '*document_root C1
 *before_node_section C2
  *preamble C1
   {normal_text:}
   >SOURCEMARKS
   >expanded_conditional_command<start;1>
    >*normal_command@ifinfo C1 l1
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
   >expanded_conditional_command<start;2>
    >*normal_command@ifnotplaintext C1 l2
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:This will be in Info, but not plain text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:42>
    >*normal_command@end C1 l4
    >|text_arg:{ifnotplaintext}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnotplaintext}
      >{spaces_after_argument:\\n}
   >expanded_conditional_command<end;1><p:42>
    >*normal_command@end C1 l5
    >|text_arg:{ifinfo}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifinfo}
      >{spaces_after_argument:\\n}
';


$result_texis{'info_ifinfo_ifnotplaintext'} = 'This will be in Info, but not plain text.
';


$result_texts{'info_ifinfo_ifnotplaintext'} = 'This will be in Info, but not plain text.
';

$result_errors{'info_ifinfo_ifnotplaintext'} = '';

$result_nodes_list{'info_ifinfo_ifnotplaintext'} = '';

$result_sections_list{'info_ifinfo_ifnotplaintext'} = '';

$result_sectioning_root{'info_ifinfo_ifnotplaintext'} = '';

$result_headings_list{'info_ifinfo_ifnotplaintext'} = '';

1;
