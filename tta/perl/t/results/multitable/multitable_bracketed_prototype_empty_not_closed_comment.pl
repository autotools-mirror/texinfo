use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_bracketed_prototype_empty_not_closed_comment'} = '*document_root C1
 *before_node_section C3
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *@multitable C2 l2
  |EXTRA
  |max_columns:{1}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *bracketed_arg C1 l2
      *@comment C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:comment}
        {spaces_after_argument:\\n}
   *@end C1 l3
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable_bracketed_prototype_empty_not_closed_comment'} = '
@multitable {@comment comment
}@end multitable
';


$result_texts{'multitable_bracketed_prototype_empty_not_closed_comment'} = '';

$result_errors{'multitable_bracketed_prototype_empty_not_closed_comment'} = '* E l2|misplaced {
 misplaced {

';

$result_nodes_list{'multitable_bracketed_prototype_empty_not_closed_comment'} = '';

$result_sections_list{'multitable_bracketed_prototype_empty_not_closed_comment'} = '';

$result_sectioning_root{'multitable_bracketed_prototype_empty_not_closed_comment'} = '';

$result_headings_list{'multitable_bracketed_prototype_empty_not_closed_comment'} = '';

1;
