use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'split_for_format_not_split'} = '*document_root C3
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo @c -*-texinfo-*-\\n}
   {empty_line:\\n}
  *preamble_before_content
 *normal_command@node C4 simplest.texi:l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:This is a very simple texi manual }
   *normal_command@ 
   {normal_text: <>.\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'split_for_format_not_split'} = '\\input texinfo @c -*-texinfo-*-

@node Top

This is a very simple texi manual @  <>.

@bye
';


$result_texts{'split_for_format_not_split'} = '
This is a very simple texi manual   <>.

';

$result_errors{'split_for_format_not_split'} = '';

$result_nodes_list{'split_for_format_not_split'} = '1|Top
';

$result_sections_list{'split_for_format_not_split'} = '';

$result_sectioning_root{'split_for_format_not_split'} = '';

$result_headings_list{'split_for_format_not_split'} = '';

1;
