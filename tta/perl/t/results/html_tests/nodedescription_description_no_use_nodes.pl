use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodedescription_description_no_use_nodes'} = '*document_root C9
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
 *@top C2 l2 {test of descriptions with nodedescription*}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {test of descriptions with nodedescription*}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {toto}
 |EXTRA
 |identifier:{toto}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {toto}
    {spaces_after_argument:\\n}
 *@chapter C6 l5 {Toto}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Toto}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescription C1 l7
   *line_arg C10
    {spaces_before_argument: }
    {toto is there:: and the }
    *@emph C1 l7
     *brace_container C1
      {is a description}
    *@w C1 l7
     *brace_container C1
      {slightly long}
    { and }
    *@verb C1 l7
    |INFO
    |delimiter:{:}
     *brace_container C1
      {raw:vv somewhat}
    { }
    *@ringaccent C2 l7
     {spaces_after_cmd_before_arg: }
     *following_arg C1
      {a}
    {nexpected}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescriptionblock C3 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {Block along line node description for toto\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{nodedescriptionblock}
    *line_arg C3
     {spaces_before_argument: }
     {nodedescriptionblock}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l13 {titi}
 |EXTRA
 |identifier:{titi}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {titi}
    {spaces_after_argument:\\n}
 *@chapter C4 l14 {Titi}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Titi}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescriptionblock C3 l16
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {description of titi in block\\n}
   *@end C1 l18
   |EXTRA
   |text_arg:{nodedescriptionblock}
    *line_arg C3
     {spaces_before_argument: }
     {nodedescriptionblock}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l20 {other}
 |EXTRA
 |identifier:{other}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {other}
    {spaces_after_argument:\\n}
 *@chapter C3 l21 {Other}
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Other}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescription C1 l23
   *line_arg C3
    {spaces_before_argument: }
    {other comes here}
    {spaces_after_argument:\\n}
';


$result_texis{'nodedescription_description_no_use_nodes'} = '@node Top
@top test of descriptions with nodedescription*

@node toto
@chapter Toto

@nodedescription toto is there:: and the @emph{is a description}@w{slightly long} and @verb{:vv somewhat:} @ringaccent anexpected

@nodedescriptionblock
Block along line node description for toto
@end nodedescriptionblock

@node titi
@chapter Titi

@nodedescriptionblock
description of titi in block
@end nodedescriptionblock

@node other
@chapter Other

@nodedescription other comes here
';


$result_texts{'nodedescription_description_no_use_nodes'} = 'test of descriptions with nodedescription*
******************************************

1 Toto
******



2 Titi
******


3 Other
*******

';

$result_errors{'nodedescription_description_no_use_nodes'} = '* W l7|@verb should not appear on @nodedescription line
 warning: @verb should not appear on @nodedescription line

';

$result_nodes_list{'nodedescription_description_no_use_nodes'} = '1|Top
 associated_section: test of descriptions with nodedescription*
 associated_title_command: test of descriptions with nodedescription*
 node_directions:
  next->toto
2|toto
 associated_section: 1 Toto
 associated_title_command: 1 Toto
 node_descriptions:
  @nodedescription toto is there:: and the @emph{is a description}@w{slightly long} and @verb{:vv somewhat:} @ringaccent anexpected
 node_long_descriptions:
  @nodedescriptionblock l9
 node_directions:
  next->titi
  prev->Top
  up->Top
3|titi
 associated_section: 2 Titi
 associated_title_command: 2 Titi
 node_long_descriptions:
  @nodedescriptionblock l16
 node_directions:
  next->other
  prev->toto
  up->Top
4|other
 associated_section: 3 Other
 associated_title_command: 3 Other
 node_descriptions:
  @nodedescription other comes here
 node_directions:
  prev->titi
  up->Top
';

$result_sections_list{'nodedescription_description_no_use_nodes'} = '1|test of descriptions with nodedescription*
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Toto
 section_children:
  1|Toto
  2|Titi
  3|Other
2|Toto
 associated_anchor_command: toto
 associated_node: toto
 section_directions:
  next->Titi
  up->test of descriptions with nodedescription*
 toplevel_directions:
  next->Titi
  prev->test of descriptions with nodedescription*
  up->test of descriptions with nodedescription*
3|Titi
 associated_anchor_command: titi
 associated_node: titi
 section_directions:
  next->Other
  prev->Toto
  up->test of descriptions with nodedescription*
 toplevel_directions:
  next->Other
  prev->Toto
  up->test of descriptions with nodedescription*
4|Other
 associated_anchor_command: other
 associated_node: other
 section_directions:
  prev->Titi
  up->test of descriptions with nodedescription*
 toplevel_directions:
  prev->Titi
  up->test of descriptions with nodedescription*
';

$result_sectioning_root{'nodedescription_description_no_use_nodes'} = 'level: -1
list:
 1|test of descriptions with nodedescription*
';

$result_headings_list{'nodedescription_description_no_use_nodes'} = '';

1;
