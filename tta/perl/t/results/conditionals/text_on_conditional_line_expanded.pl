use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'text_on_conditional_line_expanded'} = '*document_root C1
 *before_node_section C2
  {}
  >SOURCEMARKS
  >expanded_conditional_command<start;1>
   >*@ifnothtml C1 l1
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{text following ifnothtml,}
  *paragraph C1
   {a\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:2>
    >*@end C1 l3
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnothtml}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnothtml}
';


$result_texis{'text_on_conditional_line_expanded'} = 'a
';


$result_texts{'text_on_conditional_line_expanded'} = 'a
';

$result_errors{'text_on_conditional_line_expanded'} = '* W l1|unexpected argument on @ifnothtml line: text following ifnothtml,
 warning: unexpected argument on @ifnothtml line: text following ifnothtml,

';

$result_nodes_list{'text_on_conditional_line_expanded'} = '';

$result_sections_list{'text_on_conditional_line_expanded'} = '';

$result_sectioning_root{'text_on_conditional_line_expanded'} = '';

$result_headings_list{'text_on_conditional_line_expanded'} = '';

1;
