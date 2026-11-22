use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_not_closed'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@macro C2 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{name}
    *arguments_line C1
     {macro_line: name\\n}
    {raw:in macro\\n}
';


$result_texis{'macro_not_closed'} = '@macro name
in macro
';


$result_texts{'macro_not_closed'} = '';

$result_errors{'macro_not_closed'} = '* E l1|no matching `@end macro\'
 no matching `@end macro\'

';

$result_nodes_list{'macro_not_closed'} = '';

$result_sections_list{'macro_not_closed'} = '';

$result_sectioning_root{'macro_not_closed'} = '';

$result_headings_list{'macro_not_closed'} = '';

1;
