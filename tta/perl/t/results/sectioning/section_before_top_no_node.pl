use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'section_before_top_no_node'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
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
 *normal_command@top C1 l3 {top}
 |identifier:{Top}
 |is_target:{1}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
';


$result_texis{'section_before_top_no_node'} = '@section section 

@top top
';


$result_texts{'section_before_top_no_node'} = '1 section
=========

top
===
';

$result_errors{'section_before_top_no_node'} = '* W l3|lowering the section level of @top appearing after a lower element
 warning: lowering the section level of @top appearing after a lower element

';

$result_nodes_list{'section_before_top_no_node'} = '';

$result_sections_list{'section_before_top_no_node'} = '1|section
 section_directions:
  next->top
 toplevel_directions:
  next->top
2|top
 section_directions:
  prev->section
 toplevel_directions:
  prev->section
';

$result_sectioning_root{'section_before_top_no_node'} = 'level: 1
list:
 1|section
 2|top
';

$result_headings_list{'section_before_top_no_node'} = '';


$result_converted{'xml'}->{'section_before_top_no_node'} = '<section><sectiontitle> section </sectiontitle>

</section>
<unnumberedsec originalcommand="top"><sectiontitle> top</sectiontitle>
</unnumberedsec>
';

1;
