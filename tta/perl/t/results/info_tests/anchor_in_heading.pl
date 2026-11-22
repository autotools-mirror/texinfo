use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_heading'} = '*document_root C3
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
 *normal_command@top C3 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@heading C1 l4
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C6
    {spaces_before_argument: }
    {normal_text:Heading }
    *normal_command@anchor C1 l4
    |EXTRA
    |identifier:{point}
    |is_target:{1}
     *brace_arg C1
      {normal_text:point}
    {spaces_after_close_brace: }
    {normal_text:after anchor}
    {spaces_after_argument:\\n}
';


$result_texis{'anchor_in_heading'} = '@node Top
@top top

@heading Heading @anchor{point} after anchor
';


$result_texts{'anchor_in_heading'} = 'top
***

Heading after anchor
====================
';

$result_errors{'anchor_in_heading'} = '* W l4|@anchor should not appear on @heading line
 warning: @anchor should not appear on @heading line

';

$result_nodes_list{'anchor_in_heading'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'anchor_in_heading'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'anchor_in_heading'} = 'level: -1
list:
 1|top
';

$result_headings_list{'anchor_in_heading'} = '1|Heading @anchor{point} after anchor
';


$result_converted{'info'}->{'anchor_in_heading'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

top
***

Heading after anchor
====================


Tag Table:
Node: Top27
Ref: point77

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
