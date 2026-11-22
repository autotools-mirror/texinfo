use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_new_node_empty_ref'} = '*document_root C9
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
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
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l3 {aa  g}
 |EXTRA
 |added:{1}
 |identifier:{aa-g}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:aa }
    {normal_text: g}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l3 {aa @ref{ , , , } g}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:aa }
    *normal_command@ref C4 l3
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
    {normal_text: g}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l5 {b}
 |EXTRA
 |added:{1}
 |identifier:{b}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:b}
    {spaces_after_argument: \\n}
 *normal_command@section C2 l5 {b @ref{}}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:b }
    *normal_command@ref C1 l5
     *brace_arg
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 { [+1+]}
 |EXTRA
 |added:{1}
 |identifier:{-_005b_002b1_002b_005d}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:}
    {normal_text: [+1+]}
    {spaces_after_argument:\\n}
 *normal_command@subsection C2 l7 {@ref}
 |EXTRA
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@ref l7
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'test_new_node_empty_ref'} = '@node Top
@top top

@node aa  g
@chapter aa @ref{ , , , } g

@node b 
@section b @ref{}

@node  [+1+]
@subsection @ref

';


$result_texts{'test_new_node_empty_ref'} = 'top
***

1 aa  g
*******

1.1 b 
======

1.1.1 
------

';

$result_errors{'test_new_node_empty_ref'} = '* W l3|command @ref missing a node or external manual argument
 warning: command @ref missing a node or external manual argument

* W l5|command @ref missing a node or external manual argument
 warning: command @ref missing a node or external manual argument

* W l7|command `@ref\' must not be followed by new line
 warning: command `@ref\' must not be followed by new line

';

$result_nodes_list{'test_new_node_empty_ref'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->aa  g
2|aa  g
 associated_section: 1 aa @ref{ , , , } g
 associated_title_command: 1 aa @ref{ , , , } g
 node_directions:
  prev->Top
  up->Top
3|b
 associated_section: 1.1 b @ref{}
 associated_title_command: 1.1 b @ref{}
 node_directions:
  up->aa  g
4| [+1+]
 associated_section: 1.1.1 @ref
 associated_title_command: 1.1.1 @ref
 node_directions:
  up->b
';

$result_sections_list{'test_new_node_empty_ref'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->aa @ref{ , , , } g
 section_children:
  1|aa @ref{ , , , } g
2|aa @ref{ , , , } g
 associated_anchor_command: aa  g
 associated_node: aa  g
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|b @ref{}
3|b @ref{}
 associated_anchor_command: b
 associated_node: b
 section_directions:
  up->aa @ref{ , , , } g
 section_children:
  1|@ref
4|@ref
 associated_anchor_command:  [+1+]
 associated_node:  [+1+]
 section_directions:
  up->b @ref{}
';

$result_sectioning_root{'test_new_node_empty_ref'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_new_node_empty_ref'} = '';

1;
