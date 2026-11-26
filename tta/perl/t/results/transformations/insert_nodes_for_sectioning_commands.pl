use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'insert_nodes_for_sectioning_commands'} = '*document_root C23
 *before_node_section C1
  *preamble
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
 *normal_command@top C2 l1 {top section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@part C2 l3 {part}
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l5 {chap@comma{} @code{a chap}}
 |added:{1}
 |identifier:{chap_002c-a-chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C6
    {spaces_before_argument: }
    {normal_text:chap}
    *normal_command@comma C1
     *brace_container
    {normal_text: }
    *normal_command@code C1
     *brace_container C1
      {normal_text:a chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l5 {chap, @code{a chap}}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:chap, }
    *normal_command@code C1 l5
     *brace_container C1
      {normal_text:a chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {a node}
 |identifier:{a-node}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a node}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l8 {section}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {truc}
 |added:{1}
 |identifier:{truc}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:truc}
    {spaces_after_argument:\\n}
 *normal_command@section C1 l10 {truc}
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:truc}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l11 {sub1}
 |added:{1}
 |identifier:{sub1}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sub1}
    {spaces_after_argument:\\n}
 *normal_command@subsection C4 l11 {sub1}
 |section_heading_number:{1.2.1}
 |section_level:{3}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sub1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Text.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l15 {sub2}
 |added:{1}
 |identifier:{sub2}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sub2}
    {spaces_after_argument:\\n}
 *normal_command@subsection C2 l15 {sub2}
 |section_heading_number:{1.2.2}
 |section_level:{3}
 |section_number:{7}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:sub2}
    {spaces_after_argument: }
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l17 {section [+1+]}
 |added:{1}
 |identifier:{section-_005b_002b1_002b_005d}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:section}
    {normal_text: [+1+]}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l17 {section}
 |section_heading_number:{1.3}
 |section_level:{2}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l19 {section [+2+]}
 |added:{1}
 |identifier:{section-_005b_002b2_002b_005d}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:section}
    {normal_text: [+2+]}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l19 {section}
 |section_heading_number:{1.4}
 |section_level:{2}
 |section_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l21 { [+1+]}
 |added:{1}
 |identifier:{-_005b_002b1_002b_005d}
 |is_target:{1}
 |node_number:{9}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:}
    {normal_text: [+1+]}
    {spaces_after_argument:\\n}
 *normal_command@unnumbered C2 l21
 |section_level:{1}
 |section_number:{10}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l23 {@asis{} [+2+]}
 |added:{1}
 |identifier:{-_005b_002b2_002b_005d}
 |is_target:{1}
 |node_number:{10}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    *normal_command@asis C1
     *brace_container
    {normal_text: [+2+]}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l23 {@asis{}}
 |section_level:{2}
 |section_number:{11}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@asis C1 l23
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:}
';


$result_texis{'insert_nodes_for_sectioning_commands'} = '@node Top
@top top section

@part part

@node chap@comma{} @code{a chap}
@chapter chap, @code{a chap}

@node a node
@section section

@node truc
@section truc
@node sub1
@subsection sub1

Text.

@node sub2
@subsection sub2 @c comment

@node section [+1+]
@section section

@node section [+2+]
@section section

@node  [+1+]
@unnumbered

@node @asis{} [+2+]
@section @asis{}

@bye';


$result_texts{'insert_nodes_for_sectioning_commands'} = 'top section
***********

part
****

1 chap, a chap
**************

1.1 section
===========

1.2 truc
========
1.2.1 sub1
----------

Text.

1.2.2 sub2
----------

1.3 section
===========

1.4 section
===========



';

$result_errors{'insert_nodes_for_sectioning_commands'} = '* W l21|@unnumbered missing argument
 warning: @unnumbered missing argument

* W l19|@section `section\' already found target
 warning: @section `section\' already found target

* WC l17|found @section
 warning: found @section

* W l23|@section `@asis{}\' already found target
 warning: @section `@asis{}\' already found target

