use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'invalid_node_name_no_warning'} = '*document_root C5
 *before_node_section C1
  {empty_line:\\n}
 *@node C4 l2 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  {empty_line:\\n}
  *@menu C5 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     *@asis C1 l5
      *brace_container C1
       {truc:}
    {menu_entry_separator:: }
    *menu_entry_node C2
    |EXTRA
    |node_content:{@asis{nodename. a}\\n}
    |normalized:{nodename_002e-a}
     *@asis C1 l5
      *brace_container C1
       {nodename. a}
     {space_at_end_menu_node:\\n}
   *menu_entry C6 l6
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {machin}
    {menu_entry_separator:: }
    *menu_entry_node C3
    |EXTRA
    |node_content:{node@comma{}comma}
    |normalized:{node_002ccomma}
     {node}
     *@comma C1 l6
      *brace_container
     {comma}
    {menu_entry_separator:, }
    *menu_entry_description C1
     *preformatted C1
      {def\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{@asis{bidule:}}
    |normalized:{bidule_003a}
     *@asis C1 l7
      *brace_container C1
       {bidule:}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C2 l10 {@asis{nodename. a}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{nodename_002e-a}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@asis C1 l10
     *brace_container C1
      {nodename. a}
  {empty_line:\\n}
 *@node C2 l12 {node@comma{}comma}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{node_002ccomma}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {node}
    *@comma C1 l12
     *brace_container
    {comma}
  {empty_line:\\n}
 *@node C3 l14 {@asis{bidule:}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{bidule_003a}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@asis C1 l14
     *brace_container C1
      {bidule:}
  {empty_line:\\n}
  *paragraph C6
   *@ref C2 l16
    *brace_arg C1
    |EXTRA
    |node_content:{@asis{nodename. a}}
    |normalized:{nodename_002e-a}
     *@asis C1 l16
      *brace_container C1
       {nodename. a}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@asis C1 l16
      *brace_container C1
       {truc:}
   {. }
   *@ref C2 l16
    *brace_arg C3
    |EXTRA
    |node_content:{node@comma{}comma}
    |normalized:{node_002ccomma}
     {node}
     *@comma C1 l16
      *brace_container
     {comma}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {machin}
   {.\\n}
   *@ref C1 l17
    *brace_arg C1
    |EXTRA
    |node_content:{@asis{bidule:}}
    |normalized:{bidule_003a}
     *@asis C1 l17
      *brace_container C1
       {bidule:}
   {.\\n}
';


$result_texis{'invalid_node_name_no_warning'} = '
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


$result_texts{'invalid_node_name_no_warning'} = '

* truc:: nodename. a
* machin: node,comma, def
* bidule:::




nodename. a. node,comma.
bidule:.
';

$result_errors{'invalid_node_name_no_warning'} = '';

$result_nodes_list{'invalid_node_name_no_warning'} = '1|Top
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

$result_sections_list{'invalid_node_name_no_warning'} = '';

$result_sectioning_root{'invalid_node_name_no_warning'} = '';

$result_headings_list{'invalid_node_name_no_warning'} = '';


$result_converted{'info'}->{'invalid_node_name_no_warning'} = 'This is , produced from .


File: ,  Node: Top,  Next: nodename. a,  Up: (dir)

* Menu:

* truc:: nodename. a

* machin: node,comma, def
* bidule:::


File: ,  Node: nodename. a,  Next: node,comma,  Prev: Top,  Up: Top


File: ,  Node: node,comma,  Next: bidule:,  Prev: nodename. a,  Up: Top


File: ,  Node: bidule:,  Prev: node,comma,  Up: Top

*note truc:: nodename. a.  *note machin: node,comma.  *note bidule:::.


Tag Table:
Node: Top27
Node: nodename. a159
Node: node,comma232
Node: bidule:309

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
