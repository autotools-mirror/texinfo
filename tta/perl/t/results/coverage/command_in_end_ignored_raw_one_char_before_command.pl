use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'command_in_end_ignored_raw_one_char_before_command'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@html C2 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *elided_rawpreformatted C2
     {raw:In html\\n}
     {raw:@end h@asis{}tml\\n}
';


$result_texis{'command_in_end_ignored_raw_one_char_before_command'} = '@html
In html
@end h@asis{}tml
';


$result_texts{'command_in_end_ignored_raw_one_char_before_command'} = '';

$result_errors{'command_in_end_ignored_raw_one_char_before_command'} = '* E l1|no matching `@end html\'
 no matching `@end html\'

';

$result_nodes_list{'command_in_end_ignored_raw_one_char_before_command'} = '';

$result_sections_list{'command_in_end_ignored_raw_one_char_before_command'} = '';

$result_sectioning_root{'command_in_end_ignored_raw_one_char_before_command'} = '';

$result_headings_list{'command_in_end_ignored_raw_one_char_before_command'} = '';

1;
