use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ignored_in_ifset'} = '*document_root C1
 *before_node_section C6
  *preamble_before_beginning C1
  >SOURCEMARKS
  >ignored_conditional_block<1>
   >*normal_command@ifset C3 l2
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:notset}
      >{spaces_after_argument:\\n}
    >{raw:@ignore\\n}
    >*normal_command@end C1 l4
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C1
   {normal_text:text\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<2><p:1>
   >*normal_command@ifset C3 l9
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:notset}
      >{spaces_after_argument:\\n}
    >{raw:@verbatim\\n}
    >*normal_command@end C1 l11
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<3><p:1>
   >*normal_command@ifset C3 l15
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:notset}
      >{spaces_after_argument:\\n}
    >{raw:@verb{%\\n}
    >*normal_command@end C1 l17
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:%\\n}
';


$result_texis{'ignored_in_ifset'} = '
text


%
';


$result_texts{'ignored_in_ifset'} = 'text


%
';

$result_errors{'ignored_in_ifset'} = '* E l5|unmatched `@end ignore\'
 unmatched `@end ignore\'

* E l7|unmatched `@end ifset\'
 unmatched `@end ifset\'

* E l12|unmatched `@end verbatim\'
 unmatched `@end verbatim\'

* E l13|unmatched `@end ifset\'
 unmatched `@end ifset\'

* E l18|misplaced }
 misplaced }

* E l19|unmatched `@end ifset\'
 unmatched `@end ifset\'

';

$result_nodes_list{'ignored_in_ifset'} = '';

$result_sections_list{'ignored_in_ifset'} = '';

$result_sectioning_root{'ignored_in_ifset'} = '';

$result_headings_list{'ignored_in_ifset'} = '';

1;
