use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inlinefmtifelse_nesting'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   *normal_command@inlinefmtifelse C3 l1
   |expand_index:{2}
   |format:{info}
    *brace_arg C1
     {normal_text:info}
    *elided_brace_command_arg C1
     {raw: @footnote{See.}}
    *brace_arg C2
     {spaces_before_argument: }
     *normal_command@emph C1 l1
      *brace_container C1
       {normal_text:text}
   {normal_text:\\n}
';


$result_texis{'inlinefmtifelse_nesting'} = '@inlinefmtifelse{info, @footnote{See.}, @emph{text}}
';


$result_texts{'inlinefmtifelse_nesting'} = 'text
';

$result_errors{'inlinefmtifelse_nesting'} = '';

$result_nodes_list{'inlinefmtifelse_nesting'} = '';

$result_sections_list{'inlinefmtifelse_nesting'} = '';

$result_sectioning_root{'inlinefmtifelse_nesting'} = '';

$result_headings_list{'inlinefmtifelse_nesting'} = '';

1;
