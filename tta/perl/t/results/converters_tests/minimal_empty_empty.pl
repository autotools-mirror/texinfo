use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'minimal_empty_empty'} = '*document_root C1
 *before_node_section C2
  *before_beginning C2
   {empty_line:\\n}
   {empty_line:\\n}
  *preamble
';


$result_texis{'minimal_empty_empty'} = '

';


$result_texts{'minimal_empty_empty'} = '';

$result_errors{'minimal_empty_empty'} = '';

$result_nodes_list{'minimal_empty_empty'} = '';

$result_sections_list{'minimal_empty_empty'} = '';

$result_sectioning_root{'minimal_empty_empty'} = '';

$result_headings_list{'minimal_empty_empty'} = '';

$result_converted_errors{'file_html'}->{'minimal_empty_empty'} = '* W minimal_empty_empty.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

$result_converted_errors{'file_info'}->{'minimal_empty_empty'} = '* W minimal_empty_empty.texi|document without nodes
 warning: document without nodes

';

1;
