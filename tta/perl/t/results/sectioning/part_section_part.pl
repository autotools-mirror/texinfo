use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'part_section_part'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content
 *@part C2 l1 {Part1}
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Part1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@section C2 l3 {section 1}
 |EXTRA
 |identifier:{section-1}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@part C1 l5 {Part 2}
 |EXTRA
 |global_command_number:{2}
 |section_level:{0}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Part 2}
    {spaces_after_argument:\\n}
';


$result_texis{'part_section_part'} = '@part Part1

@section section 1

@part Part 2
';


$result_texts{'part_section_part'} = 'Part1
*****

1 section 1
***********

Part 2
******
';

$result_errors{'part_section_part'} = '* E l3|raising the section level of @section which is too low
 raising the section level of @section which is too low

* W l5|no sectioning command associated with @part
 warning: no sectioning command associated with @part

';

$result_nodes_list{'part_section_part'} = '';

$result_sections_list{'part_section_part'} = '1|Part1
 part_associated_section: 1 section 1
 section_directions:
  next->Part 2
 section_children:
  1|section 1
2|section 1
 associated_part: Part1
 section_directions:
  up->Part1
3|Part 2
 section_directions:
  prev->Part1
';

$result_sectioning_root{'part_section_part'} = 'level: -1
list:
 1|Part1
 2|Part 2
';

$result_headings_list{'part_section_part'} = '';

1;
