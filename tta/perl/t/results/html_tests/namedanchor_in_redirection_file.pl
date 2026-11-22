use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'namedanchor_in_redirection_file'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 l5 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l7
  |identifier:{notitle}
  |is_target:{1}
   *brace_arg C1
    {normal_text:notitle}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *normal_command@namedanchor C2 l9
  |identifier:{the-spot}
  |is_target:{1}
   *brace_arg C1
    {normal_text:the spot}
   *brace_arg C2
    {spaces_before_argument: }
    {normal_text:named in a way}
  {spaces_after_close_brace:\\n}
';


$result_texis{'namedanchor_in_redirection_file'} = '@node Top
@top top

@node chap
@chapter Chap

@anchor{notitle}

@namedanchor{the spot, named in a way}
';


$result_texts{'namedanchor_in_redirection_file'} = 'top
***

1 Chap
******


';

$result_errors{'namedanchor_in_redirection_file'} = '';

$result_nodes_list{'namedanchor_in_redirection_file'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'namedanchor_in_redirection_file'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'namedanchor_in_redirection_file'} = 'level: -1
list:
 1|top
';

$result_headings_list{'namedanchor_in_redirection_file'} = '';

1;
