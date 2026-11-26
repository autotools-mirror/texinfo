use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'menu_no_closed_entry_beginning'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@menu C2 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C1
     {normal_text:* node}
';


$result_texis{'menu_no_closed_entry_beginning'} = '@menu
* node';


$result_texts{'menu_no_closed_entry_beginning'} = '* node';

$result_errors{'menu_no_closed_entry_beginning'} = '* E l1|no matching `@end menu\'
 no matching `@end menu\'

';

$result_nodes_list{'menu_no_closed_entry_beginning'} = '';

$result_sections_list{'menu_no_closed_entry_beginning'} = '';

$result_sectioning_root{'menu_no_closed_entry_beginning'} = '';

$result_headings_list{'menu_no_closed_entry_beginning'} = '';

1;
