use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_node_and_bye'} = 'U0 unit{C3}
UNIT_DIRECTIONS
This: [U0]
 *before_node_section C1
  *preamble_before_content
 *@node C2 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'top_node_and_bye'} = '@node Top

@bye
';


$result_texts{'top_node_and_bye'} = '
';

$result_errors{'top_node_and_bye'} = '';

$result_nodes_list{'top_node_and_bye'} = '1|Top
';

$result_sections_list{'top_node_and_bye'} = '';

$result_sectioning_root{'top_node_and_bye'} = '';

$result_headings_list{'top_node_and_bye'} = '';


$result_converted{'xml'}->{'top_node_and_bye'} = '<node identifier="Top"><nodename> Top</nodename></node>

<bye></bye>
';

1;
