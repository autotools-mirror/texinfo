use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'simplest_no_node_section'} = '*document_root C2
 *before_node_section C4
  *before_beginning C2
   {raw:\\input texinfo @c -*-texinfo-*-\\n}
   {empty_line:\\n}
  *preamble C2
   *normal_command@setfilename C1 simplest_no_node_section.texi:l3
   |text_arg:{simplest_no_node_section.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:simplest_no_node_section.info}
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


$result_texis{'simplest_no_node_section'} = '\\input texinfo @c -*-texinfo-*-

@setfilename simplest_no_node_section.info

This is a very simple texi manual @  <>.

@bye
';


$result_texts{'simplest_no_node_section'} = '
This is a very simple texi manual   <>.

';

$result_errors{'simplest_no_node_section'} = '';

$result_nodes_list{'simplest_no_node_section'} = '';

$result_sections_list{'simplest_no_node_section'} = '';

$result_sectioning_root{'simplest_no_node_section'} = '';

$result_headings_list{'simplest_no_node_section'} = '';

$result_converted_errors{'file_html'}->{'simplest_no_node_section'} = '* W simplest_no_node_section.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

$result_converted_errors{'file_info'}->{'simplest_no_node_section'} = '* W simplest_no_node_section.texi|document without nodes
 warning: document without nodes

';

1;
