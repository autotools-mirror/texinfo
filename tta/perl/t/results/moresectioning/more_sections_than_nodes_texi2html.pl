use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'more_sections_than_nodes_texi2html'} = '*document_root C19
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
  *normal_command@menu C5 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{n-c2}
     {normal_text:n c2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{n-c3}
     {normal_text:n c3}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{n-c3-s1-s2}
     {normal_text:n c3 s1 s2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l8
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 l10 {c1}
 |identifier:{c1}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l12 {n c2}
 |identifier:{n-c2}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:n c2}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l13 {c2}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C2 l15 {s1}
 |identifier:{s1}
 |is_target:{1}
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:s1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l17 {n c3}
 |identifier:{n-c3}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:n c3}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{n-c3-s1-s2}
    {spaces_before_argument: }
    {normal_text:n c3 s1 s2}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{n-c2}
    {spaces_before_argument: }
    {normal_text:n c2}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l18 {c3}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l20
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *menu_entry C4 l21
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{n-c3-s-2}
     {normal_text:n c3 s 2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l22
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C2 l24 {C3 s1}
 |identifier:{C3-s1}
 |is_target:{1}
 |section_heading_number:{3.1}
 |section_level:{2}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:C3 s1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l26 {n c3 s 2}
 |identifier:{n-c3-s-2}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:n c3 s 2}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l27 {c3 s2}
 |section_heading_number:{3.2}
 |section_level:{2}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c3 s2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C2 l29 {c3 s3}
 |identifier:{c3-s3}
 |is_target:{1}
 |section_heading_number:{3.3}
 |section_level:{2}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c3 s3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 l31 {c4}
 |identifier:{c4}
 |is_target:{1}
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c4}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C2 l33 {c3 s1}
 |identifier:{c3-s1}
 |is_target:{1}
 |section_heading_number:{4.1}
 |section_level:{2}
 |section_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c3 s1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@subsection C2 l35 {c3 s1 s1}
 |identifier:{c3-s1-s1}
 |is_target:{1}
 |section_heading_number:{4.1.1}
 |section_level:{3}
 |section_number:{11}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c3 s1 s1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l37 {n c3 s1 s2}
 |identifier:{n-c3-s1-s2}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:n c3 s1 s2}
   *line_arg
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{n-c3}
    {normal_text:n c3}
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@subsection C2 l38 {c3 s1 s2}
 |section_heading_number:{4.1.2}
 |section_level:{3}
 |section_number:{12}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c3 s1 s2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@appendix C1 l40 {appendix}
 |identifier:{appendix}
 |is_target:{1}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{13}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:appendix}
    {spaces_after_argument:\\n}
';


$result_texis{'more_sections_than_nodes_texi2html'} = '@node Top
@top top

@menu
* n c2::
* n c3::
* n c3 s1 s2::
@end menu

@chapter c1

@node n c2
@chapter c2

@section s1

@node n c3, n c3 s1 s2, n c2, Top
@chapter c3

@menu 
* n c3 s 2::
@end menu

@section C3 s1

@node n c3 s 2
@section c3 s2

@section c3 s3

@chapter c4

@section c3 s1

@subsection c3 s1 s1

@node n c3 s1 s2,,n c3,Top
@subsection c3 s1 s2

@appendix appendix
';


$result_texts{'more_sections_than_nodes_texi2html'} = 'top
***

* n c2::
* n c3::
* n c3 s1 s2::

1 c1
****

2 c2
****

2.1 s1
======

3 c3
****

* n c3 s 2::

3.1 C3 s1
=========

3.2 c3 s2
=========

3.3 c3 s3
=========

4 c4
****

4.1 c3 s1
=========

4.1.1 c3 s1 s1
--------------

4.1.2 c3 s1 s2
--------------

Appendix A appendix
*******************
';

$result_errors{'more_sections_than_nodes_texi2html'} = '';

$result_nodes_list{'more_sections_than_nodes_texi2html'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  n c2
  n c3
  n c3 s1 s2
 node_directions:
  next->n c2
2|n c2
 associated_section: 2 c2
 associated_title_command: 2 c2
 node_directions:
  next->n c3
  prev->Top
  up->Top
3|n c3
 associated_section: 3 c3
 associated_title_command: 3 c3
 menus:
  n c3 s 2
 node_directions:
  next->n c3 s1 s2
  prev->n c2
  up->Top
4|n c3 s 2
 associated_section: 3.2 c3 s2
 associated_title_command: 3.2 c3 s2
 node_directions:
  up->n c3
5|n c3 s1 s2
 associated_section: 4.1.2 c3 s1 s2
 associated_title_command: 4.1.2 c3 s1 s2
 node_directions:
  prev->n c3
  up->Top
';

$result_sections_list{'more_sections_than_nodes_texi2html'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->c1
 section_children:
  1|c1
  2|c2
  3|c3
  4|c4
  5|appendix
2|c1
 section_directions:
  next->c2
  up->top
 toplevel_directions:
  next->c2
  prev->top
  up->top
3|c2
 associated_anchor_command: n c2
 associated_node: n c2
 section_directions:
  next->c3
  prev->c1
  up->top
 toplevel_directions:
  next->c3
  prev->c1
  up->top
 section_children:
  1|s1
4|s1
 section_directions:
  up->c2
5|c3
 associated_anchor_command: n c3
 associated_node: n c3
 section_directions:
  next->c4
  prev->c2
  up->top
 toplevel_directions:
  next->c4
  prev->c2
  up->top
 section_children:
  1|C3 s1
  2|c3 s2
  3|c3 s3
6|C3 s1
 section_directions:
  next->c3 s2
  up->c3
7|c3 s2
 associated_anchor_command: n c3 s 2
 associated_node: n c3 s 2
 section_directions:
  next->c3 s3
  prev->C3 s1
  up->c3
8|c3 s3
 section_directions:
  prev->c3 s2
  up->c3
9|c4
 section_directions:
  next->appendix
  prev->c3
  up->top
 toplevel_directions:
  next->appendix
  prev->c3
  up->top
 section_children:
  1|c3 s1
10|c3 s1
 section_directions:
  up->c4
 section_children:
  1|c3 s1 s1
  2|c3 s1 s2
11|c3 s1 s1
 section_directions:
  next->c3 s1 s2
  up->c3 s1
12|c3 s1 s2
 associated_anchor_command: n c3 s1 s2
 associated_node: n c3 s1 s2
 section_directions:
  prev->c3 s1 s1
  up->c3 s1
13|appendix
 section_directions:
  prev->c4
  up->top
 toplevel_directions:
  prev->c4
  up->top
';

$result_sectioning_root{'more_sections_than_nodes_texi2html'} = 'level: -1
list:
 1|top
';

$result_headings_list{'more_sections_than_nodes_texi2html'} = '';

1;
