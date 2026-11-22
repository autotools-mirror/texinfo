use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'dot_and_dot_space_in_node_menu_entry'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C4 l1 {Top}
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
  *normal_command@menu C3 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {normal_text:name}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |node_content:A{0|3}
    |normalized:{aa_002ebb_002e-c}
     {normal_text:aa.bb}
     *normal_command@asis C1 l4
      *brace_container C1
       {normal_text:. }
     {normal_text:c}
     {space_at_end_menu_node:\\n}
   *normal_command@end C1 l5
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {aa.bb@asis{. }c}
 |EXTRA
 |identifier:{aa_002ebb_002e-c}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:aa.bb}
    *normal_command@asis C1 l7
     *brace_container C1
      {normal_text:. }
    {normal_text:c}
    {spaces_after_argument:\\n}
';


$result_texis{'dot_and_dot_space_in_node_menu_entry'} = '@node Top

@menu
* name: aa.bb@asis{. }c
@end menu

@node aa.bb@asis{. }c
';


$result_texts{'dot_and_dot_space_in_node_menu_entry'} = '
* name: aa.bb. c

';

$result_errors{'dot_and_dot_space_in_node_menu_entry'} = '';

$result_nodes_list{'dot_and_dot_space_in_node_menu_entry'} = '1|Top
 menus:
  aa.bb@asis{. }c

 node_directions:
  next->aa.bb@asis{. }c
2|aa.bb@asis{. }c
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'dot_and_dot_space_in_node_menu_entry'} = '';

$result_sectioning_root{'dot_and_dot_space_in_node_menu_entry'} = '';

$result_headings_list{'dot_and_dot_space_in_node_menu_entry'} = '';


$result_converted{'info'}->{'dot_and_dot_space_in_node_menu_entry'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: aa.bb. c,  Up: (dir)

* Menu:

* name: aa.bb. c


File: ,  Node: aa.bb. c,  Prev: Top,  Up: Top


Tag Table:
Node: Top27
Node: aa.bb. c107

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'dot_and_dot_space_in_node_menu_entry'} = '* W l4|menu entry node name should not contain `. \'
 warning: menu entry node name should not contain `. \'

';

1;
