use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'file_name_conflict_with_user_defined'} = '*document_root C7
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
 *normal_command@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {Chapter 1}
 |EXTRA
 |identifier:{Chapter-1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter 1}
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 l5 {Chap 1}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l7
  |EXTRA
  |identifier:{myanchor}
  |is_target:{1}
   *brace_arg C1
    {normal_text:myanchor}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {Chapter 2}
 |EXTRA
 |identifier:{Chapter-2}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter 2}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l10 {Chap 2}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap 2}
    {spaces_after_argument:\\n}
';


$result_texis{'file_name_conflict_with_user_defined'} = '@node Top
@top top

@node Chapter 1
@chapter Chap 1

@anchor{myanchor}

@node Chapter 2
@chapter Chap 2
';


$result_texts{'file_name_conflict_with_user_defined'} = 'top
***

1 Chap 1
********


2 Chap 2
********
';

$result_errors{'file_name_conflict_with_user_defined'} = '';

$result_nodes_list{'file_name_conflict_with_user_defined'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chapter 1
2|Chapter 1
 associated_section: 1 Chap 1
 associated_title_command: 1 Chap 1
 node_directions:
  next->Chapter 2
  prev->Top
  up->Top
3|Chapter 2
 associated_section: 2 Chap 2
 associated_title_command: 2 Chap 2
 node_directions:
  prev->Chapter 1
  up->Top
';

$result_sections_list{'file_name_conflict_with_user_defined'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap 1
 section_children:
  1|Chap 1
  2|Chap 2
2|Chap 1
 associated_anchor_command: Chapter 1
 associated_node: Chapter 1
 section_directions:
  next->Chap 2
  up->top
 toplevel_directions:
  next->Chap 2
  prev->top
  up->top
3|Chap 2
 associated_anchor_command: Chapter 2
 associated_node: Chapter 2
 section_directions:
  prev->Chap 1
  up->top
 toplevel_directions:
  prev->Chap 1
  up->top
';

$result_sectioning_root{'file_name_conflict_with_user_defined'} = 'level: -1
list:
 1|top
';

$result_headings_list{'file_name_conflict_with_user_defined'} = '';

$result_converted_errors{'file_html'}->{'file_name_conflict_with_user_defined'} = '* W l7|@anchor `myanchor\' file myanchor.html for redirection exists
 warning: @anchor `myanchor\' file myanchor.html for redirection exists

* WC |conflict with user-defined file
 warning: conflict with user-defined file

';

1;
