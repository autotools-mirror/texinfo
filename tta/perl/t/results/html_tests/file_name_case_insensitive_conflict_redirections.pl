use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'file_name_case_insensitive_conflict_redirections'} = '*document_root C4
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
 *normal_command@chapter C7 l4 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C5 l6
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@samp l6
     {spaces_after_argument:\\n}
   *before_item C1
    {empty_line:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l8
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:foo}
       {spaces_after_argument:\\n}
    *table_definition C4
     *normal_command@anchor C1 l9
     |identifier:{foo}
     |is_target:{1}
      *brace_arg C1
       {normal_text:foo}
     {spaces_after_close_brace:\\n}
     *paragraph C3
      {normal_text:Some text about }
      *normal_command@samp C1 l10
       *brace_container C1
        {normal_text:foo}
      {normal_text:\\n}
     {empty_line:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l12
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:Foo}
       {spaces_after_argument:\\n}
    *table_definition C4
     *normal_command@anchor C1 l13
     |identifier:{Foo}
     |is_target:{1}
      *brace_arg C1
       {normal_text:Foo}
     {spaces_after_close_brace:\\n}
     *paragraph C3
      {normal_text:Some text about }
      *normal_command@samp C1 l14
       *brace_container C1
        {normal_text:Foo}
      {normal_text:\\n}
     {empty_line:\\n}
   *normal_command@end C1 l16
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
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


$result_texis{'file_name_case_insensitive_conflict_redirections'} = '@node Top
@top top section

@chapter Chapter

@table @samp

@item foo
@anchor{foo}
Some text about @samp{foo}

@item Foo
@anchor{Foo}
Some text about @samp{Foo}

@end table

@xref{foo}

@xref{Foo}
';


$result_texts{'file_name_case_insensitive_conflict_redirections'} = 'top section
***********

1 Chapter
*********


foo
Some text about foo

Foo
Some text about Foo


foo

Foo
';

$result_errors{'file_name_case_insensitive_conflict_redirections'} = '';

$result_nodes_list{'file_name_case_insensitive_conflict_redirections'} = '1|Top
 associated_section: top section
 associated_title_command: top section
';

$result_sections_list{'file_name_case_insensitive_conflict_redirections'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'file_name_case_insensitive_conflict_redirections'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'file_name_case_insensitive_conflict_redirections'} = '';

$result_converted_errors{'file_html'}->{'file_name_case_insensitive_conflict_redirections'} = '* W l13|@anchor `Foo\' file foo.html for redirection exists
 warning: @anchor `Foo\' file foo.html for redirection exists

* WC l9|conflict with @anchor `foo\' redirection file
 warning: conflict with @anchor `foo\' redirection file

';

1;
