use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_ignore_comment_no_eol'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@ignore C2 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {raw:@ignore @c comment}
';


$result_texis{'nested_ignore_comment_no_eol'} = '@ignore
@ignore @c comment';


$result_texts{'nested_ignore_comment_no_eol'} = '';

$result_errors{'nested_ignore_comment_no_eol'} = '* E l2|expected @end ignore
 expected @end ignore

* E l1|no matching `@end ignore\'
 no matching `@end ignore\'

';

$result_nodes_list{'nested_ignore_comment_no_eol'} = '';

$result_sections_list{'nested_ignore_comment_no_eol'} = '';

$result_sectioning_root{'nested_ignore_comment_no_eol'} = '';

$result_headings_list{'nested_ignore_comment_no_eol'} = '';

1;
