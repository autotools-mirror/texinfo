use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_node_but_top'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@top C1 l1 {top}
 |identifier:{Top}
 |is_target:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
';


$result_texis{'no_node_but_top'} = '@top top
';


$result_texts{'no_node_but_top'} = 'top
***
';

$result_errors{'no_node_but_top'} = '';

$result_nodes_list{'no_node_but_top'} = '';

$result_sections_list{'no_node_but_top'} = '1|top
';

$result_sectioning_root{'no_node_but_top'} = 'level: -1
list:
 1|top
';

$result_headings_list{'no_node_but_top'} = '';


$result_converted{'info'}->{'no_node_but_top'} = Encode::encode('utf-8', 'This is , produced from .

top
***


Tag Table:
Ref: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'no_node_but_top'} = '* W |document without nodes
 warning: document without nodes

* W l1|@top outside of any node
 warning: @top outside of any node

';

1;
