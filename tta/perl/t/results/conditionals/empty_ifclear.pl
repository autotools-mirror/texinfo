use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_ifclear'} = '*document_root C1
 *before_node_section C1
  *preamble C1
   {normal_text:}
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*normal_command@ifclear C5 l1
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:\\n}
     >{raw:Something\\n}
     >{raw:\\n}
     >*normal_command@end C1 l5
     >|text_arg:{ifclear}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifclear}
       >{spaces_after_argument:\\n}
';


$result_texis{'empty_ifclear'} = '';


$result_texts{'empty_ifclear'} = '';

$result_errors{'empty_ifclear'} = '* E l1|@ifclear requires a name
 @ifclear requires a name

';

$result_nodes_list{'empty_ifclear'} = '';

$result_sections_list{'empty_ifclear'} = '';

$result_sectioning_root{'empty_ifclear'} = '';

$result_headings_list{'empty_ifclear'} = '';

1;
