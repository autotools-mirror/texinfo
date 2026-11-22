use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'setfilename_on_top_and_after_node_epub'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C3 l2 {In top @setfilename very badly placed setfilename
}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:In top }
    *@setfilename C1 l2
    |EXTRA
    |text_arg:{very badly placed setfilename}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:very badly placed setfilename}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@setfilename C1 l4
  |EXTRA
  |text_arg:{a bit too late}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a bit too late}
    {spaces_after_argument:\\n}
';


$result_texis{'setfilename_on_top_and_after_node_epub'} = '@node Top
@top In top @setfilename very badly placed setfilename

@setfilename a bit too late
';


$result_texts{'setfilename_on_top_and_after_node_epub'} = 'In top 
*******

';

$result_errors{'setfilename_on_top_and_after_node_epub'} = '* W l2|@setfilename should only appear at the beginning of a line
 warning: @setfilename should only appear at the beginning of a line

* W l2|@setfilename should not appear on @top line
 warning: @setfilename should not appear on @top line

* W l2|@setfilename after the first element
 warning: @setfilename after the first element

* W l4|multiple @setfilename
 warning: multiple @setfilename

* W l4|@setfilename after the first element
 warning: @setfilename after the first element

';

$result_nodes_list{'setfilename_on_top_and_after_node_epub'} = '1|Top
 associated_section: In top @setfilename very badly placed setfilename

 associated_title_command: In top @setfilename very badly placed setfilename

';

$result_sections_list{'setfilename_on_top_and_after_node_epub'} = '1|In top @setfilename very badly placed setfilename

 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'setfilename_on_top_and_after_node_epub'} = 'level: -1
list:
 1|In top @setfilename very badly placed setfilename

';

$result_headings_list{'setfilename_on_top_and_after_node_epub'} = '';

1;
