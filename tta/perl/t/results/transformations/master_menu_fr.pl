use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'master_menu_fr'} = '*document_root C7
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo.tex\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@documentlanguage C1 no_master_menu_fr.texi:l3
   |EXTRA
   |global_command_number:{1}
   |text_arg:{fr}
    *line_arg C3
     {spaces_before_argument: }
     {fr}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 no_master_menu_fr.texi:l5 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C4 no_master_menu_fr.texi:l6 {max}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {max}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 no_master_menu_fr.texi:l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 no_master_menu_fr.texi:l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chap}
     {chap}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@detailmenu C4
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_comment C1
     *preformatted C12
      { --- Liste d}
      *@\' C1
       *following_arg C1
        {e}
      {taill}
      *@\' C1
       *following_arg C1
        {e}
      {e des n}
      *@oe C1
       *brace_container
      {uds ---}
      {\\n}
      {empty_line:\\n}
      {chap}
      {empty_line:\\n}
      {empty_line:\\n}
    *menu_entry C4
     {menu_entry_leading_text:* }
     *menu_entry_node C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{section}
      {section}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {\\n}
    *@end C1
    |EXTRA
    |text_arg:{detailmenu}
     *line_arg C3
      {spaces_before_argument: }
      {detailmenu}
      {spaces_after_argument:\\n}
   *@end C1 no_master_menu_fr.texi:l10
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 no_master_menu_fr.texi:l12 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
 *@chapter C4 no_master_menu_fr.texi:l13 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 no_master_menu_fr.texi:l15
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 no_master_menu_fr.texi:l16
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{section}
     {section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 no_master_menu_fr.texi:l17
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 no_master_menu_fr.texi:l19 {section}
 |EXTRA
 |identifier:{section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {section}
    {spaces_after_argument:\\n}
 *@section C1 no_master_menu_fr.texi:l20 {sec}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {sec}
    {spaces_after_argument:\\n}
';


$result_texis{'master_menu_fr'} = '\\input texinfo.tex

@documentlanguage fr

@node Top
@top max

@menu
* chap::

@detailmenu
 --- Liste d@\'etaill@\'ee des n@oe{}uds ---

chap

* section::
@end detailmenu
@end menu

@node chap
@chapter chap

@menu
* section::
@end menu

@node section
@section sec
';


$result_texts{'master_menu_fr'} = '
max
***

* chap::

 -- Liste de\'taille\'e des noeuds --

chap

* section::

1 chap
******

* section::

1.1 sec
=======
';

$result_errors{'master_menu_fr'} = '';

$result_nodes_list{'master_menu_fr'} = '1|Top
 associated_section: max
 associated_title_command: max
 menus:
  chap
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 menus:
  section
 node_directions:
  prev->Top
  up->Top
3|section
 associated_section: 1.1 sec
 associated_title_command: 1.1 sec
 node_directions:
  up->chap
';

$result_sections_list{'master_menu_fr'} = '1|max
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->max
 toplevel_directions:
  prev->max
  up->max
 section_children:
  1|sec
3|sec
 associated_anchor_command: section
 associated_node: section
 section_directions:
  up->chap
';

$result_sectioning_root{'master_menu_fr'} = 'level: -1
list:
 1|max
';

$result_headings_list{'master_menu_fr'} = '';


$result_converted{'info'}->{'master_menu_fr'} = Encode::encode('utf-8', 'This is , produced from no_master_menu_fr.texi.


File: ,  Node: Top,  Next: chap,  Up: (dir)

max
***

* Menu:

* chap::

 -- Liste détaillée des nœuds --

chap

* section::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 chap
******

* Menu:

* section::


File: ,  Node: section,  Up: chap

1.1 sec
=======


Tag Table:
Node: Top49
Node: chap180
Node: section262

End Tag Table


Local Variables:
coding: utf-8
Info-documentlanguage: fr
End:
');

1;
