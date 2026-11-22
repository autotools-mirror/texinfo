use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'user_defined_txiinternalvalue'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{txiinternalvalue}
    *arguments_line C1
     {macro_line: txiinternalvalue\\n}
    {raw:user internalvalue\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:user internalvalue\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@txiinternalvalue
   >macro_expansion<end;1><p:18>
';


$result_texis{'user_defined_txiinternalvalue'} = '@macro txiinternalvalue
user internalvalue
@end macro

user internalvalue
';


$result_texts{'user_defined_txiinternalvalue'} = '
user internalvalue
';

$result_errors{'user_defined_txiinternalvalue'} = '';

$result_nodes_list{'user_defined_txiinternalvalue'} = '';

$result_sections_list{'user_defined_txiinternalvalue'} = '';

$result_sectioning_root{'user_defined_txiinternalvalue'} = '';

$result_headings_list{'user_defined_txiinternalvalue'} = '';

1;
