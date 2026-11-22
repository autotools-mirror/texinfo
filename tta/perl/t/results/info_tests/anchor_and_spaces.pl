use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_and_spaces'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C7 l2 {Element}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Element}
    {spaces_after_argument:\\n}
  *normal_command@anchor C1 l3
  |EXTRA
  |identifier:{anchor-0}
  |is_target:{1}
   *brace_arg C1
    {normal_text:anchor 0}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Now }
   *normal_command@anchor C1 l5
   |EXTRA
   |identifier:{anchor1}
   |is_target:{1}
    *brace_arg C1
     {normal_text:anchor1}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:No space}
   *normal_command@anchor C1 l7
   |EXTRA
   |identifier:{anchor2}
   |is_target:{1}
    *brace_arg C1
     {normal_text:anchor2}
   {normal_text:.\\n}
';


$result_texis{'anchor_and_spaces'} = '@node Top
@top Element
@anchor{anchor 0}

Now @anchor{anchor1}.

No space@anchor{anchor2}.
';


$result_texts{'anchor_and_spaces'} = 'Element
*******

Now .

No space.
';

$result_errors{'anchor_and_spaces'} = '';

$result_nodes_list{'anchor_and_spaces'} = '1|Top
 associated_section: Element
 associated_title_command: Element
';

$result_sections_list{'anchor_and_spaces'} = '1|Element
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'anchor_and_spaces'} = 'level: -1
list:
 1|Element
';

$result_headings_list{'anchor_and_spaces'} = '';


$result_converted{'info'}->{'anchor_and_spaces'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

Element
*******

Now .

   No space.


Tag Table:
Node: Top27
Ref: anchor 078
Ref: anchor181
Ref: anchor296

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
