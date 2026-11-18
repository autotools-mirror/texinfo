use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'parenthesis_in_node_name_explicit_refs'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C6 l2
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {in top.\\n}
  {empty_line:\\n}
  *@menu C4 l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{One_003a}
     {One}
     *@asis C1 l7
      *brace_container C1
       {:}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:A{1|1}
     {(}
     {Two}
     {)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l9
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l11 {One:}
 |EXTRA
 |identifier:{One_003a}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {One:}
   *line_arg C4
   |EXTRA
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {(}
    {Two}
    {)}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {Top}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@chapter C4 l12 {One:}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {One:}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {AA.\\n}
  {empty_line:\\n}
 *@node C1 l16 {@asis{(}Two)}
 |EXTRA
 |added:{1}
 |identifier:{_0028Two_0029}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    *@asis C1
     *brace_container C1
      {(}
    {Two)}
    {spaces_after_argument:\\n}
 *@chapter C5 l16 {(Two)}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {(Two)}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {AA.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l20
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0028Two_0029}
     {(Two)}
   {.\\n}
';


$result_texis{'parenthesis_in_node_name_explicit_refs'} = '@node Top
@top

in top.

@menu
* One@asis{:}::
* (Two)::
@end menu

@node One:, (Two), Top, Top
@chapter One:

AA.

@node @asis{(}Two)
@chapter (Two)

AA.

@xref{(Two)}.
';


$result_texts{'parenthesis_in_node_name_explicit_refs'} = '
in top.

* One:::
* (Two)::

1 One:
******

AA.

2 (Two)
*******

AA.

(Two).
';

$result_errors{'parenthesis_in_node_name_explicit_refs'} = '* W l20|@xref to `(Two)\', different from node name `@asis{(}Two)\'
 warning: @xref to `(Two)\', different from node name `@asis{(}Two)\'

* W l1|node `Top\' lacks menu item for `@asis{(}Two)\' but is above it in sectioning
 warning: node `Top\' lacks menu item for `@asis{(}Two)\' but is above it in sectioning

* W l7|@menu entry node name `One@asis{:}\' different from node name `One:\'
 warning: @menu entry node name `One@asis{:}\' different from node name `One:\'

';

$result_nodes_list{'parenthesis_in_node_name_explicit_refs'} = '1|Top
 associated_section
 associated_title_command
 menus:
  One@asis{:}
  (Two)
 node_directions:
  next->One:
2|One:
 associated_section: 1 One:
 associated_title_command: 1 One:
 node_directions:
  next-> (Two)
  prev->Top
  up->Top
3|@asis{(}Two)
 associated_section: 2 (Two)
 node_directions:
  prev->One:
  up->Top
';

$result_sections_list{'parenthesis_in_node_name_explicit_refs'} = '1
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->One:
 section_children:
  1|One:
  2|(Two)
2|One:
 associated_anchor_command: One:
 associated_node: One:
 section_directions:
  next->(Two)
  up->
 toplevel_directions:
  next->(Two)
  prev->
  up->
3|(Two)
 associated_node: @asis{(}Two)
 section_directions:
  prev->One:
  up->
 toplevel_directions:
  prev->One:
  up->
';

$result_sectioning_root{'parenthesis_in_node_name_explicit_refs'} = 'level: -1
list:
 1|
';

$result_headings_list{'parenthesis_in_node_name_explicit_refs'} = '';


$result_converted{'info'}->{'parenthesis_in_node_name_explicit_refs'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: One:,  Up: (dir)

in top.

* Menu:

* One:::
* (Two)::


File: ,  Node: One:,  Next: (Two),  Prev: Top,  Up: Top

1 One:
******

AA.


File: ,  Node: (Two),  Prev: One:,  Up: Top

2 (Two)
*******

AA.

   *Note (Two)::.


Tag Table:
Node: Top27
Node: One:114
Node: (Two)193

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'parenthesis_in_node_name_explicit_refs'} = '* W l7|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

';

1;
