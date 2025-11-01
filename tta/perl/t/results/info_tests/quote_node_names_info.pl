use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'quote_node_names_info'} = '*document_root C12
 *before_node_section C1
  *preamble_before_content
 *@node C1 nodequote.texi:l1 {Top}
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
 *@top C30 nodequote.texi:l2
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@xref C2 nodequote.texi:l4
    *brace_arg C1
    |EXTRA
    |node_content:{normal node}
    |normalized:{normal-node}
     {normal node}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {the::caption and a word}
   {\\n}
   *@xref C2 nodequote.texi:l5
    *brace_arg C1
    |EXTRA
    |node_content:{normal node}
    |normalized:{normal-node}
     {normal node}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {the::caption}
   {\\n}
  {empty_line:\\n}
  *paragraph C4
   *@xref C2 nodequote.texi:l7
    *brace_arg C1
    |EXTRA
    |node_content:{blah:blah}
    |normalized:{blah_003ablah}
     {blah:blah}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {the::caption and a word}
   {\\n}
   *@xref C2 nodequote.texi:l8
    *brace_arg C1
    |EXTRA
    |node_content:{blah:blah}
    |normalized:{blah_003ablah}
     {blah:blah}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {the::caption}
   {\\n}
  {empty_line:\\n}
  *paragraph C4
   *@xref C2 nodequote.texi:l10
    *brace_arg C1
    |EXTRA
    |node_content:{blumpty.fump}
    |normalized:{blumpty_002efump}
     {blumpty.fump}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {the::caption and a word}
   {\\n}
   *@xref C2 nodequote.texi:l11
    *brace_arg C1
    |EXTRA
    |node_content:{blumpty.fump}
    |normalized:{blumpty_002efump}
     {blumpty.fump}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {the::caption}
   {.mrmrmrmmrmrmr\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 nodequote.texi:l13
    *brace_arg C1
    |EXTRA
    |node_content:{blah:blah}
    |normalized:{blah_003ablah}
     {blah:blah}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 nodequote.texi:l15
    *brace_arg C1
    |EXTRA
    |node_content:{@asis{secret,node}}
    |normalized:{secret_002cnode}
     *@asis C1 nodequote.texi:l15
      *brace_container C1
       {secret,node}
   {.\\n}
  {empty_line:\\n}
  *paragraph C3
   {AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA }
   *@xref C1 nodequote.texi:l17
    *brace_arg C1
    |EXTRA
    |node_content:{blah:blah}
    |normalized:{blah_003ablah}
     {blah:blah}
   {.)\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C5 nodequote.texi:l19
    *brace_arg C1
    |EXTRA
    |node_content:{x:y::z}
     {x:y::z}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {man_ual}
    *brace_arg C1
     {Book Title}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C5 nodequote.texi:l21
    *brace_arg C1
    |EXTRA
    |node_content:{x.y.z}
     {x.y.z}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {man_ual}
    *brace_arg C1
     {Book Title}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C5 nodequote.texi:l23
    *brace_arg C1
    |EXTRA
    |node_content:{pp:qq::rr}
     {pp:qq::rr}
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {label}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {man_ual}
    *brace_arg C1
     {Book Title}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C5 nodequote.texi:l25
    *brace_arg C1
    |EXTRA
    |node_content:{pp:qq.rr}
     {pp:qq.rr}
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {label}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {man_ual}
    *brace_arg C1
     {Book Title}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C5 nodequote.texi:l27
    *brace_arg C1
    |EXTRA
    |node_content:{ext}
     {ext}
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {label}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {man:u.al}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Book Title}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C5 nodequote.texi:l29
    *brace_arg C1
    |EXTRA
    |node_content:{e:x.t}
     {e:x.t}
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {label}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {man:u.al}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Book Title}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C5 nodequote.texi:l31
    *brace_arg C1
    |EXTRA
    |node_content:{ext}
     {ext}
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {la:bel}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {man:u.al}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {Book Title}
   {.\\n}
  {empty_line:\\n}
  *@menu C8 nodequote.texi:l33
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 nodequote.texi:l34
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:{blah@asis{:}blah}
    |normalized:{blah_003ablah}
     {blah}
     *@asis C1 nodequote.texi:l34
      *brace_container C1
       {:}
     {blah}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 nodequote.texi:l35
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {the topic}
    {menu_entry_separator::}
    *menu_entry_node C3
    |EXTRA
    |node_content:{blumpty@asis{.}fump}
    |normalized:{blumpty_002efump}
     {blumpty}
     *@asis C1 nodequote.texi:l35
      *brace_container C1
       {.}
     {fump}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 nodequote.texi:l36
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{normal node}
    |normalized:{normal-node}
     {normal node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 nodequote.texi:l37
    {menu_entry_leading_text:* }
    *menu_entry_name C3
     {funny}
     *@asis C1 nodequote.texi:l37
      *brace_container C1
       {:}
     {label}
    {menu_entry_separator::}
    *menu_entry_node C1
    |EXTRA
    |node_content:{@asis{secret,node}}
    |normalized:{secret_002cnode}
     *@asis C1 nodequote.texi:l37
      *brace_container C1
       {secret,node}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C5 nodequote.texi:l38
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {(man}
    {menu_entry_separator::}
    *menu_entry_node C2
    |EXTRA
    |node_content:{u.al)ext::\\n}
    |normalized:{u_002eal_0029ext_003a_003a}
     {u.al)ext::}
     {space_at_end_menu_node:\\n}
    *menu_entry_description
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@end C1 nodequote.texi:l40
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
 *@node C1 nodequote.texi:l42 {blah:blah}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{blah_003ablah}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {blah:blah}
 *@chapter C4 nodequote.texi:l43 {blah:blah}
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
    {blah:blah}
  {empty_line:\\n}
  *paragraph C1
   {stuff here.\\n}
  {empty_line:\\n}
 *@node C1 nodequote.texi:l47 {blumpty.fump}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{blumpty_002efump}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {blumpty.fump}
 *@chapter C2 nodequote.texi:l48 {blumpty.fump}
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
    {blumpty.fump}
  {empty_line:\\n}
 *@node C1 nodequote.texi:l50 {normal node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{normal-node}
  *arguments_line C4
   *line_arg C1
    {normal node}
   *line_arg C6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{man@comma{}u:a.l}
   |node_content:{direction}
   |normalized:{direction}
    {(}
    {man}
    *@comma C1 nodequote.texi:l50
     *brace_container
    {u:a.l}
    {)}
    {direction}
   *line_arg C6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{man_ual}
   |node_content:{direct@comma{}ion}
   |normalized:{direct_002cion}
    {(}
    {man_ual}
    {)}
    {direct}
    *@comma C1 nodequote.texi:l50
     *brace_container
    {ion}
   *line_arg C4
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |manual_content:{man_ual}
   |node_content:{direct::i.on}
   |normalized:{direct_003a_003ai_002eon}
    {(}
    {man_ual}
    {)}
    {direct::i.on}
 *@chapter C2 nodequote.texi:l51 {normal node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {normal node}
  {empty_line:\\n}
 *@node C1 nodequote.texi:l53 {@asis{secret,node}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{secret_002cnode}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@asis C1 nodequote.texi:l53
     *brace_container C1
      {secret,node}
 *@chapter C2 nodequote.texi:l54 {@asis{secret,node}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@asis C1 nodequote.texi:l54
     *brace_container C1
      {secret,node}
  {empty_line:\\n}
 *@node C3 nodequote.texi:l56 {top secret node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{top-secret-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top secret node}
  {empty_line:\\n}
  *paragraph C1
   {stuff here.\\n}
';


$result_texis{'quote_node_names_info'} = '@node Top
@top

@xref{normal node, the::caption and a word}
@xref{normal node, the::caption}

@xref{blah:blah, the::caption and a word}
@xref{blah:blah, the::caption}

@xref{blumpty.fump, the::caption and a word}
@xref{blumpty.fump, the::caption}.mrmrmrmmrmrmr

@xref{blah:blah}.

@xref{@asis{secret,node}}.

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA @xref{blah:blah}.)

@xref{x:y::z,,,man_ual,Book Title}.

@xref{x.y.z,,,man_ual,Book Title}.

@xref{pp:qq::rr,, label, man_ual,Book Title}.

@xref{pp:qq.rr,, label, man_ual,Book Title}.

@xref{ext,, label, man:u.al, Book Title}.

@xref{e:x.t,, label, man:u.al, Book Title}.

@xref{ext,, la:bel, man:u.al, Book Title}.

@menu
* blah@asis{:}blah::
* the topic:blumpty@asis{.}fump.
* normal node::
* funny@asis{:}label:@asis{secret,node}.
* (man:u.al)ext::

@end menu

@node blah:blah
@chapter blah:blah

stuff here.

@node blumpty.fump
@chapter blumpty.fump

@node normal node, (man@comma{}u:a.l)direction, (man_ual)direct@comma{}ion, (man_ual)direct::i.on
@chapter normal node

@node @asis{secret,node}
@chapter @asis{secret,node}

@node top secret node

stuff here.
';


$result_texts{'quote_node_names_info'} = '
normal node
normal node

blah:blah
blah:blah

blumpty.fump
blumpty.fump.mrmrmrmmrmrmr

blah:blah.

secret,node.

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA blah:blah.)

x:y::z.

x.y.z.

pp:qq::rr.

pp:qq.rr.

ext.

e:x.t.

ext.

* blah:blah::
* the topic:blumpty.fump.
* normal node::
* funny:label:secret,node.
* (man:u.al)ext::


1 blah:blah
***********

stuff here.

2 blumpty.fump
**************

3 normal node
*************

4 secret,node
*************


stuff here.
';

$result_errors{'quote_node_names_info'} = '* W nodequote.texi:l36|node up pointer for `normal node\' is `(man_ual)direct::i.on\' but up is `Top\' in menu
 warning: node up pointer for `normal node\' is `(man_ual)direct::i.on\' but up is `Top\' in menu

* W nodequote.texi:l36|node prev pointer for `normal node\' is `(man_ual)direct@comma{}ion\' but prev is `blumpty.fump\' in menu
 warning: node prev pointer for `normal node\' is `(man_ual)direct@comma{}ion\' but prev is `blumpty.fump\' in menu

* W nodequote.texi:l37|node next pointer for `normal node\' is `(man@comma{}u:a.l)direction\' but next is `@asis{secret,node}\' in menu
 warning: node next pointer for `normal node\' is `(man@comma{}u:a.l)direction\' but next is `@asis{secret,node}\' in menu

* W nodequote.texi:l34|@menu entry node name `blah@asis{:}blah\' different from node name `blah:blah\'
 warning: @menu entry node name `blah@asis{:}blah\' different from node name `blah:blah\'

* W nodequote.texi:l35|@menu entry node name `blumpty@asis{.}fump\' different from node name `blumpty.fump\'
 warning: @menu entry node name `blumpty@asis{.}fump\' different from node name `blumpty.fump\'

* E nodequote.texi:l38|@menu reference to nonexistent node `u.al)ext::
\'
 @menu reference to nonexistent node `u.al)ext::
\'

* W nodequote.texi:l56|node `top secret node\' unreferenced
 warning: node `top secret node\' unreferenced

';

$result_nodes_list{'quote_node_names_info'} = '1|Top
 associated_section
 associated_title_command
 menus:
  blah@asis{:}blah
  blumpty@asis{.}fump
  normal node
  @asis{secret,node}
  u.al)ext::

 node_directions:
  next->blah:blah
2|blah:blah
 associated_section: 1 blah:blah
 associated_title_command: 1 blah:blah
 node_directions:
  next->blumpty.fump
  prev->Top
  up->Top
3|blumpty.fump
 associated_section: 2 blumpty.fump
 associated_title_command: 2 blumpty.fump
 node_directions:
  next->normal node
  prev->blah:blah
  up->Top
4|normal node
 associated_section: 3 normal node
 associated_title_command: 3 normal node
 node_directions:
  next-> (man@comma{}u:a.l)direction
  prev-> (man_ual)direct@comma{}ion
  up-> (man_ual)direct::i.on

5|@asis{secret,node}
 associated_section: 4 @asis{secret,node}
 associated_title_command: 4 @asis{secret,node}
 node_directions:
  prev->normal node
  up->Top
6|top secret node
';

$result_sections_list{'quote_node_names_info'} = '1
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->blah:blah
 section_children:
  1|blah:blah
  2|blumpty.fump
  3|normal node
  4|@asis{secret,node}
2|blah:blah
 associated_anchor_command: blah:blah
 associated_node: blah:blah
 section_directions:
  next->blumpty.fump
  up->
 toplevel_directions:
  next->blumpty.fump
  prev->
  up->
3|blumpty.fump
 associated_anchor_command: blumpty.fump
 associated_node: blumpty.fump
 section_directions:
  next->normal node
  prev->blah:blah
  up->
 toplevel_directions:
  next->normal node
  prev->blah:blah
  up->
4|normal node
 associated_anchor_command: normal node
 associated_node: normal node
 section_directions:
  next->@asis{secret,node}
  prev->blumpty.fump
  up->
 toplevel_directions:
  next->@asis{secret,node}
  prev->blumpty.fump
  up->
5|@asis{secret,node}
 associated_anchor_command: @asis{secret,node}
 associated_node: @asis{secret,node}
 section_directions:
  prev->normal node
  up->
 toplevel_directions:
  prev->normal node
  up->
';

$result_sectioning_root{'quote_node_names_info'} = 'level: -1
list:
 1|
';

$result_headings_list{'quote_node_names_info'} = '';

$result_converted_errors{'file_info'}->{'quote_node_names_info'} = '* W nodequote.texi:l4|`.\' or `,\' must follow @xref
 warning: `.\' or `,\' must follow @xref

* W nodequote.texi:l5|`.\' or `,\' must follow @xref
 warning: `.\' or `,\' must follow @xref

* W nodequote.texi:l7|`.\' or `,\' must follow @xref
 warning: `.\' or `,\' must follow @xref

* W nodequote.texi:l8|`.\' or `,\' must follow @xref
 warning: `.\' or `,\' must follow @xref

* W nodequote.texi:l10|`.\' or `,\' must follow @xref
 warning: `.\' or `,\' must follow @xref

';

1;
