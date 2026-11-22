use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ifnotinfo_exception'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*normal_command@ifnotinfo C3 l1
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:in ifnotinfo\\n}
     >*normal_command@end C1 l3
     >|EXTRA
     >|text_arg:{ifnotinfo}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifnotinfo}
       >{spaces_after_argument:\\n}
';


$result_texis{'ifnotinfo_exception'} = '';


$result_texts{'ifnotinfo_exception'} = '';

$result_errors{'ifnotinfo_exception'} = '';

$result_nodes_list{'ifnotinfo_exception'} = '';

$result_sections_list{'ifnotinfo_exception'} = '';

$result_sectioning_root{'ifnotinfo_exception'} = '';

$result_headings_list{'ifnotinfo_exception'} = '';

1;
