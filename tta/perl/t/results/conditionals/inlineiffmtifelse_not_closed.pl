use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inlineiffmtifelse_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   *normal_command@inlinefmtifelse C2 l1
   |EXTRA
   |expand_index:{2}
   |format:{html}
    *brace_arg C1
     {normal_text:html}
    *elided_brace_command_arg C1
     {raw:\\n}
';


$result_texis{'inlineiffmtifelse_not_closed'} = '@inlinefmtifelse{html,
}';


$result_texts{'inlineiffmtifelse_not_closed'} = '';

$result_errors{'inlineiffmtifelse_not_closed'} = '* E l1|@inlinefmtifelse missing closing brace
 @inlinefmtifelse missing closing brace

';

$result_nodes_list{'inlineiffmtifelse_not_closed'} = '';

$result_sections_list{'inlineiffmtifelse_not_closed'} = '';

$result_sectioning_root{'inlineiffmtifelse_not_closed'} = '';

$result_headings_list{'inlineiffmtifelse_not_closed'} = '';

1;
