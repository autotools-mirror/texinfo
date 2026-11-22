use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_ifset'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*@ifset C5 l1
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:\\n}
     >{raw:Something\\n}
     >{raw:\\n}
     >*@end C1 l5
     >|EXTRA
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
';


$result_texis{'empty_ifset'} = '';


$result_texts{'empty_ifset'} = '';

$result_errors{'empty_ifset'} = '* E l1|@ifset requires a name
 @ifset requires a name

';

$result_nodes_list{'empty_ifset'} = '';

$result_sections_list{'empty_ifset'} = '';

$result_sectioning_root{'empty_ifset'} = '';

$result_headings_list{'empty_ifset'} = '';

1;
