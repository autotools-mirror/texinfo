use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'sectioning_part_appendix_no_top'} = 'U0 unit{C2}{S:@chapter 1 chapter}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U4]
 *before_node_section C1
  *preamble_before_content
 *normal_command@chapter C2 l1 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C1}{S:@section 1.1 section}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U4]
FastBack: [U0]
Up: [U0]
 *normal_command@section C2 l3 {section}
 |identifier:{section}
 |is_target:{1}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U2 unit{C1}{S:@subsection 1.1.1 subsection}
unit_directions:D[next->[U3]|prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Forward: [U3]
Back: [U1]
FastForward: [U4]
FastBack: [U0]
Up: [U1]
 *normal_command@subsection C2 l5 {subsection}
 |identifier:{subsection}
 |is_target:{1}
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U3 unit{C1}{S:@subsubsection 1.1.1.1 subsubsection}
unit_directions:D[next->[U4]|prev->[U2]]
UNIT_DIRECTIONS
This: [U3]
Forward: [U4]
Back: [U2]
FastForward: [U4]
FastBack: [U0]
Up: [U2]
 *normal_command@subsubsection C2 l7 {subsubsection}
 |identifier:{subsubsection}
 |is_target:{1}
 |section_heading_number:{1.1.1.1}
 |section_level:{4}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subsubsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U4 unit{C2}{S:@chapter 2 chapter in part}
unit_directions:D[next->[U5]|prev->[U3]]
UNIT_DIRECTIONS
This: [U4]
Forward: [U5]
Back: [U3]
FastForward: [U5]
FastBack: [U0]
Next: [U5]
 *normal_command@part C2 l9 {part}
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 l11 {chapter in part}
 |identifier:{chapter-in-part}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter in part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U5 unit{C1}{S:@chapter 3 second chapter in part}
unit_directions:D[next->[U6]|prev->[U4]]
UNIT_DIRECTIONS
This: [U5]
Forward: [U6]
Back: [U4]
FastForward: [U6]
FastBack: [U4]
Next: [U6]
Prev: [U4]
Up: [U4]
 *normal_command@chapter C2 l13 {second chapter in part}
 |identifier:{second-chapter-in-part}
 |is_target:{1}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:second chapter in part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U6 unit{C1}{S:@unnumbered unnumbered}
unit_directions:D[next->[U7]|prev->[U5]]
UNIT_DIRECTIONS
This: [U6]
Forward: [U7]
Back: [U5]
FastForward: [U7]
FastBack: [U5]
Prev: [U5]
Up: [U4]
 *normal_command@unnumbered C2 l15 {unnumbered}
 |identifier:{unnumbered}
 |is_target:{1}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U7 unit{C1}{S:@appendix A appendix}
unit_directions:D[next->[U8]|prev->[U6]]
UNIT_DIRECTIONS
This: [U7]
Forward: [U8]
Back: [U6]
FastBack: [U6]
Prev: [U4]
 *normal_command@appendix C2 l17 {appendix}
 |identifier:{appendix}
 |is_target:{1}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:appendix}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U8 unit{C1}{S:@appendixsec A.1 appendixsec}
unit_directions:D[prev->[U7]]
UNIT_DIRECTIONS
This: [U8]
Back: [U7]
FastBack: [U7]
Up: [U7]
 *normal_command@appendixsec C1 l19 {appendixsec}
 |identifier:{appendixsec}
 |is_target:{1}
 |section_heading_number:{A.1}
 |section_level:{2}
 |section_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:appendixsec}
    {spaces_after_argument:\\n}
';


$result_texis{'sectioning_part_appendix_no_top'} = '@chapter chapter

@section section

@subsection subsection

@subsubsection subsubsection

@part part

@chapter chapter in part

@chapter second chapter in part

@unnumbered unnumbered

@appendix appendix

@appendixsec appendixsec
';


$result_texts{'sectioning_part_appendix_no_top'} = '1 chapter
*********

1.1 section
===========

1.1.1 subsection
----------------

1.1.1.1 subsubsection
.....................

part
****

2 chapter in part
*****************

3 second chapter in part
************************

unnumbered
**********

Appendix A appendix
*******************

A.1 appendixsec
===============
';

$result_errors{'sectioning_part_appendix_no_top'} = '';

$result_nodes_list{'sectioning_part_appendix_no_top'} = '';

$result_sections_list{'sectioning_part_appendix_no_top'} = '1|chapter
 toplevel_directions:
  next->chapter in part
 section_children:
  1|section
2|section
 section_directions:
  up->chapter
 section_children:
  1|subsection
3|subsection
 section_directions:
  up->section
 section_children:
  1|subsubsection
4|subsubsection
 section_directions:
  up->subsection
5|part
 part_associated_section: 2 chapter in part
 section_directions:
  next->appendix
 section_children:
  1|chapter in part
  2|second chapter in part
  3|unnumbered
6|chapter in part
 associated_part: part
 section_directions:
  next->second chapter in part
  up->part
 toplevel_directions:
  next->second chapter in part
  prev->chapter
7|second chapter in part
 section_directions:
  next->unnumbered
  prev->chapter in part
  up->part
 toplevel_directions:
  next->unnumbered
  prev->chapter in part
8|unnumbered
 section_directions:
  prev->second chapter in part
  up->part
 toplevel_directions:
  next->appendix
  prev->second chapter in part
9|appendix
 section_directions:
  prev->part
 toplevel_directions:
  prev->unnumbered
 section_children:
  1|appendixsec
10|appendixsec
 section_directions:
  up->appendix
';

$result_sectioning_root{'sectioning_part_appendix_no_top'} = 'level: -1
list:
 1|chapter
 2|part
 3|appendix
';

$result_headings_list{'sectioning_part_appendix_no_top'} = '';


$result_converted{'xml'}->{'sectioning_part_appendix_no_top'} = '<chapter><sectiontitle> chapter</sectiontitle>

<section><sectiontitle> section</sectiontitle>

<subsection><sectiontitle> subsection</sectiontitle>

<subsubsection><sectiontitle> subsubsection</sectiontitle>

</subsubsection>
</subsection>
</section>
</chapter>
<part><sectiontitle> part</sectiontitle>

<chapter><sectiontitle> chapter in part</sectiontitle>

</chapter>
<chapter><sectiontitle> second chapter in part</sectiontitle>

</chapter>
<unnumbered><sectiontitle> unnumbered</sectiontitle>

</unnumbered>
</part>
<appendix><sectiontitle> appendix</sectiontitle>

<appendixsec><sectiontitle> appendixsec</sectiontitle>
</appendixsec>
</appendix>
';

1;
