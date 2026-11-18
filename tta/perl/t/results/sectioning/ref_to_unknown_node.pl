use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ref_to_unknown_node'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   *@xref C1 l1
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{unknown-node}
     {unknown node}
   {.}
';


$result_texis{'ref_to_unknown_node'} = '@xref{unknown node}.';


$result_texts{'ref_to_unknown_node'} = 'unknown node.';

$result_errors{'ref_to_unknown_node'} = '* E l1|@xref reference to nonexistent node `unknown node\'
 @xref reference to nonexistent node `unknown node\'

';

$result_nodes_list{'ref_to_unknown_node'} = '';

$result_sections_list{'ref_to_unknown_node'} = '';

$result_sectioning_root{'ref_to_unknown_node'} = '';

$result_headings_list{'ref_to_unknown_node'} = '';

1;
