use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'quoted_xref_in_flushright'} = '*document_root C5
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {a:@comma{}b}
 |identifier:{a_003a_002cb}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:a:}
    *normal_command@comma C1 l4
     *brace_container
    {normal_text:b}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l5 {a:@comma{}b}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:a:}
    *normal_command@comma C1 l5
     *brace_container
    {normal_text:b}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@flushright C3 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C5
    {normal_text:before\\n}
    {normal_text:Some }
    *normal_command@ref C1 l9
     *brace_arg C3
     |node_content:A{0|2}
     |normalized:{a_003a_002cb}
      {normal_text:a:}
      *normal_command@comma C1 l9
       *brace_container
      {normal_text:b}
    {normal_text: after\\n}
    {normal_text:more text\\n}
   *normal_command@end C1 l11
   |text_arg:{flushright}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:flushright}
     {spaces_after_argument:\\n}
';


$result_texis{'quoted_xref_in_flushright'} = '@node Top
@top top

@node a:@comma{}b
@chapter a:@comma{}b

@flushright
before
Some @ref{a:@comma{}b} after
more text
@end flushright
';


$result_texts{'quoted_xref_in_flushright'} = 'top
***

1 a:,b
******

before
Some a:,b after
more text
';

$result_errors{'quoted_xref_in_flushright'} = '';

$result_nodes_list{'quoted_xref_in_flushright'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->a:@comma{}b
2|a:@comma{}b
 associated_section: 1 a:@comma{}b
 associated_title_command: 1 a:@comma{}b
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'quoted_xref_in_flushright'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->a:@comma{}b
 section_children:
  1|a:@comma{}b
2|a:@comma{}b
 associated_anchor_command: a:@comma{}b
 associated_node: a:@comma{}b
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'quoted_xref_in_flushright'} = 'level: -1
list:
 1|top
';

$result_headings_list{'quoted_xref_in_flushright'} = '';


$result_converted{'info'}->{'quoted_xref_in_flushright'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: a:,b,  Up: (dir)

top
***

* Menu:

* a:,b::


File: ,  Node: a:,b,  Prev: Top,  Up: Top

1 a:,b
******

                                                                 before
                                                Some *note a:,b:: after
                                                              more text


Tag Table:
Node: Top27
Node: a:,b106

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'quoted_xref_in_flushright'} = '* W l4|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

* W l4|node name should not contain `,\': a:,b
 warning: node name should not contain `,\': a:,b

* W l9|@ref node name should not contain `:\'
 warning: @ref node name should not contain `:\'

';

1;
