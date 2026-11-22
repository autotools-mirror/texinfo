use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inlineifset_false_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   *normal_command@inlineifset C2 l1
   |format:{aaa}
    *brace_arg C1
     {normal_text:aaa}
    *elided_brace_command_arg C1
     {raw: bbb\\n}
';


$result_texis{'inlineifset_false_not_closed'} = '@inlineifset{aaa, bbb
}';


$result_texts{'inlineifset_false_not_closed'} = '';

$result_errors{'inlineifset_false_not_closed'} = '* E l1|@inlineifset missing closing brace
 @inlineifset missing closing brace

';

$result_nodes_list{'inlineifset_false_not_closed'} = '';

$result_sections_list{'inlineifset_false_not_closed'} = '';

$result_sectioning_root{'inlineifset_false_not_closed'} = '';

$result_headings_list{'inlineifset_false_not_closed'} = '';

1;
