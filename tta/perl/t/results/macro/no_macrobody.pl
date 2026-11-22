use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_macrobody'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *normal_command@macro C2 l1
   |EXTRA
   |formal_args:A{arg}
   |macro_name:{nomacrobody}
    *arguments_line C1
     {macro_line: nomacrobody {arg}\\n}
    *normal_command@end C1 l2
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call_line@nomacrobody C1
     >*line_arg C2
      >{spaces_before_argument: }
      >{normal_text:line arg}
   >macro_expansion<end;1>
   {empty_line:\\n}
  *paragraph C1
   {normal_text:.\\n}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@nomacrobody C1
     >*brace_arg C1
      >{macro_call_arg_text:arg brace}
   >macro_expansion<end;2>
';


$result_texis{'no_macrobody'} = '@macro nomacrobody {arg}
@end macro



.
';


$result_texts{'no_macrobody'} = '


.
';

$result_errors{'no_macrobody'} = '';

$result_nodes_list{'no_macrobody'} = '';

$result_sections_list{'no_macrobody'} = '';

$result_sectioning_root{'no_macrobody'} = '';

$result_headings_list{'no_macrobody'} = '';

1;
