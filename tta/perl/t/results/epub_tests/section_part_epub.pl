use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'section_part_epub'} = '*document_root C4
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l2 {section}
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@part C1 l4 {part}
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
';


$result_texis{'section_part_epub'} = '@node Top
@section section

@part part
';


$result_texts{'section_part_epub'} = '1 section
=========

part
****
';

$result_errors{'section_part_epub'} = '* W l4|no chapter-level command before @part
 warning: no chapter-level command before @part

* W l4|no sectioning command associated with @part
 warning: no sectioning command associated with @part

';

$result_nodes_list{'section_part_epub'} = '1|Top
 associated_section: 1 section
 associated_title_command: 1 section
';

$result_sections_list{'section_part_epub'} = '1|section
 associated_anchor_command: Top
 associated_node: Top
2|part
';

$result_sectioning_root{'section_part_epub'} = 'level: -1
list:
 1|section
 2|part
';

$result_headings_list{'section_part_epub'} = '';

$result_converted_errors{'file_epub'}->{'section_part_epub'} = '* W section_part_epub.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
