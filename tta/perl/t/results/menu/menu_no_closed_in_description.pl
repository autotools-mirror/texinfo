use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'menu_no_closed_in_description'} = '*document_root C1
 *before_node_section C1
  *@menu C2 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l2
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:{manual_in_menu}
     {(}
     {manual_in_menu}
     {)}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {desc}
';


$result_texis{'menu_no_closed_in_description'} = '@menu
* (manual_in_menu):: desc';


$result_texts{'menu_no_closed_in_description'} = '* (manual_in_menu):: desc
';

$result_errors{'menu_no_closed_in_description'} = '* E l1|no matching `@end menu\'
 no matching `@end menu\'

';

$result_nodes_list{'menu_no_closed_in_description'} = '';

$result_sections_list{'menu_no_closed_in_description'} = '';

$result_sectioning_root{'menu_no_closed_in_description'} = '';

$result_headings_list{'menu_no_closed_in_description'} = '';

1;
