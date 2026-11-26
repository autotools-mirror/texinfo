use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'part_chapter_appendix'} = '*document_root C4
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content
 *normal_command@part C2 l2 {Part 1}
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Part 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 l4 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@appendix C1 l6 {Appendix}
 |identifier:{Appendix}
 |is_target:{1}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Appendix}
    {spaces_after_argument:\\n}
';


$result_texis{'part_chapter_appendix'} = '
@part Part 1

@chapter chapter

@appendix Appendix
';


$result_texts{'part_chapter_appendix'} = 'Part 1
******

1 chapter
*********

Appendix A Appendix
*******************
';

$result_errors{'part_chapter_appendix'} = '';

$result_nodes_list{'part_chapter_appendix'} = '';

$result_sections_list{'part_chapter_appendix'} = '1|Part 1
 part_associated_section: 1 chapter
 section_directions:
  next->Appendix
 section_children:
  1|chapter
2|chapter
 associated_part: Part 1
 section_directions:
  up->Part 1
 toplevel_directions:
  next->Appendix
3|Appendix
 section_directions:
  prev->Part 1
 toplevel_directions:
  prev->chapter
';

$result_sectioning_root{'part_chapter_appendix'} = 'level: -1
list:
 1|Part 1
 2|Appendix
';

$result_headings_list{'part_chapter_appendix'} = '';


$result_converted{'xml'}->{'part_chapter_appendix'} = '<preamblebeforebeginning>
</preamblebeforebeginning><part><sectiontitle> Part 1</sectiontitle>

<chapter><sectiontitle> chapter</sectiontitle>

</chapter>
</part>
<appendix><sectiontitle> Appendix</sectiontitle>
</appendix>
';

1;
