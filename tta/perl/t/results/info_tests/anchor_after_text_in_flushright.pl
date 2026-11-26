use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_after_text_in_flushright'} = '*document_root C2
 *before_node_section C1
  *preamble
 *normal_command@node C3 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@flushright C4 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C3
    {normal_text:something\\n}
    *normal_command@anchor C1 l5
    |identifier:{point}
    |is_target:{1}
     *brace_arg C1
      {normal_text:point}
    {spaces_after_close_brace:\\n}
   {empty_line:\\n}
   *normal_command@end C1 l7
   |text_arg:{flushright}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:flushright}
     {spaces_after_argument:\\n}
';


$result_texis{'anchor_after_text_in_flushright'} = '@node Top

@flushright
something
@anchor{point}

@end flushright
';


$result_texts{'anchor_after_text_in_flushright'} = '
something

';

$result_errors{'anchor_after_text_in_flushright'} = '';

$result_nodes_list{'anchor_after_text_in_flushright'} = '1|Top
';

$result_sections_list{'anchor_after_text_in_flushright'} = '';

$result_sectioning_root{'anchor_after_text_in_flushright'} = '';

$result_headings_list{'anchor_after_text_in_flushright'} = '';


$result_converted{'info'}->{'anchor_after_text_in_flushright'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

                                                              something


Tag Table:
Node: Top27
Ref: point132

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
