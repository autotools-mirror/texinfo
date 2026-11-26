use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'verbatim_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@verbatim C6 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:\\n}
   {raw:some verbatim @\\n}
   {raw:\\n}
   {raw:@macro\\n}
   {raw:\\n}
';


$result_texis{'verbatim_not_closed'} = '@verbatim

some verbatim @

@macro

';


$result_texts{'verbatim_not_closed'} = '
some verbatim @

@macro

';

$result_errors{'verbatim_not_closed'} = '* E l1|no matching `@end verbatim\'
 no matching `@end verbatim\'

';

$result_nodes_list{'verbatim_not_closed'} = '';

$result_sections_list{'verbatim_not_closed'} = '';

$result_sectioning_root{'verbatim_not_closed'} = '';

$result_headings_list{'verbatim_not_closed'} = '';

1;
