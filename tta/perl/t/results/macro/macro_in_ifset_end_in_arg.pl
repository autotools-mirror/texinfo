use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_ifset_end_in_arg'} = '*document_root C1
 *before_node_section C2
  *preamble C3
   *normal_command@macro C3 l1
   |formal_args:A{arg}
   |macro_name:{macroone}
    *arguments_line C1
     {macro_line: macroone {arg}\\n}
    {raw:@end ifset\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >ignored_conditional_block<1><p:1>
    >*normal_command@ifset C3 l5
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a}
       >{spaces_after_argument:\\n}
     >{raw:@macroone{\\n}
     >*normal_command@end C1 l7
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:in ifset\\n}
';


$result_texis{'macro_in_ifset_end_in_arg'} = '@macro macroone {arg}
@end ifset
@end macro


in ifset
';


$result_texts{'macro_in_ifset_end_in_arg'} = '

in ifset
';

$result_errors{'macro_in_ifset_end_in_arg'} = '* E l8|misplaced }
 misplaced }

* E l10|unmatched `@end ifset\'
 unmatched `@end ifset\'

';

$result_nodes_list{'macro_in_ifset_end_in_arg'} = '';

$result_sections_list{'macro_in_ifset_end_in_arg'} = '';

$result_sectioning_root{'macro_in_ifset_end_in_arg'} = '';

$result_headings_list{'macro_in_ifset_end_in_arg'} = '';

1;
