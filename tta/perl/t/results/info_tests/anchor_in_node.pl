use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_node'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C2 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l3 {first @anchor{point} after anchor}
 |EXTRA
 |identifier:{first-after-anchor}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C6
    {spaces_before_argument: }
    {normal_text:first }
    *@anchor C1 l3
    |EXTRA
    |identifier:{point}
    |is_target:{1}
     *brace_arg C1
      {normal_text:point}
    {spaces_after_close_brace: }
    {normal_text:after anchor}
    {spaces_after_argument:\\n}
';


$result_texis{'anchor_in_node'} = '@node Top

@node first @anchor{point} after anchor
';


$result_texts{'anchor_in_node'} = '
';

$result_errors{'anchor_in_node'} = '* W l3|@anchor should not appear on @node line
 warning: @anchor should not appear on @node line

* W l3|node `first @anchor{point} after anchor\' not in menu
 warning: node `first @anchor{point} after anchor\' not in menu

';

$result_nodes_list{'anchor_in_node'} = '1|Top
 node_directions:
  next->first @anchor{point} after anchor
2|first @anchor{point} after anchor
 node_directions:
  prev->Top
';

$result_sections_list{'anchor_in_node'} = '';

$result_sectioning_root{'anchor_in_node'} = '';

$result_headings_list{'anchor_in_node'} = '';


$result_converted{'info'}->{'anchor_in_node'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: first after anchor,  Up: (dir)


File: ,  Node: first after anchor,  Prev: Top


Tag Table:
Node: Top27
Node: first after anchor88

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'anchor_in_node'} = '* W l3|@anchor outside of any node
 warning: @anchor outside of any node

';

1;
