use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'section_on_enumerate_line'} = '*document_root C3
 *before_node_section C2
  *preamble_before_content
  *normal_command@enumerate C1 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:something}
     {spaces_after_argument: }
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
  *normal_command@enumerate C1 l3
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:4}
     {spaces_after_argument: }
 *normal_command@section C1 l3 {second}
 |identifier:{second}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:second}
    {spaces_after_argument:\\n}
';


$result_texis{'section_on_enumerate_line'} = '@enumerate something @section first

@enumerate 4 @section second
';


$result_texts{'section_on_enumerate_line'} = '1 first
=======

2 second
========
';

$result_errors{'section_on_enumerate_line'} = '* W l1|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l1|@section should not appear on @enumerate line
 warning: @section should not appear on @enumerate line

* E l1|bad argument to @enumerate
 bad argument to @enumerate

* E l1|@section seen before @end enumerate
 @section seen before @end enumerate

* W l3|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l3|@section should not appear on @enumerate line
 warning: @section should not appear on @enumerate line

* E l3|@section seen before @end enumerate
 @section seen before @end enumerate

';

$result_nodes_list{'section_on_enumerate_line'} = '';

$result_sections_list{'section_on_enumerate_line'} = '1|first
 section_directions:
  next->second
 toplevel_directions:
  next->second
2|second
 section_directions:
  prev->first
 toplevel_directions:
  prev->first
';

$result_sectioning_root{'section_on_enumerate_line'} = 'level: 1
list:
 1|first
 2|second
';

$result_headings_list{'section_on_enumerate_line'} = '';


$result_converted{'plaintext'}->{'section_on_enumerate_line'} = '1 first
=======

2 second
========

';


$result_converted{'xml'}->{'section_on_enumerate_line'} = '<enumerate first="1"><enumeratefirst> something </enumeratefirst>
</enumerate>
<section><sectiontitle> first</sectiontitle>

<enumerate first="4"><enumeratefirst> 4 </enumeratefirst>
</enumerate>
</section>
<section><sectiontitle> second</sectiontitle>
</section>
';

1;
