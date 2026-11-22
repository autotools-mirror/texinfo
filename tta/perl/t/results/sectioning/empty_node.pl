use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_node'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C2 l1
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l3
  *arguments_line C4
   *line_arg C1
    {spaces_before_argument: }
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{next}
    {spaces_before_argument: }
    {normal_text:next}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{prev}
    {spaces_before_argument: }
    {normal_text:prev}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{up}
    {spaces_before_argument: }
    {normal_text:up}
    {spaces_after_argument:\\n}
';


$result_texis{'empty_node'} = '@node

@node , next, prev, up
';


$result_texts{'empty_node'} = '
';

$result_errors{'empty_node'} = '* E l1|empty argument in @node
 empty argument in @node

* E l3|empty argument in @node
 empty argument in @node

';

$result_nodes_list{'empty_node'} = '';

$result_sections_list{'empty_node'} = '';

$result_sectioning_root{'empty_node'} = '';

$result_headings_list{'empty_node'} = '';

1;
