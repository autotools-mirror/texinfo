use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_top_section'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@top C4 l1 {First top}
 |identifier:{First-top}
 |is_target:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:First top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:First top.\\n}
  {empty_line:\\n}
 *normal_command@top C3 l5 {Second top}
 |identifier:{Second-top}
 |is_target:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Second top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Second top.\\n}
';


$result_texis{'double_top_section'} = '@top First top

First top.

@top Second top

Second top.
';


$result_texts{'double_top_section'} = 'First top
*********

First top.

Second top
**********

Second top.
';

$result_errors{'double_top_section'} = '* W l5|multiple @top
 warning: multiple @top

';

$result_nodes_list{'double_top_section'} = '';

$result_sections_list{'double_top_section'} = '1|First top
 section_directions:
  next->Second top
 toplevel_directions:
  next->Second top
2|Second top
 section_directions:
  prev->First top
 toplevel_directions:
  prev->First top
  up->First top
';

$result_sectioning_root{'double_top_section'} = 'level: -1
list:
 1|First top
 2|Second top
';

$result_headings_list{'double_top_section'} = '';

1;
