use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'customize_translations'} = '*document_root C15
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@contents C1 l2
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l4 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l5 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 l8 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@error C1 l10
    *brace_container
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l12
  |global_command_number:{1}
  |text_arg:{fr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l13 {Chapter fr}
 |identifier:{Chapter-fr}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter fr}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l14 {chap fr}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap fr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@error C1 l16
    *brace_container
   {normal_text:.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l18 {section fr}
 |identifier:{section-fr}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section fr}
    {spaces_after_argument:\\n}
 *normal_command@section C3 l19 {sec fr}
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec fr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l21
  |global_command_number:{2}
  |text_arg:{de}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:de}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l22 {Chapter de}
 |identifier:{Chapter-de}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter de}
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 l23 {chap de}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap de}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@error C1 l25
    *brace_container
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l27
  |global_command_number:{3}
  |text_arg:{de_AT}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:de_AT}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l28 {Chapter de_AT}
 |identifier:{Chapter-de_005fAT}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter de_AT}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l29 {chap de_AT}
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap de_AT}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@error C1 l31
    *brace_container
   {normal_text:.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l33 {Last chapter}
 |identifier:{Last-chapter}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Last chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l34 {Last Chapter}
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Last Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'customize_translations'} = '
@contents

@node Top
@top top

@node Chapter
@chapter chap

@error{}.

@documentlanguage fr
@node Chapter fr
@chapter chap fr

@error{}.

@node section fr
@section sec fr

@documentlanguage de
@node Chapter de
@chapter chap de

@error{}.

@documentlanguage de_AT
@node Chapter de_AT
@chapter chap de_AT

@error{}.

@node Last chapter
@chapter Last Chapter

';


$result_texts{'customize_translations'} = '
top
***

1 chap
******

error->.

2 chap fr
*********

error->.

2.1 sec fr
==========

3 chap de
*********

error->.

4 chap de_AT
************

error->.

5 Last Chapter
**************

';

$result_errors{'customize_translations'} = '';

$result_nodes_list{'customize_translations'} = '1|Top
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
  next->Chapter de
  prev->Chapter
  up->Top
4|section fr
 associated_section: 2.1 sec fr
 associated_title_command: 2.1 sec fr
 node_directions:
  up->Chapter fr
5|Chapter de
 associated_section: 3 chap de
 associated_title_command: 3 chap de
 node_directions:
  next->Chapter de_AT
  prev->Chapter fr
  up->Top
6|Chapter de_AT
 associated_section: 4 chap de_AT
 associated_title_command: 4 chap de_AT
 node_directions:
  next->Last chapter
  prev->Chapter de
  up->Top
7|Last chapter
 associated_section: 5 Last Chapter
 associated_title_command: 5 Last Chapter
 node_directions:
  prev->Chapter de_AT
  up->Top
';

$result_sections_list{'customize_translations'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
  2|chap fr
  3|chap de
  4|chap de_AT
  5|Last Chapter
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
  next->chap de
  prev->chap
  up->top
 toplevel_directions:
  next->chap de
  prev->chap
  up->top
 section_children:
  1|sec fr
4|sec fr
 associated_anchor_command: section fr
 associated_node: section fr
 section_directions:
  up->chap fr
5|chap de
 associated_anchor_command: Chapter de
 associated_node: Chapter de
 section_directions:
  next->chap de_AT
  prev->chap fr
  up->top
 toplevel_directions:
  next->chap de_AT
  prev->chap fr
  up->top
6|chap de_AT
 associated_anchor_command: Chapter de_AT
 associated_node: Chapter de_AT
 section_directions:
  next->Last Chapter
  prev->chap de
  up->top
 toplevel_directions:
  next->Last Chapter
  prev->chap de
  up->top
7|Last Chapter
 associated_anchor_command: Last chapter
 associated_node: Last chapter
 section_directions:
  prev->chap de_AT
  up->top
 toplevel_directions:
  prev->chap de_AT
  up->top
';

$result_sectioning_root{'customize_translations'} = 'level: -1
list:
 1|top
';

$result_headings_list{'customize_translations'} = '';

1;
