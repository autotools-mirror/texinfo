use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_part_chapter'} = 'U0 unit{C2}{S:@top top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
Next: [U1]
 *before_node_section C1
  *preamble_before_content
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
U1 unit{C2}{S:@chapter 1 chapter}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
FastBack: [U0]
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
 *normal_command@chapter C1 l5 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument: \\n}
';


$result_texis{'top_part_chapter'} = '@top top

@part part

@chapter chapter 
';


$result_texts{'top_part_chapter'} = 'top
***

part
****

1 chapter
*********
';

$result_errors{'top_part_chapter'} = '';

$result_nodes_list{'top_part_chapter'} = '';

$result_sections_list{'top_part_chapter'} = '1|top
 section_directions:
  next->part
 toplevel_directions:
  next->chapter
2|part
 part_associated_section: 1 chapter
 section_directions:
  prev->top
 section_children:
  1|chapter
3|chapter
 associated_part: part
 section_directions:
  up->part
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'top_part_chapter'} = 'level: -1
list:
 1|top
 2|part
';

$result_headings_list{'top_part_chapter'} = '';


$result_converted{'xml'}->{'top_part_chapter'} = '<top><sectiontitle> top</sectiontitle>

</top>
<part><sectiontitle> part</sectiontitle>

<chapter><sectiontitle> chapter </sectiontitle>
</chapter>
</part>
';


$result_converted{'docbook'}->{'top_part_chapter'} = '<chapter label="" id="Top">
<title>top</title>

</chapter>
<part label="">
<title>part</title>
<chapter label="1" id="chapter">
<title>chapter</title>

</chapter>
</part>
';

1;
