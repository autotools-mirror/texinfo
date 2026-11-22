use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_insert_nodes_with_empty_headings'} = '*document_root C12
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |added:{1}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l1 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l3 {Chap}
 |added:{1}
 |identifier:{Chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l3 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l5 { [+1+]}
 |added:{1}
 |identifier:{-_005b_002b1_002b_005d}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:}
    {normal_text: [+1+]}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l5
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 { [+2+]}
 |added:{1}
 |identifier:{-_005b_002b2_002b_005d}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:}
    {normal_text: [+2+]}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l7
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {@strong{}}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@strong C1 l9
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@node C1 l10 {@strong{} [+3+]}
 |added:{1}
 |identifier:{-_005b_002b3_002b_005d}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    *normal_command@strong C1
     *brace_container
    {normal_text: [+3+]}
    {spaces_after_argument:\\n}
 *normal_command@section C1 l10 {@strong{}}
 |section_heading_number:{1.3}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@strong C1 l10
     *brace_container
    {spaces_after_argument:\\n}
';


$result_texis{'test_insert_nodes_with_empty_headings'} = '@node Top
@top top

@node Chap
@chapter Chap

@node  [+1+]
@section

@node  [+2+]
@section

@node @strong{}
@node @strong{} [+3+]
@section @strong{}
';


$result_texts{'test_insert_nodes_with_empty_headings'} = 'top
***

1 Chap
******

1.1 
====

1.2 
====

1.3 
====
';

$result_errors{'test_insert_nodes_with_empty_headings'} = '* W l5|@section missing argument
 warning: @section missing argument

* W l7|@section missing argument
 warning: @section missing argument

* E l9|empty node name after expansion `@strong{}\'
 empty node name after expansion `@strong{}\'

';

$result_nodes_list{'test_insert_nodes_with_empty_headings'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chap
2|Chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
3| [+1+]
 associated_section: 1.1
 associated_title_command: 1.1
 node_directions:
  next-> [+2+]
  up->Chap
4| [+2+]
 associated_section: 1.2
 associated_title_command: 1.2
 node_directions:
  next->@strong{} [+3+]
  prev-> [+1+]
  up->Chap
5|@strong{} [+3+]
 associated_section: 1.3 @strong{}
 associated_title_command: 1.3 @strong{}
 node_directions:
  prev-> [+2+]
  up->Chap
';

$result_sections_list{'test_insert_nodes_with_empty_headings'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: Chap
 associated_node: Chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|
  2|
  3|@strong{}
3
 associated_anchor_command:  [+1+]
 associated_node:  [+1+]
 section_directions:
  next->
  up->Chap
4
 associated_anchor_command:  [+2+]
 associated_node:  [+2+]
 section_directions:
  next->@strong{}
  prev->
  up->Chap
5|@strong{}
 associated_anchor_command: @strong{} [+3+]
 associated_node: @strong{} [+3+]
 section_directions:
  prev->
  up->Chap
';

$result_sectioning_root{'test_insert_nodes_with_empty_headings'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_insert_nodes_with_empty_headings'} = '';

1;
