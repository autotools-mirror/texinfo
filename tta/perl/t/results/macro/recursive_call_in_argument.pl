use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'recursive_call_in_argument'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@macro C3 l1
   |EXTRA
   |formal_args:A{arg}
   |macro_name:{anorecurse}
    *arguments_line C1
     {macro_line: anorecurse{arg}\\n}
    {raw:a\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:a\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@anorecurse C1
     >*brace_arg C1
      >{macro_call_arg_text:@anorecurse{}}
   >macro_expansion<end;1><p:1>
';


$result_texis{'recursive_call_in_argument'} = '@macro anorecurse{arg}
a
@end macro

a
';


$result_texts{'recursive_call_in_argument'} = '
a
';

$result_errors{'recursive_call_in_argument'} = '';

$result_nodes_list{'recursive_call_in_argument'} = '';

$result_sections_list{'recursive_call_in_argument'} = '';

$result_sectioning_root{'recursive_call_in_argument'} = '';

$result_headings_list{'recursive_call_in_argument'} = '';

1;
