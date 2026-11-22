use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'extension_undef'} = '*document_root C4
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   {normal_text:node Top\\n}
 *@top C2 l2 {top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *@chapter C1 l5 {Chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
';


$result_texis{'extension_undef'} = 'node Top
@top top

@node chapter
@chapter Chap
';


$result_texts{'extension_undef'} = 'node Top
top
***

1 Chap
******
';

$result_errors{'extension_undef'} = '';

$result_nodes_list{'extension_undef'} = '1|chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
';

$result_sections_list{'extension_undef'} = '1|top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'extension_undef'} = 'level: -1
list:
 1|top
';

$result_headings_list{'extension_undef'} = '';

$result_converted_errors{'file_info'}->{'extension_undef'} = '* W extension_undef.texi|document without Top node
 warning: document without Top node

* W l2|@top outside of any node
 warning: @top outside of any node

';

1;
