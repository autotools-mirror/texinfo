use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unknown_printindex'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@printindex C1 l1
  |EXTRA
  |global_command_number:{1}
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:bidule}
';


$result_texis{'unknown_printindex'} = '@printindex bidule';


$result_texts{'unknown_printindex'} = '';

$result_errors{'unknown_printindex'} = '* E l1|unknown index `bidule\' in @printindex
 unknown index `bidule\' in @printindex

';

$result_nodes_list{'unknown_printindex'} = '';

$result_sections_list{'unknown_printindex'} = '';

$result_sectioning_root{'unknown_printindex'} = '';

$result_headings_list{'unknown_printindex'} = '';

1;
