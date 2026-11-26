use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'section_on_itemize_line'} = '*document_root C5
 *before_node_section C2
  *preamble
  *normal_command@itemize C1 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@minus C1 l1
      *brace_container
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
  *normal_command@itemize C1 l3
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *normal_command@minus C1 l3
      *brace_container
     {normal_text: aa}
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
  *normal_command@itemize C1 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: }
 *normal_command@section C3 l5 {third}
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
  {empty_line:\\n}
  *normal_command@itemize C1 l7
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@ringaccent C1 l7
      {spaces_after_cmd_before_arg: }
 *normal_command@section C1 l7 {fourth}
 |identifier:{fourth}
 |is_target:{1}
 |section_heading_number:{4}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fourth}
    {spaces_after_argument:\\n}
';


$result_texis{'section_on_itemize_line'} = '@itemize @minus{} @section first

@itemize @minus{} aa @section second

@itemize @section third

@itemize @ringaccent @section fourth
';


$result_texts{'section_on_itemize_line'} = '1 first
=======

2 second
========

3 third
=======

4 fourth
========
';

$result_errors{'section_on_itemize_line'} = '* W l1|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l1|@section should not appear on @itemize line
 warning: @section should not appear on @itemize line

* E l1|@section seen before @end itemize
 @section seen before @end itemize

* W l3|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l3|@section should not appear on @itemize line
 warning: @section should not appear on @itemize line

* E l3|@section seen before @end itemize
 @section seen before @end itemize

* W l5|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l5|@section should not appear on @itemize line
 warning: @section should not appear on @itemize line

* E l5|@section seen before @end itemize
 @section seen before @end itemize

* E l7|@ringaccent expected braces
 @ringaccent expected braces

* W l7|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l7|@section should not appear on @itemize line
 warning: @section should not appear on @itemize line

* W l7|accent command `@ringaccent\' not allowed as @itemize argument
 warning: accent command `@ringaccent\' not allowed as @itemize argument

* E l7|@section seen before @end itemize
 @section seen before @end itemize

';

$result_nodes_list{'section_on_itemize_line'} = '';

$result_sections_list{'section_on_itemize_line'} = '1|first
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
  next->fourth
  prev->second
 toplevel_directions:
  next->fourth
  prev->second
4|fourth
 section_directions:
  prev->third
 toplevel_directions:
  prev->third
';

$result_sectioning_root{'section_on_itemize_line'} = 'level: 1
list:
 1|first
 2|second
 3|third
 4|fourth
';

$result_headings_list{'section_on_itemize_line'} = '';


$result_converted{'plaintext'}->{'section_on_itemize_line'} = '1 first
=======

2 second
========

3 third
=======

4 fourth
========

';


$result_converted{'xml'}->{'section_on_itemize_line'} = '<itemize commandarg="minus"><itemprepend> &minus; </itemprepend>
</itemize>
<section><sectiontitle> first</sectiontitle>

<itemize><itemprepend> &minus; aa </itemprepend>
</itemize>
</section>
<section><sectiontitle> second</sectiontitle>

<itemize> 
</itemize>
</section>
<section><sectiontitle> third</sectiontitle>

<itemize><itemprepend> <accent type="ring" bracketed="off"> </accent></itemprepend>
</itemize>
</section>
<section><sectiontitle> fourth</sectiontitle>
</section>
';

1;