* WC l21|found @unnumbered
 warning: found @unnumbered

';

$result_nodes_list{'insert_nodes_for_sectioning_commands'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->chap@comma{} @code{a chap}
2|chap@comma{} @code{a chap}
 associated_section: 1 chap, @code{a chap}
 associated_title_command: 1 chap, @code{a chap}
 node_directions:
  next-> [+1+]
  prev->Top
  up->Top
3|a node
 associated_section: 1.1 section
 associated_title_command: 1.1 section
 node_directions:
  next->truc
  up->chap@comma{} @code{a chap}
4|truc
 associated_section: 1.2 truc
 associated_title_command: 1.2 truc
 node_directions:
  next->section [+1+]
  prev->a node
  up->chap@comma{} @code{a chap}
5|sub1
 associated_section: 1.2.1 sub1
 associated_title_command: 1.2.1 sub1
 node_directions:
  next->sub2
  up->truc
6|sub2
 associated_section: 1.2.2 sub2
 associated_title_command: 1.2.2 sub2
 node_directions:
  prev->sub1
  up->truc
7|section [+1+]
 associated_section: 1.3 section
 associated_title_command: 1.3 section
 node_directions:
  next->section [+2+]
  prev->truc
  up->chap@comma{} @code{a chap}
8|section [+2+]
 associated_section: 1.4 section
 associated_title_command: 1.4 section
 node_directions:
  prev->section [+1+]
  up->chap@comma{} @code{a chap}
9| [+1+]
 associated_section
 associated_title_command
 node_directions:
  prev->chap@comma{} @code{a chap}
  up->Top
10|@asis{} [+2+]
 associated_section: @asis{}
 associated_title_command: @asis{}
 node_directions:
  up-> [+1+]
';

$result_sections_list{'insert_nodes_for_sectioning_commands'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->part
 toplevel_directions:
  next->chap, @code{a chap}
2|part
 part_associated_section: 1 chap, @code{a chap}
 section_directions:
  prev->top section
 section_children:
  1|chap, @code{a chap}
  2|
3|chap, @code{a chap}
 associated_anchor_command: chap@comma{} @code{a chap}
 associated_node: chap@comma{} @code{a chap}
 associated_part: part
 section_directions:
  next->
  up->part
 toplevel_directions:
  next->
  prev->top section
  up->top section
 section_children:
  1|section
  2|truc
  3|section
  4|section
4|section
 associated_anchor_command: a node
 associated_node: a node
 section_directions:
  next->truc
  up->chap, @code{a chap}
5|truc
 associated_anchor_command: truc
 associated_node: truc
 section_directions:
  next->section
  prev->section
  up->chap, @code{a chap}
 section_children:
  1|sub1
  2|sub2
6|sub1
 associated_anchor_command: sub1
 associated_node: sub1
 section_directions:
  next->sub2
  up->truc
7|sub2
 associated_anchor_command: sub2
 associated_node: sub2
 section_directions:
  prev->sub1
  up->truc
8|section
 associated_anchor_command: section [+1+]
 associated_node: section [+1+]
 section_directions:
  next->section
  prev->truc
  up->chap, @code{a chap}
9|section
 associated_anchor_command: section [+2+]
 associated_node: section [+2+]
 section_directions:
  prev->section
  up->chap, @code{a chap}
10
 associated_anchor_command:  [+1+]
 associated_node:  [+1+]
 section_directions:
  prev->chap, @code{a chap}
  up->part
 toplevel_directions:
  prev->chap, @code{a chap}
  up->top section
 section_children:
  1|@asis{}
11|@asis{}
 associated_anchor_command: @asis{} [+2+]
 associated_node: @asis{} [+2+]
 section_directions:
  up->
';

$result_sectioning_root{'insert_nodes_for_sectioning_commands'} = 'level: -1
list:
 1|top section
 2|part
';

$result_headings_list{'insert_nodes_for_sectioning_commands'} = '';

1;
