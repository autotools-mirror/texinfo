use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'group_beginning_and_end_on_line'} = '*document_root C1
 *before_node_section C1
  *@group C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
     {within}
   *@end C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{group}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {group}
';


$result_texis{'group_beginning_and_end_on_line'} = '@group within @end group
';


$result_texts{'group_beginning_and_end_on_line'} = '';

$result_errors{'group_beginning_and_end_on_line'} = '* W l1|@end should only appear at the beginning of a line
 warning: @end should only appear at the beginning of a line

* W l1|unexpected argument on @group line: within
 warning: unexpected argument on @group line: within

';

$result_nodes_list{'group_beginning_and_end_on_line'} = '';

$result_sections_list{'group_beginning_and_end_on_line'} = '';

$result_sectioning_root{'group_beginning_and_end_on_line'} = '';

$result_headings_list{'group_beginning_and_end_on_line'} = '';

1;
