use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'end_of_line_command_in_node_lines'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
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
 *@top C4 l2 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
  *@menu C4 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:{chap @* f     nl Something? @* After punct}
    |normalized:{chap-f-nl-Something_003f-After-punct}
     {chap }
     *@*
     { f     nl Something? }
     *@*
     { After punct}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{new n}
    |normalized:{new-n}
     {new n}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l7
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
 *@node C1 l9 {chap @* f     nl Something? @* After punct}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
 |normalized:{chap-f-nl-Something_003f-After-punct}
  *arguments_line C1
   *line_arg C5
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap }
    *@*
    { f     nl Something? }
    *@*
    { After punct}
 *@chapter C11 l10 {Chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chap}
  {empty_line:\\n}
  *@anchor C1 l12
  |EXTRA
  |is_target:{1}
  |normalized:{ankh-p}
   *brace_arg C3
    {ankh }
    *@*
    { p}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C5
   {text }
   *@*
   { f     nl Something? }
   *@*
   { After punct\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l16
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chap-f-nl-Something_003f-After-punct}
  |index_entry:I{cp,1}
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {a }
    *@*
    { b}
  {empty_line:\\n}
  *@printindex C1 l18
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
 *@node C1 l20 {new n}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{new-n}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {new n}
 *@chapter C9 l21 {Ochap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Ochap}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l23
    *brace_arg C5
    |EXTRA
    |node_content:{chap @* f     nl Something? @* After punct}
    |normalized:{chap-f-nl-Something_003f-After-punct}
     {chap }
     *@*
     { f     nl Something? }
     *@*
     { After punct}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l25
    *brace_arg C3
    |EXTRA
    |node_content:{ankh @* p}
    |normalized:{ankh-p}
     {ankh }
     *@*
     { p}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C2 l27
    *brace_arg C3
    |EXTRA
    |node_content:{ankh @* p}
    |normalized:{ankh-p}
     {ankh }
     *@*
     { p}
    *brace_arg C3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {addll}
     *@*
     {gg}
   {.\\n}
  {empty_line:\\n}
  *@menu C5 l29
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l30
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:{ankh @* p}
    |normalized:{ankh-p}
     {ankh }
     *@*
     { p}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l31
    {menu_entry_leading_text:* }
    *menu_entry_name C3
     {what }
     *@*
     { is}
    {menu_entry_separator:: }
    *menu_entry_node C3
    |EXTRA
    |node_content:{ankh @* p}
    |normalized:{ankh-p}
     {ankh }
     *@*
     { p}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l32
    {menu_entry_leading_text:* }
    *menu_entry_name C3
     {what }
     *@*
     { is}
    {menu_entry_separator:: }
    *menu_entry_node C1
    |EXTRA
    |node_content:{ankh p}
    |normalized:{ankh-p}
     {ankh p}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l33
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
';


$result_texis{'end_of_line_command_in_node_lines'} = '@node Top
@top top

@menu
* chap @* f     nl Something? @* After punct::
* new n::
@end menu

@node chap @* f     nl Something? @* After punct
@chapter Chap

@anchor{ankh @* p}

text @* f     nl Something? @* After punct

@cindex a @* b

@printindex cp

@node new n
@chapter Ochap

@xref{chap @* f     nl Something? @* After punct}.

@xref{ankh @* p}.

@xref{ankh @* p, addll@*gg}.

@menu
* ankh @* p::
* what @* is: ankh @* p.
* what @* is: ankh p.
@end menu
';


$result_texts{'end_of_line_command_in_node_lines'} = 'top
***

* chap 
 f     nl Something? 
 After punct::
* new n::

1 Chap
******


text 
 f     nl Something? 
 After punct



2 Ochap
*******

chap 
 f     nl Something? 
 After punct.

ankh 
 p.

ankh 
 p.

* ankh 
 p::
* what 
 is: ankh 
 p.
* what 
 is: ankh p.
';

$result_errors{'end_of_line_command_in_node_lines'} = '* W l32|@menu entry node name `ankh p\' different from anchor name `ankh @* p\'
 warning: @menu entry node name `ankh p\' different from anchor name `ankh @* p\'

';

$result_nodes_list{'end_of_line_command_in_node_lines'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chap @* f     nl Something? @* After punct
  new n
 node_directions:
  next->chap @* f     nl Something? @* After punct
2|chap @* f     nl Something? @* After punct
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  next->new n
  prev->Top
  up->Top
3|new n
 associated_section: 2 Ochap
 associated_title_command: 2 Ochap
 menus:
  ankh @* p
  ankh @* p
  ankh p
 node_directions:
  prev->chap @* f     nl Something? @* After punct
  up->Top
';

$result_sections_list{'end_of_line_command_in_node_lines'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
  2|Ochap
2|Chap
 associated_anchor_command: chap @* f     nl Something? @* After punct
 associated_node: chap @* f     nl Something? @* After punct
 section_directions:
  next->Ochap
  up->top
 toplevel_directions:
  next->Ochap
  prev->top
  up->top
3|Ochap
 associated_anchor_command: new n
 associated_node: new n
 section_directions:
  prev->Chap
  up->top
 toplevel_directions:
  prev->Chap
  up->top
';

$result_sectioning_root{'end_of_line_command_in_node_lines'} = 'level: -1
list:
 1|top
';

$result_headings_list{'end_of_line_command_in_node_lines'} = '';

$result_indices_sort_strings{'end_of_line_command_in_node_lines'} = 'cp:
 a 
 b
';

1;
