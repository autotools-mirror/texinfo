use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'part_before_section'} = 'U0 unit{C3}{S:@section 1 section}
UNIT_DIRECTIONS
This: [U0]
 *before_node_section C1
  *preamble_before_content
 *@part C2 l1 {part}
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@section C1 l3 {section}
 |EXTRA
 |identifier:{section}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument: \\n}
';


$result_texis{'part_before_section'} = '@part part

@section section 
';


$result_texts{'part_before_section'} = 'part
****

1 section
*********
';

$result_errors{'part_before_section'} = '* E l3|raising the section level of @section which is too low
 raising the section level of @section which is too low

';

$result_nodes_list{'part_before_section'} = '';

$result_sections_list{'part_before_section'} = '1|part
 part_associated_section: 1 section
 section_children:
  1|section
2|section
 associated_part: part
 section_directions:
  up->part
';

$result_sectioning_root{'part_before_section'} = 'level: -1
list:
 1|part
';

$result_headings_list{'part_before_section'} = '';


$result_converted{'html_text'}->{'part_before_section'} = '<div class="part-level-extent" id="part">
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#section">section</a></li>
</ul>
<div class="chapter-level-extent" id="section">
<h2 class="chapter section-level-set-chapter"><span>1 section<a class="copiable-link" href="#section"> &para;</a></span></h2>
</div>
</div>
';


$result_converted{'xml'}->{'part_before_section'} = '<part><sectiontitle> part</sectiontitle>

<chapter originalcommand="section"><sectiontitle> section </sectiontitle>
</chapter>
</part>
';

1;
