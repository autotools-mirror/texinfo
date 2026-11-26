use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'filenameconflictwithspecialelement'} = '*document_root C5
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
 *normal_command@top C4 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@footnote C1 l4
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {normal_text:a footnote}
   {normal_text:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 l7 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Need 2 elements for separate footnotes.\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l11
  |identifier:{filenameconflictwithspecialelement-fot}
  |is_target:{1}
   *brace_arg C1
    {normal_text:filenameconflictwithspecialelement fot}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
';


$result_texis{'filenameconflictwithspecialelement'} = '@node Top
@top top

@footnote{a footnote}

@node chap
@chapter chap

Need 2 elements for separate footnotes.

@anchor{filenameconflictwithspecialelement fot}

';


$result_texts{'filenameconflictwithspecialelement'} = 'top
***



1 chap
******

Need 2 elements for separate footnotes.


';

$result_errors{'filenameconflictwithspecialelement'} = '';

$result_nodes_list{'filenameconflictwithspecialelement'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'filenameconflictwithspecialelement'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'filenameconflictwithspecialelement'} = 'level: -1
list:
 1|top
';

$result_headings_list{'filenameconflictwithspecialelement'} = '';

$result_converted_errors{'file_html'}->{'filenameconflictwithspecialelement'} = '* W l11|@anchor `filenameconflictwithspecialelement fot\' file filenameconflictwithspecialelement-fot.html for redirection exists
 warning: @anchor `filenameconflictwithspecialelement fot\' file filenameconflictwithspecialelement-fot.html for redirection exists

* WC |conflict with footnotes special element
 warning: conflict with footnotes special element

';

1;
