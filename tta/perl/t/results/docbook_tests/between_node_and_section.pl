use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'between_node_and_section'} = '*document_root C7
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content
 *normal_command@node C1 l2 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l3 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l5 {sec1}
 |identifier:{sec1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec1}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l6 {sec1}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C3 l8 {sec2}
 |identifier:{sec2}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec2}
    {spaces_after_argument:\\n}
  *normal_command@anchor C1 l9
  |identifier:{Old-name}
  |is_target:{1}
   *brace_arg C1
    {normal_text:Old name}
  {spaces_after_close_brace:\\n}
 *normal_command@section C1 l10 {sec2}
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec2}
    {spaces_after_argument:\\n}
';


$result_texis{'between_node_and_section'} = '
@node chap
@chapter Chap

@node sec1
@section sec1

@node sec2
@anchor{Old name}
@section sec2
';


$result_texts{'between_node_and_section'} = '1 Chap
******

1.1 sec1
========

1.2 sec2
========
';

$result_errors{'between_node_and_section'} = '';

$result_nodes_list{'between_node_and_section'} = '1|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
2|sec1
 associated_section: 1.1 sec1
 associated_title_command: 1.1 sec1
 node_directions:
  next->sec2
  up->chap
3|sec2
 associated_section: 1.2 sec2
 associated_title_command: 1.2 sec2
 node_directions:
  prev->sec1
  up->chap
';

$result_sections_list{'between_node_and_section'} = '1|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_children:
  1|sec1
  2|sec2
2|sec1
 associated_anchor_command: sec1
 associated_node: sec1
 section_directions:
  next->sec2
  up->Chap
3|sec2
 associated_anchor_command: sec2
 associated_node: sec2
 section_directions:
  prev->sec1
  up->Chap
';

$result_sectioning_root{'between_node_and_section'} = 'level: 0
list:
 1|Chap
';

$result_headings_list{'between_node_and_section'} = '';


$result_converted{'docbook'}->{'between_node_and_section'} = '<chapter label="1" id="chap">
<title>Chap</title>

<sect1 label="1.1" id="sec1">
<title>sec1</title>

</sect1>
<sect1 label="1.2" id="sec2">
<title>sec2</title>
<anchor id="Old-name"/></sect1>
</chapter>
';

1;
