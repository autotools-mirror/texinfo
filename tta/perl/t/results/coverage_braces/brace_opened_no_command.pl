use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'brace_opened_no_command'} = '*document_root C2
 *before_node_section C2
  *preamble_before_content
  *paragraph C5
   {normal_text:anchortruc}
   *normal_command@}
   {normal_text: }
   *normal_command@anchor C1 l1
   |identifier:{truc}
   |is_target:{1}
    *brace_arg C1
     {normal_text:truc}
   {normal_text:.\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:}
';


$result_texis{'brace_opened_no_command'} = 'anchortruc@} @anchor{truc}.
@bye';


$result_texts{'brace_opened_no_command'} = 'anchortruc} .
';

$result_errors{'brace_opened_no_command'} = '* E l1|misplaced {
 misplaced {

';

$result_nodes_list{'brace_opened_no_command'} = '';

$result_sections_list{'brace_opened_no_command'} = '';

$result_sectioning_root{'brace_opened_no_command'} = '';

$result_headings_list{'brace_opened_no_command'} = '';

1;
