use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'command_in_end_ignored_raw_in_command'} = '*document_root C1
 *before_node_section C1
  *@html C2 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *elided_rawpreformatted C2
    {raw:In html\\n}
    {raw:@end @code{html}\\n}
';


$result_texis{'command_in_end_ignored_raw_in_command'} = '@html
In html
@end @code{html}
';


$result_texts{'command_in_end_ignored_raw_in_command'} = '';

$result_errors{'command_in_end_ignored_raw_in_command'} = '* E l1|no matching `@end html\'
 no matching `@end html\'

';

$result_nodes_list{'command_in_end_ignored_raw_in_command'} = '';

$result_sections_list{'command_in_end_ignored_raw_in_command'} = '';

$result_sectioning_root{'command_in_end_ignored_raw_in_command'} = '';

$result_headings_list{'command_in_end_ignored_raw_in_command'} = '';

1;
