use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'add_lower_case_redirection_file_names'} = '*document_root C7
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
 *normal_command@node C1 l4 {Chap}
 |identifier:{Chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 l5 {The chapt}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:The chapt}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l7
  |identifier:{Up-and-Down}
  |is_target:{1}
   *brace_arg C1
    {normal_text:Up and Down}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {section}
 |identifier:{section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
 *normal_command@section C6 l10 {Sect}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Sect}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l12
  |identifier:{lowerc}
  |is_target:{1}
   *brace_arg C1
    {normal_text:lowerc}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C8
   *normal_command@xref C1 l14
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Up-and-Down}
     {normal_text:Up and Down}
   {normal_text:.\\n}
   *normal_command@xref C1 l15
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Chap}
     {normal_text:Chap}
   {normal_text:.\\n}
   *normal_command@xref C1 l16
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{section}
     {normal_text:section}
   {normal_text:.\\n}
   *normal_command@xref C1 l17
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{lowerc}
     {normal_text:lowerc}
   {normal_text:.\\n}
';


$result_texis{'add_lower_case_redirection_file_names'} = '@node Top
@top top

@node Chap
@chapter The chapt

@anchor{Up and Down}

@node section
@section Sect

@anchor{lowerc}

@xref{Up and Down}.
@xref{Chap}.
@xref{section}.
@xref{lowerc}.
';


$result_texts{'add_lower_case_redirection_file_names'} = 'top
***

1 The chapt
***********


1.1 Sect
========


Up and Down.
Chap.
section.
lowerc.
';

$result_errors{'add_lower_case_redirection_file_names'} = '';

$result_nodes_list{'add_lower_case_redirection_file_names'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chap
2|Chap
 associated_section: 1 The chapt
 associated_title_command: 1 The chapt
 node_directions:
  prev->Top
  up->Top
3|section
 associated_section: 1.1 Sect
 associated_title_command: 1.1 Sect
 node_directions:
  up->Chap
';

$result_sections_list{'add_lower_case_redirection_file_names'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->The chapt
 section_children:
  1|The chapt
2|The chapt
 associated_anchor_command: Chap
 associated_node: Chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|Sect
3|Sect
 associated_anchor_command: section
 associated_node: section
 section_directions:
  up->The chapt
';

$result_sectioning_root{'add_lower_case_redirection_file_names'} = 'level: -1
list:
 1|top
';

$result_headings_list{'add_lower_case_redirection_file_names'} = '';

$result_converted_errors{'file_html'}->{'add_lower_case_redirection_file_names'} = '* W l4|@node `Chap\' file chap.html for redirection exists
 warning: @node `Chap\' file chap.html for redirection exists

* WC l4|conflict with @node `Chap\' file
 warning: conflict with @node `Chap\' file

';

1;
