use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'command_in_end_ignored_raw_command_after'} = '*document_root C1
 *before_node_section C1
  *preamble C1
   *normal_command@html C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *elided_rawpreformatted C1
     {raw:In html\\n}
    *normal_command@end C1 l3
    |text_arg:{html}
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:html}
      *normal_command@asis C1 l3
       *brace_container C1
        {normal_text:asis}
      {spaces_after_argument:\\n}
';


$result_texis{'command_in_end_ignored_raw_command_after'} = '@html
In html
@end html@asis{asis}
';


$result_texts{'command_in_end_ignored_raw_command_after'} = '';

$result_errors{'command_in_end_ignored_raw_command_after'} = '* W l3|@asis should not appear in @end
 warning: @asis should not appear in @end

* E l3|bad argument to @end: html@asis{asis}
 bad argument to @end: html@asis{asis}

';

$result_nodes_list{'command_in_end_ignored_raw_command_after'} = '';

$result_sections_list{'command_in_end_ignored_raw_command_after'} = '';

$result_sectioning_root{'command_in_end_ignored_raw_command_after'} = '';

$result_headings_list{'command_in_end_ignored_raw_command_after'} = '';

1;
