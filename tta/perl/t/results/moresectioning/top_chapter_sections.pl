use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_chapter_sections'} = 'U0 unit{C2}{S:@top top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
 *before_node_section C1
  *preamble
 *normal_command@top C2 l1 {top}
 |identifier:{Top}
 |is_target:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C1}{S:@unnumbered unnumbered}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U2]
FastBack: [U0]
Next: [U2]
Up: [U0]
 *normal_command@unnumbered C2 l3 {unnumbered}
 |identifier:{unnumbered}
 |is_target:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U2 unit{C1}{S:@chapter 1 First chapter}
unit_directions:D[next->[U3]|prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Forward: [U3]
Back: [U1]
FastForward: [U4]
FastBack: [U1]
Next: [U4]
Prev: [U1]
Up: [U0]
 *normal_command@chapter C2 l5 {First chapter}
 |identifier:{First-chapter}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:First chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U3 unit{C1}{S:@section 1.1 second}
unit_directions:D[next->[U4]|prev->[U2]]
UNIT_DIRECTIONS
This: [U3]
Forward: [U4]
Back: [U2]
FastForward: [U4]
FastBack: [U2]
Up: [U2]
 *normal_command@section C2 l7 {second}
 |identifier:{second}
 |is_target:{1}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:second}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U4 unit{C1}{S:@chapter 2 Chapter}
unit_directions:D[next->[U5]|prev->[U3]]
UNIT_DIRECTIONS
This: [U4]
Forward: [U5]
Back: [U3]
FastForward: [U8]
FastBack: [U2]
Next: [U8]
Prev: [U2]
Up: [U0]
 *normal_command@chapter C2 l9 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U5 unit{C1}{S:@section 2.1 Section of chapter}
unit_directions:D[next->[U6]|prev->[U4]]
UNIT_DIRECTIONS
This: [U5]
Forward: [U6]
Back: [U4]
FastForward: [U8]
FastBack: [U4]
Up: [U4]
 *normal_command@section C2 l11 {Section of chapter}
 |identifier:{Section-of-chapter}
 |is_target:{1}
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section of chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U6 unit{C1}{S:@subsection 2.1.1 subsection 1}
unit_directions:D[next->[U7]|prev->[U5]]
UNIT_DIRECTIONS
This: [U6]
Forward: [U7]
Back: [U5]
FastForward: [U8]
FastBack: [U4]
Next: [U7]
Up: [U5]
 *normal_command@subsection C2 l13 {subsection 1}
 |identifier:{subsection-1}
 |is_target:{1}
 |section_heading_number:{2.1.1}
 |section_level:{3}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subsection 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U7 unit{C1}{S:@subsection 2.1.2 subsection 2}
unit_directions:D[next->[U8]|prev->[U6]]
UNIT_DIRECTIONS
This: [U7]
Forward: [U8]
Back: [U6]
FastForward: [U8]
FastBack: [U4]
Prev: [U6]
Up: [U5]
 *normal_command@subsection C2 l15 {subsection 2}
 |identifier:{subsection-2}
 |is_target:{1}
 |section_heading_number:{2.1.2}
 |section_level:{3}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subsection 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U8 unit{C1}{S:@chapter 3 Chapter 2}
unit_directions:D[prev->[U7]]
UNIT_DIRECTIONS
This: [U8]
Back: [U7]
FastBack: [U4]
Prev: [U4]
Up: [U0]
 *normal_command@chapter C1 l17 {Chapter 2}
 |identifier:{Chapter-2}
 |is_target:{1}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter 2}
    {spaces_after_argument:\\n}
';


$result_texis{'top_chapter_sections'} = '@top top

@unnumbered unnumbered

@chapter First chapter

@section second

@chapter Chapter

@section Section of chapter

@subsection subsection 1

@subsection subsection 2

@chapter Chapter 2
';


$result_texts{'top_chapter_sections'} = 'top
***

unnumbered
**********

1 First chapter
***************

1.1 second
==========

2 Chapter
*********

2.1 Section of chapter
======================

2.1.1 subsection 1
------------------

2.1.2 subsection 2
------------------

3 Chapter 2
***********
';

$result_errors{'top_chapter_sections'} = '';

$result_nodes_list{'top_chapter_sections'} = '';

$result_sections_list{'top_chapter_sections'} = '1|top
 toplevel_directions:
  next->unnumbered
 section_children:
  1|unnumbered
  2|First chapter
  3|Chapter
  4|Chapter 2
2|unnumbered
 section_directions:
  next->First chapter
  up->top
 toplevel_directions:
  next->First chapter
  prev->top
  up->top
3|First chapter
 section_directions:
  next->Chapter
  prev->unnumbered
  up->top
 toplevel_directions:
  next->Chapter
  prev->unnumbered
  up->top
 section_children:
  1|second
4|second
 section_directions:
  up->First chapter
5|Chapter
 section_directions:
  next->Chapter 2
  prev->First chapter
  up->top
 toplevel_directions:
  next->Chapter 2
  prev->First chapter
  up->top
 section_children:
  1|Section of chapter
6|Section of chapter
 section_directions:
  up->Chapter
 section_children:
  1|subsection 1
  2|subsection 2
7|subsection 1
 section_directions:
  next->subsection 2
  up->Section of chapter
8|subsection 2
 section_directions:
  prev->subsection 1
  up->Section of chapter
9|Chapter 2
 section_directions:
  prev->Chapter
  up->top
 toplevel_directions:
  prev->Chapter
  up->top
';

$result_sectioning_root{'top_chapter_sections'} = 'level: -1
list:
 1|top
';

$result_headings_list{'top_chapter_sections'} = '';


$result_converted{'xml'}->{'top_chapter_sections'} = '<top><sectiontitle> top</sectiontitle>

</top>
<unnumbered><sectiontitle> unnumbered</sectiontitle>

</unnumbered>
<chapter><sectiontitle> First chapter</sectiontitle>

<section><sectiontitle> second</sectiontitle>

</section>
</chapter>
<chapter><sectiontitle> Chapter</sectiontitle>

<section><sectiontitle> Section of chapter</sectiontitle>

<subsection><sectiontitle> subsection 1</sectiontitle>

</subsection>
<subsection><sectiontitle> subsection 2</sectiontitle>

</subsection>
</section>
</chapter>
<chapter><sectiontitle> Chapter 2</sectiontitle>
</chapter>
';

1;
