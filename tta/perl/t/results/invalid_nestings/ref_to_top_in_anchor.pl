use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ref_to_top_in_anchor'} = '*document_root C2
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
  *@anchor C1 l2
  |EXTRA
  |identifier:{TOP-Top}
  |is_target:{1}
   *brace_arg C2
    {normal_text:TOP }
    *@ref C1 l2
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{Top}
      {normal_text:Top}
';


$result_texis{'ref_to_top_in_anchor'} = '@node Top
@anchor{TOP @ref{Top}}';


$result_texts{'ref_to_top_in_anchor'} = '';

$result_errors{'ref_to_top_in_anchor'} = '* W l2|@ref should not appear anywhere inside @anchor
 warning: @ref should not appear anywhere inside @anchor

';

$result_nodes_list{'ref_to_top_in_anchor'} = '1|Top
';

$result_sections_list{'ref_to_top_in_anchor'} = '';

$result_sectioning_root{'ref_to_top_in_anchor'} = '';

$result_headings_list{'ref_to_top_in_anchor'} = '';

1;
