use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unknown_synindex'} = '*document_root C1
 *before_node_section C1
  *preamble C1
   *normal_command@synindex C1 l1
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:c truc}
';


$result_texis{'unknown_synindex'} = '@synindex c truc';


$result_texts{'unknown_synindex'} = '';

$result_errors{'unknown_synindex'} = '* E l1|unknown source index in @synindex: c
 unknown source index in @synindex: c

* E l1|unknown destination index in @synindex: truc
 unknown destination index in @synindex: truc

';

$result_nodes_list{'unknown_synindex'} = '';

$result_sections_list{'unknown_synindex'} = '';

$result_sectioning_root{'unknown_synindex'} = '';

$result_headings_list{'unknown_synindex'} = '';

1;
