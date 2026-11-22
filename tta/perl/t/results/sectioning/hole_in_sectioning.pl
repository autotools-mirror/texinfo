use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'hole_in_sectioning'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content
 *normal_command@top C2 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 l3 {Chapter}
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
 *normal_command@section C2 l5 {section}
 |identifier:{section}
 |is_target:{1}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@subsubsection C2 l7 {subsubsection with no subsection above}
 |identifier:{subsubsection-with-no-subsection-above}
 |is_target:{1}
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subsubsection with no subsection above}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@subsection C1 l9 {the subsection}
 |identifier:{the-subsection}
 |is_target:{1}
 |section_heading_number:{1.1.2}
 |section_level:{3}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:the subsection}
    {spaces_after_argument:\\n}
';


$result_texis{'hole_in_sectioning'} = '@top Top

@chapter Chapter

@section section

@subsubsection subsubsection with no subsection above

@subsection the subsection
';


$result_texts{'hole_in_sectioning'} = 'Top
***

1 Chapter
*********

1.1 section
===========

1.1.1 subsubsection with no subsection above
--------------------------------------------

1.1.2 the subsection
--------------------
';

$result_errors{'hole_in_sectioning'} = '* E l7|raising the section level of @subsubsection which is too low
 raising the section level of @subsubsection which is too low

';

$result_nodes_list{'hole_in_sectioning'} = '';

$result_sections_list{'hole_in_sectioning'} = '1|Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 section_directions:
  up->Top
 toplevel_directions:
  prev->Top
  up->Top
 section_children:
  1|section
3|section
 section_directions:
  up->Chapter
 section_children:
  1|subsubsection with no subsection above
  2|the subsection
4|subsubsection with no subsection above
 section_directions:
  next->the subsection
  up->section
5|the subsection
 section_directions:
  prev->subsubsection with no subsection above
  up->section
';

$result_sectioning_root{'hole_in_sectioning'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'hole_in_sectioning'} = '';


$result_converted{'docbook'}->{'hole_in_sectioning'} = '<chapter label="" id="Top">
<title>Top</title>

</chapter>
<chapter label="1" id="Chapter">
<title>Chapter</title>

<sect1 label="1.1" id="section">
<title>section</title>

<sect2 label="1.1.1" id="subsubsection-with-no-subsection-above">
<title>subsubsection with no subsection above</title>

</sect2>
<sect2 label="1.1.2" id="the-subsection">
<title>the subsection</title>
</sect2>
</sect1>
</chapter>
';

1;
