use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@anchor C1 l1
   *brace_arg C3
    {normal_text:my anchor}
    {spaces_after_argument:\\n}
    {empty_line:\\n}
';


$result_texis{'anchor_not_closed'} = '@anchor{my anchor

}';


$result_texts{'anchor_not_closed'} = '';

$result_errors{'anchor_not_closed'} = '* E l1|@anchor missing closing brace
 @anchor missing closing brace

';

$result_nodes_list{'anchor_not_closed'} = '';

$result_sections_list{'anchor_not_closed'} = '';

$result_sectioning_root{'anchor_not_closed'} = '';

$result_headings_list{'anchor_not_closed'} = '';

1;
