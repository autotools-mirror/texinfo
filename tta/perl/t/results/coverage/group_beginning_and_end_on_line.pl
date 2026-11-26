use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'group_beginning_and_end_on_line'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@group C2 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:within}
     {spaces_after_argument: }
   *normal_command@end C1 l1
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
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
