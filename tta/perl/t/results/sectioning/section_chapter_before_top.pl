use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'section_chapter_before_top'} = '*document_root C4
 *before_node_section C1
  *preamble
 *normal_command@section C2 l1 {section}
 |identifier:{section}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument: \\n}
  {empty_line:\\n}
 *normal_command@chapter C2 l3 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@top C1 l5 {top}
 |identifier:{Top}
 |is_target:{1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
';


$result_texis{'section_chapter_before_top'} = '@section section 

@chapter chapter

@top top
';


$result_texts{'section_chapter_before_top'} = '1 section
=========

2 chapter
=========

top
===
';

$result_errors{'section_chapter_before_top'} = '* W l3|lowering the section level of @chapter appearing after a lower element
 warning: lowering the section level of @chapter appearing after a lower element

* W l5|lowering the section level of @top appearing after a lower element
 warning: lowering the section level of @top appearing after a lower element

';

$result_nodes_list{'section_chapter_before_top'} = '';

$result_sections_list{'section_chapter_before_top'} = '1|section
 section_directions:
  next->chapter
 toplevel_directions:
  next->chapter
2|chapter
 section_directions:
  next->top
  prev->section
 toplevel_directions:
  next->top
  prev->section
3|top
 section_directions:
  prev->chapter
 toplevel_directions:
  prev->chapter
';

$result_sectioning_root{'section_chapter_before_top'} = 'level: 1
list:
 1|section
 2|chapter
 3|top
';

$result_headings_list{'section_chapter_before_top'} = '';


$result_converted{'xml'}->{'section_chapter_before_top'} = '<section><sectiontitle> section </sectiontitle>

</section>
<section originalcommand="chapter"><sectiontitle> chapter</sectiontitle>

</section>
<unnumberedsec originalcommand="top"><sectiontitle> top</sectiontitle>
</unnumberedsec>
';

1;
