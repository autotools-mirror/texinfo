use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'node_in_copying'} = '*document_root C2
 *before_node_section C1
  *@copying C1 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
 *@node C2 l2 {node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {node}
  {empty_line:\\n}
';


$result_texis{'node_in_copying'} = '@copying
@node node

';


$result_texts{'node_in_copying'} = '
';

$result_errors{'node_in_copying'} = '* E l2|@node seen before @end copying
 @node seen before @end copying

* E l4|unmatched `@end copying\'
 unmatched `@end copying\'

';

$result_nodes_list{'node_in_copying'} = '1|node
';

$result_sections_list{'node_in_copying'} = '';

$result_sectioning_root{'node_in_copying'} = '';

$result_headings_list{'node_in_copying'} = '';

1;
