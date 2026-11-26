use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'simplest_test_prefix'} = '*document_root C3
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


$result_texis{'simplest_test_prefix'} = '\\input texinfo @c -*-texinfo-*-

@node Top

This is a very simple texi manual @  <>.

@bye
';


$result_texts{'simplest_test_prefix'} = '
This is a very simple texi manual   <>.

';

$result_errors{'simplest_test_prefix'} = '';

$result_nodes_list{'simplest_test_prefix'} = '1|Top
';

$result_sections_list{'simplest_test_prefix'} = '';

$result_sectioning_root{'simplest_test_prefix'} = '';

$result_headings_list{'simplest_test_prefix'} = '';

$result_converted_errors{'file_html'}->{'simplest_test_prefix'} = '* W simplest.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
