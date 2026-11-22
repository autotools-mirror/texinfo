use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_recursive_self_section_reference_node_no_use_node'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {n1}
 |EXTRA
 |identifier:{n1}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:n1}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l2 {@ref{n2}}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@ref C1 l2
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{n2}
      {normal_text:n2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {n2}
 |EXTRA
 |identifier:{n2}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:n2}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l5 {@ref{n1}}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@ref C1 l5
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{n1}
      {normal_text:n1}
    {spaces_after_argument:\\n}
';


$result_texis{'double_recursive_self_section_reference_node_no_use_node'} = '@node n1
@chapter @ref{n2}

@node n2
@chapter @ref{n1}
';


$result_texts{'double_recursive_self_section_reference_node_no_use_node'} = '1 n2
****

2 n1
****
';

$result_errors{'double_recursive_self_section_reference_node_no_use_node'} = '';

$result_nodes_list{'double_recursive_self_section_reference_node_no_use_node'} = '1|n1
 associated_section: 1 @ref{n2}
 associated_title_command: 1 @ref{n2}
 node_directions:
  next->n2
2|n2
 associated_section: 2 @ref{n1}
 associated_title_command: 2 @ref{n1}
 node_directions:
  prev->n1
';

$result_sections_list{'double_recursive_self_section_reference_node_no_use_node'} = '1|@ref{n2}
 associated_anchor_command: n1
 associated_node: n1
 section_directions:
  next->@ref{n1}
 toplevel_directions:
  next->@ref{n1}
2|@ref{n1}
 associated_anchor_command: n2
 associated_node: n2
 section_directions:
  prev->@ref{n2}
 toplevel_directions:
  prev->@ref{n2}
';

$result_sectioning_root{'double_recursive_self_section_reference_node_no_use_node'} = 'level: 0
list:
 1|@ref{n2}
 2|@ref{n1}
';

$result_headings_list{'double_recursive_self_section_reference_node_no_use_node'} = '';

$result_converted_errors{'file_html'}->{'double_recursive_self_section_reference_node_no_use_node'} = '* W double_recursive_self_section_reference_node_no_use_node.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
