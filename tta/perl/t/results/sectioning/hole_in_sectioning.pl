use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'hole_in_sectioning'} = '*document_root C6
 *before_node_section
 *@top C2 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  {empty_line:\\n}
 *@chapter C2 l3 {Chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter}
  {empty_line:\\n}
 *@section C2 l5 {section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {section}
  {empty_line:\\n}
 *@subsubsection C2 l7 {subsubsection with no subsection above}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {subsubsection with no subsection above}
  {empty_line:\\n}
 *@subsection C1 l9 {the subsection}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1.2}
 |section_level:{3}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {the subsection}
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


$result_converted{'docbook'}->{'hole_in_sectioning'} = '<chapter label="">
<title>Top</title>

</chapter>
<chapter label="1">
<title>Chapter</title>

<sect1 label="1.1">
<title>section</title>

<sect2 label="1.1.1">
<title>subsubsection with no subsection above</title>

</sect2>
<sect2 label="1.1.2">
<title>the subsection</title>
</sect2>
</sect1>
</chapter>
';

1;
