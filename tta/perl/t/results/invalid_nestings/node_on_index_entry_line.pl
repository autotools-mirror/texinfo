use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'node_on_index_entry_line'} = '*document_root C2
 *before_node_section C3
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content
  *index_entry_command@cindex C1 l2
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entry}
    {spaces_after_argument: }
 *normal_command@node C3 l2 {a}
 |identifier:{a}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:a}
   *line_arg C5
   |manual_content:A{2|2}
   |node_content:A{4|4}
   |normalized:{b}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:m}
    {normal_text:)}
    {normal_text:b}
   *line_arg C5
   |manual_content:A{2|2}
   |node_content:A{4|4}
   |normalized:{c}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:m}
    {normal_text:)}
    {normal_text:c}
   *line_arg C6
   |manual_content:A{2|2}
   |node_content:A{4|4}
   |normalized:{d}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:h}
    {normal_text:)}
    {normal_text:d}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Content\\n}
';


$result_texis{'node_on_index_entry_line'} = '
@cindex entry @node a, (m)b, (m)c, (h)d

Content
';


$result_texts{'node_on_index_entry_line'} = '
Content
';

$result_errors{'node_on_index_entry_line'} = '* W l2|@node should only appear at the beginning of a line
 warning: @node should only appear at the beginning of a line

* W l2|@node should not appear on @cindex line
 warning: @node should not appear on @cindex line

* W l2|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'node_on_index_entry_line'} = '1|a
 node_directions:
  next-> (m)b
  prev-> (m)c
  up-> (h)d

';

$result_sections_list{'node_on_index_entry_line'} = '';

$result_sectioning_root{'node_on_index_entry_line'} = '';

$result_headings_list{'node_on_index_entry_line'} = '';

$result_indices_sort_strings{'node_on_index_entry_line'} = 'cp:
 entry
';

1;
