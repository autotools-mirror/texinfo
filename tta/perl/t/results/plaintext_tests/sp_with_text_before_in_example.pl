use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'sp_with_text_before_in_example'} = '*document_root C1
 *before_node_section C3
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *normal_command@example C3 l2
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C3
    {normal_text:sp}
    *normal_command@sp C1 l3
    |misc_args:A{4}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:4}
      {spaces_after_argument:\\n}
    {normal_text:text\\n}
   *normal_command@end C1 l5
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'sp_with_text_before_in_example'} = '
@example
sp@sp 4
text
@end example
';


$result_texts{'sp_with_text_before_in_example'} = 'sp



text
';

$result_errors{'sp_with_text_before_in_example'} = '* W l3|@sp should only appear at the beginning of a line
 warning: @sp should only appear at the beginning of a line

';

$result_nodes_list{'sp_with_text_before_in_example'} = '';

$result_sections_list{'sp_with_text_before_in_example'} = '';

$result_sectioning_root{'sp_with_text_before_in_example'} = '';

$result_headings_list{'sp_with_text_before_in_example'} = '';


$result_converted{'plaintext'}->{'sp_with_text_before_in_example'} = '     sp



     text
';

1;
