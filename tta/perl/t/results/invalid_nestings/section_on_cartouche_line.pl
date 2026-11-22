use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'section_on_cartouche_line'} = '*document_root C3
 *before_node_section C2
  *preamble_before_content
  *normal_command@cartouche C1 l1
   *arguments_line C1
    *block_line_arg
 *normal_command@section C3 l1 {first}
 |identifier:{first}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@cartouche C1 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: }
 *normal_command@section C1 l3 {second spaces}
 |identifier:{second-spaces}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:second spaces}
    {spaces_after_argument:\\n}
';


$result_texis{'section_on_cartouche_line'} = '@cartouche@section first

@cartouche @section second spaces
';


$result_texts{'section_on_cartouche_line'} = '1 first
=======

2 second spaces
===============
';

$result_errors{'section_on_cartouche_line'} = '* W l1|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* E l1|@section seen before @end cartouche
 @section seen before @end cartouche

* W l3|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* E l3|@section seen before @end cartouche
 @section seen before @end cartouche

';

$result_nodes_list{'section_on_cartouche_line'} = '';

$result_sections_list{'section_on_cartouche_line'} = '1|first
 section_directions:
  next->second spaces
 toplevel_directions:
  next->second spaces
2|second spaces
 section_directions:
  prev->first
 toplevel_directions:
  prev->first
';

$result_sectioning_root{'section_on_cartouche_line'} = 'level: 1
list:
 1|first
 2|second spaces
';

$result_headings_list{'section_on_cartouche_line'} = '';


$result_converted{'plaintext'}->{'section_on_cartouche_line'} = '1 first
=======

2 second spaces
===============

';


$result_converted{'xml'}->{'section_on_cartouche_line'} = '<cartouche>
</cartouche>
<section><sectiontitle> first</sectiontitle>

<cartouche> 
</cartouche>
</section>
<section><sectiontitle> second spaces</sectiontitle>
</section>
';

1;
