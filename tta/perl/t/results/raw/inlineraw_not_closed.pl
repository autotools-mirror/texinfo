use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inlineraw_not_closed'} = '*document_root C2
 *before_node_section C2
  *preamble
  *paragraph C1
   *normal_command@inlineraw C2 l1
   |expand_index:{1}
   |format:{html}
    *brace_arg C1
     {normal_text:html}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:aa\\n}
 *normal_command@section C1 l2 {sec}
 |identifier:{sec}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec}
    {spaces_after_argument:\\n}
';


$result_texis{'inlineraw_not_closed'} = '@inlineraw{html, aa
}@section sec
';


$result_texts{'inlineraw_not_closed'} = 'aa
1 sec
=====
';

$result_errors{'inlineraw_not_closed'} = '* E l1|@section seen before @inlineraw closing brace
 @section seen before @inlineraw closing brace

';

$result_nodes_list{'inlineraw_not_closed'} = '';

$result_sections_list{'inlineraw_not_closed'} = '1|sec
';

$result_sectioning_root{'inlineraw_not_closed'} = 'level: 1
list:
 1|sec
';

$result_headings_list{'inlineraw_not_closed'} = '';

1;
