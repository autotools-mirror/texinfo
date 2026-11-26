use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'file_name_case_insensitive_conflict_node'} = '*document_root C11
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
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
 *normal_command@chapter C5 l5 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l7
  |identifier:{fOO}
  |is_target:{1}
   *brace_arg C1
    {normal_text:fOO}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {Foo}
 |identifier:{Foo}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Foo}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l10 {Foo}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Foo}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l12 {Bar}
 |identifier:{Bar}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Bar}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l13 {Bar}
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Bar}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l15 {foo}
 |identifier:{foo}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:foo}
    {spaces_after_argument:\\n}
 *normal_command@section C5 l16 {foo}
 |section_heading_number:{1.3}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:foo}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l18
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{foo}
     {normal_text:foo}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l20
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Foo}
     {normal_text:Foo}
   {normal_text:\\n}
';


$result_texis{'file_name_case_insensitive_conflict_node'} = '@node Top
@top top section

@node chap
@chapter Chapter

@anchor{fOO}

@node Foo
@section Foo

@node Bar
@section Bar

@node foo
@section foo

@xref{foo}

@xref{Foo}
';


$result_texts{'file_name_case_insensitive_conflict_node'} = 'top section
***********

1 Chapter
*********


1.1 Foo
=======

1.2 Bar
=======

1.3 foo
=======

foo

Foo
';

$result_errors{'file_name_case_insensitive_conflict_node'} = '';

$result_nodes_list{'file_name_case_insensitive_conflict_node'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
3|Foo
 associated_section: 1.1 Foo
 associated_title_command: 1.1 Foo
 node_directions:
  next->Bar
  up->chap
4|Bar
 associated_section: 1.2 Bar
 associated_title_command: 1.2 Bar
 node_directions:
  next->foo
  prev->Foo
  up->chap
5|foo
 associated_section: 1.3 foo
 associated_title_command: 1.3 foo
 node_directions:
  prev->Bar
  up->chap
';

$result_sections_list{'file_name_case_insensitive_conflict_node'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
 section_children:
  1|Foo
  2|Bar
  3|foo
3|Foo
 associated_anchor_command: Foo
 associated_node: Foo
 section_directions:
  next->Bar
  up->Chapter
4|Bar
 associated_anchor_command: Bar
 associated_node: Bar
 section_directions:
  next->foo
  prev->Foo
  up->Chapter
5|foo
 associated_anchor_command: foo
 associated_node: foo
 section_directions:
  prev->Bar
  up->Chapter
';

$result_sectioning_root{'file_name_case_insensitive_conflict_node'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'file_name_case_insensitive_conflict_node'} = '';

$result_converted_errors{'file_html'}->{'file_name_case_insensitive_conflict_node'} = '* W l7|@anchor `fOO\' file Foo.html for redirection exists
 warning: @anchor `fOO\' file Foo.html for redirection exists

* WC l9|conflict with @node `Foo\' file
 warning: conflict with @node `Foo\' file

* W l15|@node `foo\' file Foo.html for redirection exists
 warning: @node `foo\' file Foo.html for redirection exists

* WC l9|conflict with @node `Foo\' file
 warning: conflict with @node `Foo\' file

';

1;
