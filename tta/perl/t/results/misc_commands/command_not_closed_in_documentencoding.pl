use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'command_not_closed_in_documentencoding'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@documentencoding C1 l1
   |global_command_number:{1}
    *line_arg C2
     {spaces_before_argument: }
     *normal_command@strong l1
';


$result_texis{'command_not_closed_in_documentencoding'} = '@documentencoding @strong';


$result_texts{'command_not_closed_in_documentencoding'} = '';

$result_errors{'command_not_closed_in_documentencoding'} = '* W l1|@strong should not appear in @documentencoding
 warning: @strong should not appear in @documentencoding

* E l1|@strong missing closing brace
 @strong missing closing brace

* E l1|bad argument to @documentencoding: @strong
 bad argument to @documentencoding: @strong

';

$result_nodes_list{'command_not_closed_in_documentencoding'} = '';

$result_sections_list{'command_not_closed_in_documentencoding'} = '';

$result_sectioning_root{'command_not_closed_in_documentencoding'} = '';

$result_headings_list{'command_not_closed_in_documentencoding'} = '';

1;
