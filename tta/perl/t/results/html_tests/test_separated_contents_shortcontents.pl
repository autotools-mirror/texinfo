use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_separated_contents_shortcontents'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@contents C1 l1
   |EXTRA
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l4 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l7 {chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {app}
 |EXTRA
 |identifier:{app}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:app}
    {spaces_after_argument:\\n}
 *normal_command@appendix C3 l10 {appendix}
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:appendix}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@shortcontents C1 l12
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'test_separated_contents_shortcontents'} = '@contents

@node Top
@top top

@node chap
@chapter chapter

@node app
@appendix appendix

@shortcontents
';


$result_texts{'test_separated_contents_shortcontents'} = '
top
***

1 chapter
*********

Appendix A appendix
*******************

';

$result_errors{'test_separated_contents_shortcontents'} = '';

$result_nodes_list{'test_separated_contents_shortcontents'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  next->app
  prev->Top
  up->Top
3|app
 associated_section: A appendix
 associated_title_command: A appendix
 node_directions:
  prev->chap
  up->Top
';

$result_sections_list{'test_separated_contents_shortcontents'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
  2|appendix
2|chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  next->appendix
  up->top
 toplevel_directions:
  next->appendix
  prev->top
  up->top
3|appendix
 associated_anchor_command: app
 associated_node: app
 section_directions:
  prev->chapter
  up->top
 toplevel_directions:
  prev->chapter
  up->top
';

$result_sectioning_root{'test_separated_contents_shortcontents'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_separated_contents_shortcontents'} = '';

1;
