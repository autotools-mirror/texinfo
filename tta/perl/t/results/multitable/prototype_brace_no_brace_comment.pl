use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'prototype_brace_no_brace_comment'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@multitable C2 l1
  |EXTRA
  |max_columns:{1}
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      {normal_text:aa}
     {normal_text: bb}
     *normal_command@comment C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:cc}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'prototype_brace_no_brace_comment'} = '@multitable {aa} bb@comment cc
@end multitable
';


$result_texts{'prototype_brace_no_brace_comment'} = '';

$result_errors{'prototype_brace_no_brace_comment'} = '';

$result_nodes_list{'prototype_brace_no_brace_comment'} = '';

$result_sections_list{'prototype_brace_no_brace_comment'} = '';

$result_sectioning_root{'prototype_brace_no_brace_comment'} = '';

$result_headings_list{'prototype_brace_no_brace_comment'} = '';


$result_converted{'plaintext'}->{'prototype_brace_no_brace_comment'} = '';


$result_converted{'html_text'}->{'prototype_brace_no_brace_comment'} = '';


$result_converted{'xml'}->{'prototype_brace_no_brace_comment'} = '<multitable endspaces=" "><columnprototypes> <columnprototype bracketed="on">aa</columnprototype> bb<!-- comment cc -->
</columnprototypes><!-- comment cc -->
</multitable>
';

1;
