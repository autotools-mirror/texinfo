use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'print_merged_index'} = '*document_root C3
 *before_node_section C1
  *preamble C1
   *normal_command@syncodeindex C1 l1
   |misc_args:A{fn|cp}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:fn cp}
     {spaces_after_argument:\\n}
 *normal_command@node C1 l2 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C2 l3 {chap}
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  *normal_command@printindex C1 l4
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:fn}
';


$result_texis{'print_merged_index'} = '@syncodeindex fn cp
@node Top
@node chap
@printindex fn';


$result_texts{'print_merged_index'} = '';

$result_errors{'print_merged_index'} = '* W l4|printing an index `fn\' merged in another one, `cp\'
 warning: printing an index `fn\' merged in another one, `cp\'

* W l3|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_indices{'print_merged_index'} = 'cp
fn C ->cp
ky C
pg C
tp C
vr C
';

$result_nodes_list{'print_merged_index'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'print_merged_index'} = '';

$result_sectioning_root{'print_merged_index'} = '';

$result_headings_list{'print_merged_index'} = '';

1;
