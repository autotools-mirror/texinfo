use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'email_in_node'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {@email{ a } @email{c , d} @email{ , e}}
 |identifier:{a-c-}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@email C1 l1
     *brace_arg C3
      {spaces_before_argument: }
      {normal_text:a}
      {spaces_after_argument: }
    {normal_text: }
    *normal_command@email C2 l1
     *brace_arg C2
      {normal_text:c}
      {spaces_after_argument: }
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:d}
    {normal_text: }
    *normal_command@email C2 l1
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:e}
    {spaces_after_argument:\\n}
';


$result_texis{'email_in_node'} = '@node @email{ a } @email{c , d} @email{ , e}
';


$result_texts{'email_in_node'} = '';

$result_errors{'email_in_node'} = '';

$result_nodes_list{'email_in_node'} = '1|@email{ a } @email{c , d} @email{ , e}
';

$result_sections_list{'email_in_node'} = '';

$result_sectioning_root{'email_in_node'} = '';

$result_headings_list{'email_in_node'} = '';

1;
