use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'menu_no_closed_star'} = '*document_root C1
 *before_node_section C1
  *@menu C2 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C1
     {* }
';


$result_texis{'menu_no_closed_star'} = '@menu
* ';


$result_texts{'menu_no_closed_star'} = '* ';

$result_errors{'menu_no_closed_star'} = '* E l1|no matching `@end menu\'
 no matching `@end menu\'

';

$result_nodes_list{'menu_no_closed_star'} = '';

$result_sections_list{'menu_no_closed_star'} = '';

$result_sectioning_root{'menu_no_closed_star'} = '';

$result_headings_list{'menu_no_closed_star'} = '';

1;
