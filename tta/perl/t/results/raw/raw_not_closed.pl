use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'raw_not_closed'} = '*document_root C1
 *before_node_section C1
  *@html C2 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C3
    {empty_line:\\n}
    {This is some html\\n}
    {<address> my address </address>\\n}
';


$result_texis{'raw_not_closed'} = '@html

This is some html
<address> my address </address>
';


$result_texts{'raw_not_closed'} = '
This is some html
<address> my address </address>
';

$result_errors{'raw_not_closed'} = '* E l1|no matching `@end html\'
 no matching `@end html\'

';

$result_nodes_list{'raw_not_closed'} = '';

$result_sections_list{'raw_not_closed'} = '';

$result_sectioning_root{'raw_not_closed'} = '';

$result_headings_list{'raw_not_closed'} = '';

1;
