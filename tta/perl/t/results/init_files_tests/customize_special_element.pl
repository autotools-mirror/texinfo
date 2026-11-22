use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'customize_special_element'} = '*document_root C7
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C3
   *normal_command@contents C1 l2
   |EXTRA
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@shortcontents C1 l3
   |EXTRA
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l5 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l6 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l8 {Chapter}
 |EXTRA
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l9 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l11
  |EXTRA
  |global_command_number:{1}
  |text_arg:{fr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l12 {Chapter fr}
 |EXTRA
 |identifier:{Chapter-fr}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter fr}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l13 {chap fr}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap fr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Text}
   *normal_command@footnote C1 l15
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {normal_text:In footnote}
   {normal_text:.\\n}
';


$result_texis{'customize_special_element'} = '
@contents
@shortcontents

@node Top
@top top

@node Chapter
@chapter chap

@documentlanguage fr
@node Chapter fr
@chapter chap fr

Text@footnote{In footnote}.
';


$result_texts{'customize_special_element'} = '
top
***

1 chap
******

2 chap fr
*********

Text.
';

$result_errors{'customize_special_element'} = '';

$result_nodes_list{'customize_special_element'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chapter
2|Chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  next->Chapter fr
  prev->Top
  up->Top
3|Chapter fr
 associated_section: 2 chap fr
 associated_title_command: 2 chap fr
 node_directions:
  prev->Chapter
  up->Top
';

$result_sections_list{'customize_special_element'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
  2|chap fr
2|chap
 associated_anchor_command: Chapter
 associated_node: Chapter
 section_directions:
  next->chap fr
  up->top
 toplevel_directions:
  next->chap fr
  prev->top
  up->top
3|chap fr
 associated_anchor_command: Chapter fr
 associated_node: Chapter fr
 section_directions:
  prev->chap
  up->top
 toplevel_directions:
  prev->chap
  up->top
';

$result_sectioning_root{'customize_special_element'} = 'level: -1
list:
 1|top
';

$result_headings_list{'customize_special_element'} = '';

1;
