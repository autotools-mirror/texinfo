use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'commands_in_ifset'} = '*document_root C1
 *before_node_section C2
  *preamble_before_beginning C1
  >SOURCEMARKS
  >ignored_conditional_block<1>
   >*normal_command@ifset C6 l2
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:notset}
      >{spaces_after_argument:\\n}
    >{raw:@definfoenclose\\n}
    >{raw:@documentencoding ISO-8859-1\\n}
    >{raw:@end ifsettruc\\n}
    >{raw:open { \\n}
    >*normal_command@end C1 l7
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C1
   {empty_line:\\n}
   >SOURCEMARKS
   >ignored_conditional_block<2><p:1>
    >*normal_command@ifset C7 l9
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:notset}
       >{spaces_after_argument:\\n}
     >{raw:@example\\n}
     >{raw:@copying\\n}
     >{raw:@itemize\\n}
     >{raw:@table\\n}
     >{raw:@bye\\n}
     >*normal_command@end C1 l15
     >|EXTRA
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
';


$result_texis{'commands_in_ifset'} = '

';


$result_texts{'commands_in_ifset'} = '
';

$result_errors{'commands_in_ifset'} = '';

$result_nodes_list{'commands_in_ifset'} = '';

$result_sections_list{'commands_in_ifset'} = '';

$result_sectioning_root{'commands_in_ifset'} = '';

$result_headings_list{'commands_in_ifset'} = '';

1;
