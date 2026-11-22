use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text_on_conditional_line'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*normal_command@ifnothtml C3 l1
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:text following ifnothtml,}
       >{spaces_after_argument:\\n}
     >{raw:a\\n}
     >*normal_command@end C1 l3
     >|EXTRA
     >|text_arg:{ifnothtml}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifnothtml}
       >{spaces_after_argument:\\n}
';


$result_texis{'text_on_conditional_line'} = '';


$result_texts{'text_on_conditional_line'} = '';

$result_errors{'text_on_conditional_line'} = '* W l1|unexpected argument on @ifnothtml line: text following ifnothtml,
 warning: unexpected argument on @ifnothtml line: text following ifnothtml,

';

$result_nodes_list{'text_on_conditional_line'} = '';

$result_sections_list{'text_on_conditional_line'} = '';

$result_sectioning_root{'text_on_conditional_line'} = '';

$result_headings_list{'text_on_conditional_line'} = '';

1;
