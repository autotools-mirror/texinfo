use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'directions_buttons'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@contents C1 l1
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l4 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l7 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l9
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l11 {@code{append}ix}
 |identifier:{appendix}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    *normal_command@code C1 l11
     *brace_container C1
      {normal_text:append}
    {normal_text:ix}
    {spaces_after_argument:\\n}
 *normal_command@appendix C3 l12 {App}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:App}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l14
  |element_node:{appendix}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Here}
    {spaces_after_argument:\\n}
';


$result_texis{'directions_buttons'} = '@contents

@node Top
@top top

@node chapter
@chapter chap

@printindex cp

@node @code{append}ix
@appendix App

@cindex Here
';


$result_texts{'directions_buttons'} = '
top
***

1 chap
******


Appendix A App
**************

';

$result_errors{'directions_buttons'} = '';

$result_nodes_list{'directions_buttons'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  next->@code{append}ix
  prev->Top
  up->Top
3|@code{append}ix
 associated_section: A App
 associated_title_command: A App
 node_directions:
  prev->chapter
  up->Top
';

$result_sections_list{'directions_buttons'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
  2|App
2|chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->App
  up->top
 toplevel_directions:
  next->App
  prev->top
  up->top
3|App
 associated_anchor_command: @code{append}ix
 associated_node: @code{append}ix
 section_directions:
  prev->chap
  up->top
 toplevel_directions:
  prev->chap
  up->top
';

$result_sectioning_root{'directions_buttons'} = 'level: -1
list:
 1|top
';

$result_headings_list{'directions_buttons'} = '';

$result_indices_sort_strings{'directions_buttons'} = 'cp:
 Here
';

$result_converted_sort_strings{'file_html'}->{'directions_buttons'} = 'cp:
 Here
';

1;
