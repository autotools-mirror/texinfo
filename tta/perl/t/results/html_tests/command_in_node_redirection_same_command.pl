use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'command_in_node_redirection_same_command'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l2 {t @r{in r}}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:t }
    *normal_command@r C1 l2
     *brace_container C1
      {normal_text:in r}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l4
  |EXTRA
  |identifier:{ancher}
  |is_target:{1}
   *brace_arg C1
    *normal_command@r C1 l4
     *brace_container C1
      {normal_text:ancher}
  {spaces_after_close_brace:\\n}
';


$result_texis{'command_in_node_redirection_same_command'} = '@node Top
@top t @r{in r}

@anchor{@r{ancher}}
';


$result_texts{'command_in_node_redirection_same_command'} = 't in r
******

';

$result_errors{'command_in_node_redirection_same_command'} = '';

$result_nodes_list{'command_in_node_redirection_same_command'} = '1|Top
 associated_section: t @r{in r}
 associated_title_command: t @r{in r}
';

$result_sections_list{'command_in_node_redirection_same_command'} = '1|t @r{in r}
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'command_in_node_redirection_same_command'} = 'level: -1
list:
 1|t @r{in r}
';

$result_headings_list{'command_in_node_redirection_same_command'} = '';

1;
