use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ignore_not_closed'} = '*document_root C1
 *before_node_section C1
  *@ignore C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {raw:\\n}
   {raw:This is ignored\\n}
';


$result_texis{'ignore_not_closed'} = '@ignore

This is ignored
';


$result_texts{'ignore_not_closed'} = '';

$result_errors{'ignore_not_closed'} = '* E l1|no matching `@end ignore\'
 no matching `@end ignore\'

';

$result_nodes_list{'ignore_not_closed'} = '';

$result_sections_list{'ignore_not_closed'} = '';

$result_sectioning_root{'ignore_not_closed'} = '';

$result_headings_list{'ignore_not_closed'} = '';

1;
