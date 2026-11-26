use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multiple_lang_chapters_texi2html'} = '*document_root C13
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content C4
   *normal_command@documentencoding C1 l2
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{utf-8}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:utf-8}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*normal_command@iftex C3 l5
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:@documentlanguage ja\\n}
     >*normal_command@end C1 l7
     >|text_arg:{iftex}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:iftex}
       >{spaces_after_argument:\\n}
   >ignored_conditional_block<2>
    >*normal_command@iflatex C3 l8
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:@documentlanguage ja\\n}
     >*normal_command@end C1 l10
     >|text_arg:{iflatex}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:iflatex}
       >{spaces_after_argument:\\n}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:@node Top is ignored in TeX and LaTeX, so switch here}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l12 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C5 l13 {Multi language file}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Multi language file}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C7 l15
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l16
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter-ja}
     {normal_text:chapter ja}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l17
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter-en}
     {normal_text:chapter en}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l18
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter-fr_005fFR}
     {normal_text:chapter fr_FR}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l19
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter-de}
     {normal_text:chapter de}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l20
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter-pt_005fBR}
     {normal_text:chapter pt_BR}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l21
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l23
  |global_command_number:{1}
  |text_arg:{ja}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ja}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l24 {chapter ja}
 |identifier:{chapter-ja}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter ja}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 l25 {ja}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ja}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:In japanese. }
   *normal_command@xref C1 l27
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{chapter-ja}
     {normal_text:chapter ja}
   {normal_text:.\\n}
  *normal_command@defivar C2 l28
   *def_line C1 l28
   |def_command:{defivar}
   |documentlanguage:{ja}
   |element_node:{chapter-ja}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *untranslated_def_line_arg C1
      |documentlanguage:{ja}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:AAA}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:BBB}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:CCC}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l29
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l31
  |global_command_number:{2}
  |text_arg:{en}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:en}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l32 {chapter en}
 |identifier:{chapter-en}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter en}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 l33 {en}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:en}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:In english. }
   *normal_command@xref C1 l35
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{chapter-ja}
     {normal_text:chapter ja}
   {normal_text:.\\n}
  *normal_command@defivar C2 l36
   *def_line C1 l36
   |def_command:{defivar}
   |documentlanguage:{en}
   |element_node:{chapter-en}
   |index_entry:I{vr,2}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *untranslated_def_line_arg C1
      |documentlanguage:{en}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:AAA}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:BBB}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:CCC}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l37
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l39
  |global_command_number:{3}
  |text_arg:{fr_FR}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr_FR}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l40 {chapter fr_FR}
 |identifier:{chapter-fr_005fFR}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter fr_FR}
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 l41 {fr_FR}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr_FR}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defivar C2 l43
   *def_line C1 l43
   |def_command:{defivar}
   |documentlanguage:{fr_FR}
   |element_node:{chapter-fr_005fFR}
   |index_entry:I{vr,3}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *untranslated_def_line_arg C1
      |documentlanguage:{fr_FR}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:AAA}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:BBB}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:CCC}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l44
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l46
  |global_command_number:{4}
  |text_arg:{de}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:de}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l47 {chapter de}
 |identifier:{chapter-de}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter de}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l48 {de}
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:de}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l50
  |global_command_number:{5}
  |text_arg:{pt_BR}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:pt_BR}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l51 {chapter pt_BR}
 |identifier:{chapter-pt_005fBR}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter pt_BR}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l52 {pt_bR}
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:pt_bR}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:In brazilian. }
   *normal_command@xref C1 l54
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{chapter-ja}
     {normal_text:chapter ja}
   {normal_text:.\\n}
';


$result_texis{'multiple_lang_chapters_texi2html'} = '
@documentencoding utf-8

@c @node Top is ignored in TeX and LaTeX, so switch here

@node Top
@top Multi language file

@menu
* chapter ja::
* chapter en::
* chapter fr_FR::
* chapter de::
* chapter pt_BR::
@end menu

@documentlanguage ja
@node chapter ja
@chapter ja

In japanese. @xref{chapter ja}.
@defivar AAA BBB CCC
@end defivar

@documentlanguage en
@node chapter en
@chapter en

In english. @xref{chapter ja}.
@defivar AAA BBB CCC
@end defivar

