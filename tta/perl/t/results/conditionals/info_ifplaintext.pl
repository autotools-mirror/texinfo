use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'info_ifplaintext'} = '*document_root C1
 *before_node_section C2
  *before_beginning C1
  >SOURCEMARKS
  >ignored_conditional_block<1>
   >*normal_command@ifplaintext C3 l2
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
    >{raw:this text will only appear in plain text.\\n}
    >*normal_command@end C1 l4
    >|text_arg:{ifplaintext}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifplaintext}
      >{spaces_after_argument:\\n}
   {empty_line:\\n}
  *preamble
';


$result_texis{'info_ifplaintext'} = '
';


$result_texts{'info_ifplaintext'} = '';

$result_errors{'info_ifplaintext'} = '';

$result_nodes_list{'info_ifplaintext'} = '';

$result_sections_list{'info_ifplaintext'} = '';

$result_sectioning_root{'info_ifplaintext'} = '';

$result_headings_list{'info_ifplaintext'} = '';

1;
