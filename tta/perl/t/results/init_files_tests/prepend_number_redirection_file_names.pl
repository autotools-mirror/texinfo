use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'prepend_number_redirection_file_names'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {Chap}
 |EXTRA
 |identifier:{Chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chap}
    {spaces_after_argument:\\n}
 *@chapter C5 l5 {The chapt}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {The chapt}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@anchor C1 l7
  |EXTRA
  |identifier:{Up-and-Down}
  |is_target:{1}
   *brace_arg C1
    {Up and Down}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *@node C1 l9 {4 section}
 |EXTRA
 |identifier:{4-section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {4 section}
    {spaces_after_argument:\\n}
 *@section C6 l10 {Sect}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Sect}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@anchor C1 l12
  |EXTRA
  |identifier:{12-lowerc}
  |is_target:{1}
   *brace_arg C1
    {12 lowerc}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C8
   *@xref C1 l14
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Up-and-Down}
     {Up and Down}
   {.\\n}
   *@xref C1 l15
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Chap}
     {Chap}
   {.\\n}
   *@xref C1 l16
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{4-section}
     {4 section}
   {.\\n}
   *@xref C1 l17
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{12-lowerc}
     {12 lowerc}
   {.\\n}
';


$result_texis{'prepend_number_redirection_file_names'} = '@node Top
@top top

@node Chap
@chapter The chapt

@anchor{Up and Down}

@node 4 section
@section Sect

@anchor{12 lowerc}

@xref{Up and Down}.
@xref{Chap}.
@xref{4 section}.
@xref{12 lowerc}.
';


$result_texts{'prepend_number_redirection_file_names'} = 'top
***

1 The chapt
***********


1.1 Sect
========


Up and Down.
Chap.
4 section.
12 lowerc.
';

$result_errors{'prepend_number_redirection_file_names'} = '';

$result_nodes_list{'prepend_number_redirection_file_names'} = '1|Top
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
3|4 section
 associated_section: 1.1 Sect
 associated_title_command: 1.1 Sect
 node_directions:
  up->Chap
';

$result_sections_list{'prepend_number_redirection_file_names'} = '1|top
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
 associated_anchor_command: 4 section
 associated_node: 4 section
 section_directions:
  up->The chapt
';

$result_sectioning_root{'prepend_number_redirection_file_names'} = 'level: -1
list:
 1|top
';

$result_headings_list{'prepend_number_redirection_file_names'} = '';

1;
