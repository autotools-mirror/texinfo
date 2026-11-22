use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'invalid_node_name_warning'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C4 l2 {Top}
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
  *@menu C5 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     *@asis C1 l5
      *brace_container C1
       {normal_text:truc:}
    {menu_entry_separator:: }
    *menu_entry_node C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{nodename_002e-a}
     *@asis C1 l5
      *brace_container C1
       {normal_text:nodename. a}
     {space_at_end_menu_node:\\n}
   *menu_entry C6 l6
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {normal_text:machin}
    {menu_entry_separator:: }
    *menu_entry_node C3
    |EXTRA
    |node_content:A{0|2}
    |normalized:{node_002ccomma}
     {normal_text:node}
     *@comma C1 l6
      *brace_container
     {normal_text:comma}
    {menu_entry_separator:, }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:def\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{bidule_003a}
     *@asis C1 l7
      *brace_container C1
       {normal_text:bidule:}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l8
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C2 l10 {@asis{nodename. a}}
 |EXTRA
 |identifier:{nodename_002e-a}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *@asis C1 l10
     *brace_container C1
      {normal_text:nodename. a}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C2 l12 {node@comma{}comma}
 |EXTRA
 |identifier:{node_002ccomma}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:node}
    *@comma C1 l12
     *brace_container
    {normal_text:comma}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C3 l14 {@asis{bidule:}}
 |EXTRA
 |identifier:{bidule_003a}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *@asis C1 l14
     *brace_container C1
      {normal_text:bidule:}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C6
   *@ref C2 l16
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{nodename_002e-a}
     *@asis C1 l16
      *brace_container C1
       {normal_text:nodename. a}
    *brace_arg C2
     {spaces_before_argument: }
     *@asis C1 l16
      *brace_container C1
       {normal_text:truc:}
   {normal_text:. }
   *@ref C2 l16
    *brace_arg C3
    |EXTRA
    |node_content:A{0|2}
    |normalized:{node_002ccomma}
     {normal_text:node}
     *@comma C1 l16
      *brace_container
     {normal_text:comma}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:machin}
   {normal_text:.\\n}
   *@ref C1 l17
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{bidule_003a}
     *@asis C1 l17
      *brace_container C1
       {normal_text:bidule:}
   {normal_text:.\\n}
';


$result_texis{'invalid_node_name_warning'} = '
@node Top

@menu
* @asis{truc:}: @asis{nodename. a}
* machin: node@comma{}comma, def
* @asis{bidule:}::
@end menu

@node @asis{nodename. a}

@node node@comma{}comma

@node @asis{bidule:}

@ref{@asis{nodename. a}, @asis{truc:}}. @ref{node@comma{}comma, machin}.
@ref{@asis{bidule:}}.
';


$result_texts{'invalid_node_name_warning'} = '
* truc:: nodename. a
* machin: node,comma, def
* bidule:::




nodename. a. node,comma.
bidule:.
';

$result_errors{'invalid_node_name_warning'} = '';

$result_nodes_list{'invalid_node_name_warning'} = '1|Top
 menus:
  @asis{nodename. a}

  node@comma{}comma
  @asis{bidule:}
 node_directions:
  next->@asis{nodename. a}
2|@asis{nodename. a}
 node_directions:
  next->node@comma{}comma
  prev->Top
  up->Top
3|node@comma{}comma
 node_directions:
  next->@asis{bidule:}
  prev->@asis{nodename. a}
  up->Top
4|@asis{bidule:}
 node_directions:
  prev->node@comma{}comma
  up->Top
';

$result_sections_list{'invalid_node_name_warning'} = '';

$result_sectioning_root{'invalid_node_name_warning'} = '';

$result_headings_list{'invalid_node_name_warning'} = '';


$result_converted{'info'}->{'invalid_node_name_warning'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: nodename. a,  Up: (dir)

* Menu:

* truc:: nodename. a
* machin: node,comma, def
* bidule:::


File: ,  Node: nodename. a,  Next: node,comma,  Prev: Top,  Up: Top


File: ,  Node: node,comma,  Next: bidule:,  Prev: nodename. a,  Up: Top


File: ,  Node: bidule:,  Prev: node,comma,  Up: Top

*note truc:: nodename. a.  *note machin: node,comma.  *note bidule:::.


Tag Table:
Node: Top27
Node: nodename. a158
Node: node,comma231
Node: bidule:308

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'invalid_node_name_warning'} = '* W l5|menu entry name should not contain `:\'
 warning: menu entry name should not contain `:\'

* W l5|menu entry node name should not contain `. \'
 warning: menu entry node name should not contain `. \'

* W l6|menu entry node name should not contain `,\'
 warning: menu entry node name should not contain `,\'

* W l7|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

* W l12|node name should not contain `,\': node,comma
 warning: node name should not contain `,\': node,comma

* W l16|@ref cross-reference name should not contain `:\'
 warning: @ref cross-reference name should not contain `:\'

* W l16|@ref node name should not contain `.\'
 warning: @ref node name should not contain `.\'

* W l16|@ref node name should not contain `,\'
 warning: @ref node name should not contain `,\'

* W l17|@ref node name should not contain `:\'
 warning: @ref node name should not contain `:\'

';

1;
