use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'tex_not_closed'} = '*document_root C1
 *before_node_section C1
  *preamble C1
   *normal_command@tex C2 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C2
     {empty_line:\\n}
     {normal_text:This is some \\LaTeX{}\\n}
';


$result_texis{'tex_not_closed'} = '@tex

This is some \\LaTeX{}
';


$result_texts{'tex_not_closed'} = '
This is some \\LaTeX{}
';

$result_errors{'tex_not_closed'} = '* E l1|no matching `@end tex\'
 no matching `@end tex\'

';

$result_nodes_list{'tex_not_closed'} = '';

$result_sections_list{'tex_not_closed'} = '';

$result_sectioning_root{'tex_not_closed'} = '';

$result_headings_list{'tex_not_closed'} = '';

1;
