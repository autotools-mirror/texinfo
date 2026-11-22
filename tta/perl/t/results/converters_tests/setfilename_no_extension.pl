use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'setfilename_no_extension'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@setfilename C1 l1
   |text_arg:{setfilename_no_extension}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:setfilename_no_extension}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l4 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C3 l6 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Text.\\n}
';


$result_texis{'setfilename_no_extension'} = '@setfilename setfilename_no_extension

@node Top
@top top

@node chap

Text.
';


$result_texts{'setfilename_no_extension'} = '
top
***


Text.
';

$result_errors{'setfilename_no_extension'} = '* W l6|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'setfilename_no_extension'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'setfilename_no_extension'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'setfilename_no_extension'} = 'level: -1
list:
 1|top
';

$result_headings_list{'setfilename_no_extension'} = '';

1;
