use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'false_format_not_closed'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@html C2 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *elided_rawpreformatted C1
     {raw:blah blah\\n}
';


$result_texis{'false_format_not_closed'} = '@html
blah blah
';


$result_texts{'false_format_not_closed'} = '';

$result_errors{'false_format_not_closed'} = '* E l1|no matching `@end html\'
 no matching `@end html\'

';

$result_nodes_list{'false_format_not_closed'} = '';

$result_sections_list{'false_format_not_closed'} = '';

$result_sectioning_root{'false_format_not_closed'} = '';

$result_headings_list{'false_format_not_closed'} = '';

1;
