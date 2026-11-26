use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_copying_not_ended'} = '*document_root C1
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content C1
   *normal_command@copying C1 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
';


$result_texis{'empty_copying_not_ended'} = '
@copying
';


$result_texts{'empty_copying_not_ended'} = '';

$result_errors{'empty_copying_not_ended'} = '* E l2|no matching `@end copying\'
 no matching `@end copying\'

';

$result_nodes_list{'empty_copying_not_ended'} = '';

$result_sections_list{'empty_copying_not_ended'} = '';

$result_sectioning_root{'empty_copying_not_ended'} = '';

$result_headings_list{'empty_copying_not_ended'} = '';


$result_converted{'info'}->{'empty_copying_not_ended'} = Encode::encode('utf-8', 'This is , produced from .


Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'empty_copying_not_ended'} = '* W |document without nodes
 warning: document without nodes

';

1;
