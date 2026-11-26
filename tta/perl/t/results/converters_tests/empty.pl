use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty'} = '*document_root C1
 *before_node_section C1
  *preamble
';


$result_texis{'empty'} = '';


$result_texts{'empty'} = '';

$result_errors{'empty'} = '';

$result_nodes_list{'empty'} = '';

$result_sections_list{'empty'} = '';

$result_sectioning_root{'empty'} = '';

$result_headings_list{'empty'} = '';

$result_converted_errors{'file_html'}->{'empty'} = '* W empty.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

$result_converted_errors{'file_info'}->{'empty'} = '* W empty.texi|document without nodes
 warning: document without nodes

';

1;
