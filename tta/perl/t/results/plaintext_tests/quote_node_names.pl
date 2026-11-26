use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'quote_node_names'} = '*document_root C12
 *before_node_section C1
  *preamble
 *normal_command@node C1 nodequote.texi:l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C30 nodequote.texi:l2
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *normal_command@xref C2 nodequote.texi:l4
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{normal-node}
     {normal_text:normal node}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:the::caption and a word}
   {normal_text:\\n}
   *normal_command@xref C2 nodequote.texi:l5
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{normal-node}
     {normal_text:normal node}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:the::caption}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C4
   *normal_command@xref C2 nodequote.texi:l7
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{blah_003ablah}
     {normal_text:blah:blah}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:the::caption and a word}
   {normal_text:\\n}
   *normal_command@xref C2 nodequote.texi:l8
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{blah_003ablah}
     {normal_text:blah:blah}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:the::caption}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C4
   *normal_command@xref C2 nodequote.texi:l10
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{blumpty_002efump}
     {normal_text:blumpty.fump}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:the::caption and a word}
   {normal_text:\\n}
   *normal_command@xref C2 nodequote.texi:l11
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{blumpty_002efump}
     {normal_text:blumpty.fump}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:the::caption}
   {normal_text:.mrmrmrmmrmrmr\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 nodequote.texi:l13
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{blah_003ablah}
     {normal_text:blah:blah}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 nodequote.texi:l15
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{secret_002cnode}
     *normal_command@asis C1 nodequote.texi:l15
      *brace_container C1
       {normal_text:secret,node}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA }
   *normal_command@xref C1 nodequote.texi:l17
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{blah_003ablah}
     {normal_text:blah:blah}
   {normal_text:.)\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C5 nodequote.texi:l19
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:x:y::z}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:man_ual}
    *brace_arg C1
     {normal_text:Book Title}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C5 nodequote.texi:l21
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:x.y.z}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:man_ual}
    *brace_arg C1
     {normal_text:Book Title}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C5 nodequote.texi:l23
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:pp:qq::rr}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:label}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:man_ual}
    *brace_arg C1
     {normal_text:Book Title}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C5 nodequote.texi:l25
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:pp:qq.rr}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:label}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:man_ual}
    *brace_arg C1
     {normal_text:Book Title}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C5 nodequote.texi:l27
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:ext}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:label}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:man:u.al}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:Book Title}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C5 nodequote.texi:l29
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:e:x.t}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:label}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:man:u.al}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:Book Title}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C5 nodequote.texi:l31
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:ext}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:la:bel}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:man:u.al}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:Book Title}
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@menu C8 nodequote.texi:l33
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 nodequote.texi:l34
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |node_content:A{0|2}
    |normalized:{blah_003ablah}
     {normal_text:blah}
     *normal_command@asis C1 nodequote.texi:l34
      *brace_container C1
       {normal_text::}
     {normal_text:blah}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C6 nodequote.texi:l35
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {normal_text:the topic}
    {menu_entry_separator::}
    *menu_entry_node C3
    |node_content:A{0|2}
    |normalized:{blumpty_002efump}
     {normal_text:blumpty}
     *normal_command@asis C1 nodequote.texi:l35
      *brace_container C1
       {normal_text:.}
     {normal_text:fump}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 nodequote.texi:l36
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{normal-node}
     {normal_text:normal node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C6 nodequote.texi:l37
    {menu_entry_leading_text:* }
    *menu_entry_name C3
     {normal_text:funny}
     *normal_command@asis C1 nodequote.texi:l37
      *brace_container C1
       {normal_text::}
     {normal_text:label}
    {menu_entry_separator::}
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{secret_002cnode}
     *normal_command@asis C1 nodequote.texi:l37
      *brace_container C1
       {normal_text:secret,node}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C5 nodequote.texi:l38
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {normal_text:(man}
    {menu_entry_separator::}
    *menu_entry_node C2
    |node_content:A{0|1}
    |normalized:{u_002eal_0029ext_003a_003a}
     {normal_text:u.al)ext::}
     {space_at_end_menu_node:\\n}
    *menu_entry_description
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *normal_command@end C1 nodequote.texi:l40
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 nodequote.texi:l42 {blah:blah}
 |identifier:{blah_003ablah}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:blah:blah}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 nodequote.texi:l43 {blah:blah}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:blah:blah}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:stuff here.\\n}
  {empty_line:\\n}
 *normal_command@node C1 nodequote.texi:l47 {blumpty.fump}
 |identifier:{blumpty_002efump}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:blumpty.fump}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 nodequote.texi:l48 {blumpty.fump}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:blumpty.fump}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 nodequote.texi:l50 {normal node}
 |identifier:{normal-node}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:normal node}
   *line_arg C7
   |manual_content:A{2|4}
   |node_content:A{6|6}
   |normalized:{direction}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:man}
    *normal_command@comma C1 nodequote.texi:l50
     *brace_container
    {normal_text:u:a.l}
    {normal_text:)}
    {normal_text:direction}
   *line_arg C7
   |manual_content:A{2|2}
   |node_content:A{4|6}
   |normalized:{direct_002cion}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:man_ual}
    {normal_text:)}
    {normal_text:direct}
    *normal_command@comma C1 nodequote.texi:l50
     *brace_container
    {normal_text:ion}
   *line_arg C6
   |manual_content:A{2|2}
   |node_content:A{4|4}
   |normalized:{direct_003a_003ai_002eon}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:man_ual}
    {normal_text:)}
    {normal_text:direct::i.on}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 nodequote.texi:l51 {normal node}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:normal node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 nodequote.texi:l53 {@asis{secret,node}}
 |identifier:{secret_002cnode}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@asis C1 nodequote.texi:l53
     *brace_container C1
      {normal_text:secret,node}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 nodequote.texi:l54 {@asis{secret,node}}
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@asis C1 nodequote.texi:l54
     *brace_container C1
      {normal_text:secret,node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C3 nodequote.texi:l56 {top secret node}
 |identifier:{top-secret-node}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top secret node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:stuff here.\\n}
';


$result_texis{'quote_node_names'} = '@node Top
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


$result_texts{'quote_node_names'} = '
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

$result_errors{'quote_node_names'} = '* W nodequote.texi:l36|node prev pointer for `normal node\' is `(man_ual)direct@comma{}ion\' but prev is `blumpty.fump\' in menu
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

$result_nodes_list{'quote_node_names'} = '1|Top
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

$result_sections_list{'quote_node_names'} = '1
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

$result_sectioning_root{'quote_node_names'} = 'level: -1
list:
 1|
';

$result_headings_list{'quote_node_names'} = '';

1;
