use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_line_style_command'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C3
    {normal_text:example }
    *normal_command@samp C1 l2
     *brace_container C3
      {normal_text:in samp\\n}
      {empty_line:\\n}
      {normal_text:after empty}
    {normal_text: line\\n}
   *normal_command@end C1 l5
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_line_style_command'} = '@example
example @samp{in samp

after empty} line
@end example
';


$result_texts{'empty_line_style_command'} = 'example in samp

after empty line
';

$result_errors{'empty_line_style_command'} = '';

$result_nodes_list{'empty_line_style_command'} = '';

$result_sections_list{'empty_line_style_command'} = '';

$result_sectioning_root{'empty_line_style_command'} = '';

$result_headings_list{'empty_line_style_command'} = '';

1;