@documentlanguage fr_FR
@node chapter fr_FR
@chapter fr_FR

@defivar AAA BBB CCC
@end defivar

@documentlanguage de
@node chapter de
@chapter de

@documentlanguage pt_BR
@node chapter pt_BR
@chapter pt_bR

In brazilian. @xref{chapter ja}.
';


$result_texts{'multiple_lang_chapters_texi2html'} = '

Multi language file
*******************

* chapter ja::
* chapter en::
* chapter fr_FR::
* chapter de::
* chapter pt_BR::

1 ja
****

In japanese. chapter ja.
Instance Variable of AAA: BBB CCC

2 en
****

In english. chapter ja.
Instance Variable of AAA: BBB CCC

3 fr_FR
*******

Variable d\'instance de AAA: BBB CCC

4 de
****

5 pt_bR
*******

In brazilian. chapter ja.
';

$result_errors{'multiple_lang_chapters_texi2html'} = '';

$result_nodes_list{'multiple_lang_chapters_texi2html'} = '1|Top
 associated_section: Multi language file
 associated_title_command: Multi language file
 menus:
  chapter ja
  chapter en
  chapter fr_FR
  chapter de
  chapter pt_BR
 node_directions:
  next->chapter ja
2|chapter ja
 associated_section: 1 ja
 associated_title_command: 1 ja
 node_directions:
  next->chapter en
  prev->Top
  up->Top
3|chapter en
 associated_section: 2 en
 associated_title_command: 2 en
 node_directions:
  next->chapter fr_FR
  prev->chapter ja
  up->Top
4|chapter fr_FR
 associated_section: 3 fr_FR
 associated_title_command: 3 fr_FR
 node_directions:
  next->chapter de
  prev->chapter en
  up->Top
5|chapter de
 associated_section: 4 de
 associated_title_command: 4 de
 node_directions:
  next->chapter pt_BR
  prev->chapter fr_FR
  up->Top
6|chapter pt_BR
 associated_section: 5 pt_bR
 associated_title_command: 5 pt_bR
 node_directions:
  prev->chapter de
  up->Top
';

$result_sections_list{'multiple_lang_chapters_texi2html'} = '1|Multi language file
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->ja
 section_children:
  1|ja
  2|en
  3|fr_FR
  4|de
  5|pt_bR
2|ja
 associated_anchor_command: chapter ja
 associated_node: chapter ja
 section_directions:
  next->en
  up->Multi language file
 toplevel_directions:
  next->en
  prev->Multi language file
  up->Multi language file
3|en
 associated_anchor_command: chapter en
 associated_node: chapter en
 section_directions:
  next->fr_FR
  prev->ja
  up->Multi language file
 toplevel_directions:
  next->fr_FR
  prev->ja
  up->Multi language file
4|fr_FR
 associated_anchor_command: chapter fr_FR
 associated_node: chapter fr_FR
 section_directions:
  next->de
  prev->en
  up->Multi language file
 toplevel_directions:
  next->de
  prev->en
  up->Multi language file
5|de
 associated_anchor_command: chapter de
 associated_node: chapter de
 section_directions:
  next->pt_bR
  prev->fr_FR
  up->Multi language file
 toplevel_directions:
  next->pt_bR
  prev->fr_FR
  up->Multi language file
6|pt_bR
 associated_anchor_command: chapter pt_BR
 associated_node: chapter pt_BR
 section_directions:
  prev->de
  up->Multi language file
 toplevel_directions:
  prev->de
  up->Multi language file
';

$result_sectioning_root{'multiple_lang_chapters_texi2html'} = 'level: -1
list:
 1|Multi language file
';

$result_headings_list{'multiple_lang_chapters_texi2html'} = '';

$result_indices_sort_strings{'multiple_lang_chapters_texi2html'} = 'vr:
 BBB de AAA
 BBB of AAA
 BBB of AAA
';

$result_converted_sort_strings{'file_html'}->{'multiple_lang_chapters_texi2html'} = 'vr:
 BBB de AAA
 BBB of AAA
 BBB of AAA
';

$result_converted_sort_strings{'file_info'}->{'multiple_lang_chapters_texi2html'} = 'vr:
 BBB de AAA
 BBB of AAA
 BBB of AAA
';

1;
