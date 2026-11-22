use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'section_on_multitable_line'} = '*document_root C4
 *before_node_section C2
  *preamble_before_content
  *normal_command@multitable C1 l1
  |max_columns:{0}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: }
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
  *normal_command@multitable C1 l3
  |max_columns:{0}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code C1 l3
      *brace_container C1
       {normal_text:this}
     {spaces_after_argument: }
 *normal_command@section C3 l3 {second}
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
  {empty_line:\\n}
  *normal_command@multitable C1 l5
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l5
      {normal_text:aaa}
     {normal_text: }
     *bracketed_arg C1 l5
      {normal_text:bbb}
     {spaces_after_argument: }
 *normal_command@section C1 l5 {third}
 |identifier:{third}
 |is_target:{1}
 |section_heading_number:{3}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:third}
    {spaces_after_argument:\\n}
';


$result_texis{'section_on_multitable_line'} = '@multitable @section first

@multitable @code{this} @section second

@multitable {aaa} {bbb} @section third
';


$result_texts{'section_on_multitable_line'} = '1 first
=======

2 second
========

3 third
=======
';

$result_errors{'section_on_multitable_line'} = '* W l1|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l1|@section should not appear on @multitable line
 warning: @section should not appear on @multitable line

* W l1|empty multitable
 warning: empty multitable

* E l1|@section seen before @end multitable
 @section seen before @end multitable

* W l3|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l3|@section should not appear on @multitable line
 warning: @section should not appear on @multitable line

* W l3|unexpected argument on @multitable line: @code{this}
 warning: unexpected argument on @multitable line: @code{this}

* W l3|empty multitable
 warning: empty multitable

* E l3|@section seen before @end multitable
 @section seen before @end multitable

* W l5|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l5|@section should not appear on @multitable line
 warning: @section should not appear on @multitable line

* E l5|@section seen before @end multitable
 @section seen before @end multitable

';

$result_nodes_list{'section_on_multitable_line'} = '';

$result_sections_list{'section_on_multitable_line'} = '1|first
 section_directions:
  next->second
 toplevel_directions:
  next->second
2|second
 section_directions:
  next->third
  prev->first
 toplevel_directions:
  next->third
  prev->first
3|third
 section_directions:
  prev->second
 toplevel_directions:
  prev->second
';

$result_sectioning_root{'section_on_multitable_line'} = 'level: 1
list:
 1|first
 2|second
 3|third
';

$result_headings_list{'section_on_multitable_line'} = '';


$result_converted{'plaintext'}->{'section_on_multitable_line'} = '1 first
=======

2 second
========

3 third
=======

';


$result_converted{'xml'}->{'section_on_multitable_line'} = '<multitable><columnprototypes> </columnprototypes>
</multitable>
<section><sectiontitle> first</sectiontitle>

<multitable><columnprototypes> <code>this</code> </columnprototypes>
</multitable>
</section>
<section><sectiontitle> second</sectiontitle>

<multitable><columnprototypes> <columnprototype bracketed="on">aaa</columnprototype> <columnprototype bracketed="on">bbb</columnprototype> </columnprototypes>
</multitable>
</section>
<section><sectiontitle> third</sectiontitle>
</section>
';

1;
