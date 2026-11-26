use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'char_us_ascii_latin1_in_refs_no_translit_files'} = '*document_root C14
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo\\n}
   {empty_line:\\n}
  *preamble_before_content C2
   *normal_command@documentencoding C1 char_us_ascii_latin1_in_refs.texi:l3
   |global_command_number:{1}
   |input_encoding_name:{us-ascii}
   |text_arg:{US-ASCII}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:US-ASCII}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 char_us_ascii_latin1_in_refs.texi:l5 {Top}
 |identifier:{Top}
 |is_target:{1}
 |isindex:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C6 char_us_ascii_latin1_in_refs.texi:l6 {accented char in latin1 in refs}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:accented char in latin1 in refs}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 char_us_ascii_latin1_in_refs.texi:l8
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C7 char_us_ascii_latin1_in_refs.texi:l10
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 char_us_ascii_latin1_in_refs.texi:l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{_00e4-_00eb-_00ef-_00f6-_00fc-_00ff-_00c4-_00cb-_00cf-_00d6-_00dc}
     {normal_text:ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 char_us_ascii_latin1_in_refs.texi:l12
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{_00e9}
     {normal_text:é}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 char_us_ascii_latin1_in_refs.texi:l13
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{_00e0-_00e8-_00f9}
     {normal_text:à è ù}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 char_us_ascii_latin1_in_refs.texi:l14
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{_00e2-_00ea-_00ee-_00f4-_00fb-_00c2-_00ca-_00ce-_00d4-_00db}
     {normal_text:â ê î ô û Â Ê Î Ô Û}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 char_us_ascii_latin1_in_refs.texi:l15
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{_00e7}
     {normal_text:ç}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 char_us_ascii_latin1_in_refs.texi:l16
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 char_us_ascii_latin1_in_refs.texi:l18 {ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
 |identifier:{_00e4-_00eb-_00ef-_00f6-_00fc-_00ff-_00c4-_00cb-_00cf-_00d6-_00dc}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 char_us_ascii_latin1_in_refs.texi:l19 {ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 char_us_ascii_latin1_in_refs.texi:l21 {é}
 |identifier:{_00e9}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:é}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 char_us_ascii_latin1_in_refs.texi:l22 {é}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:é}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 char_us_ascii_latin1_in_refs.texi:l24 {à è ù}
 |identifier:{_00e0-_00e8-_00f9}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:à è ù}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 char_us_ascii_latin1_in_refs.texi:l25 {à è ù}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:à è ù}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 char_us_ascii_latin1_in_refs.texi:l27 {â ê î ô û Â Ê Î Ô Û}
 |identifier:{_00e2-_00ea-_00ee-_00f4-_00fb-_00c2-_00ca-_00ce-_00d4-_00db}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:â ê î ô û Â Ê Î Ô Û}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 char_us_ascii_latin1_in_refs.texi:l28 {â ê î ô û Â Ê Î Ô Û}
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:â ê î ô û Â Ê Î Ô Û}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 char_us_ascii_latin1_in_refs.texi:l30 {ç}
 |identifier:{_00e7}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ç}
    {spaces_after_argument:\\n}
 *normal_command@chapter C11 char_us_ascii_latin1_in_refs.texi:l31 {ç}
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ç}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C10
   *normal_command@ref C1 char_us_ascii_latin1_in_refs.texi:l33
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{_00e4-_00eb-_00ef-_00f6-_00fc-_00ff-_00c4-_00cb-_00cf-_00d6-_00dc}
     {normal_text:ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
   {normal_text:\\n}
   *normal_command@ref C1 char_us_ascii_latin1_in_refs.texi:l34
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{_00e9}
     {normal_text:é}
   {normal_text:\\n}
   *normal_command@ref C1 char_us_ascii_latin1_in_refs.texi:l35
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{_00e0-_00e8-_00f9}
     {normal_text:à è ù}
   {normal_text:\\n}
   *normal_command@ref C1 char_us_ascii_latin1_in_refs.texi:l36
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{_00e2-_00ea-_00ee-_00f4-_00fb-_00c2-_00ca-_00ce-_00d4-_00db}
     {normal_text:â ê î ô û Â Ê Î Ô Û}
   {normal_text:\\n}
   *normal_command@ref C1 char_us_ascii_latin1_in_refs.texi:l37
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{_00e7}
     {normal_text:ç}
   {normal_text:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 char_us_ascii_latin1_in_refs.texi:l39
  |element_node:{_00e7}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ä ë ï ö ü ÿ}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 char_us_ascii_latin1_in_refs.texi:l40
  |element_node:{_00e7}
  |index_entry:I{cp,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Ä Ë Ï Ö Ü}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 char_us_ascii_latin1_in_refs.texi:l41
  |element_node:{_00e7}
  |index_entry:I{cp,3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:é}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 char_us_ascii_latin1_in_refs.texi:l42
  |element_node:{_00e7}
  |index_entry:I{cp,4}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:è}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 char_us_ascii_latin1_in_refs.texi:l43
  |element_node:{_00e7}
  |index_entry:I{cp,5}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:â ê î ô û Â Ê Î Ô Û}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 char_us_ascii_latin1_in_refs.texi:l44
  |element_node:{_00e7}
  |index_entry:I{cp,6}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ç}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'char_us_ascii_latin1_in_refs_no_translit_files'} = '\\input texinfo

@documentencoding US-ASCII

@node Top
@top accented char in latin1 in refs

@printindex cp

@menu
* ä ë ï ö ü ÿ Ä Ë Ï Ö Ü::
* é::
* à è ù::
* â ê î ô û Â Ê Î Ô Û::
* ç::
@end menu

@node ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
@chapter ä ë ï ö ü ÿ Ä Ë Ï Ö Ü

@node é
@chapter é

@node à è ù
@chapter à è ù

@node â ê î ô û Â Ê Î Ô Û
@chapter â ê î ô û Â Ê Î Ô Û

@node ç
@chapter ç

@ref{ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
@ref{é}
@ref{à è ù}
@ref{â ê î ô û Â Ê Î Ô Û}
@ref{ç}

@cindex ä ë ï ö ü ÿ
@cindex Ä Ë Ï Ö Ü
@cindex é
@cindex è
@cindex â ê î ô û Â Ê Î Ô Û
@cindex ç

@bye
';


$result_texts{'char_us_ascii_latin1_in_refs_no_translit_files'} = '
accented char in latin1 in refs
*******************************


* ä ë ï ö ü ÿ Ä Ë Ï Ö Ü::
* é::
* à è ù::
* â ê î ô û Â Ê Î Ô Û::
* ç::

1 ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
***********************

2 é
***

3 à è ù
*******

4 â ê î ô û Â Ê Î Ô Û
*********************

5 ç
***

ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
é
à è ù
â ê î ô û Â Ê Î Ô Û
ç


';

$result_errors{'char_us_ascii_latin1_in_refs_no_translit_files'} = '';

$result_nodes_list{'char_us_ascii_latin1_in_refs_no_translit_files'} = '1|Top
 associated_section: accented char in latin1 in refs
 associated_title_command: accented char in latin1 in refs
 menus:
  ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
  é
  à è ù
  â ê î ô û Â Ê Î Ô Û
  ç
 node_directions:
  next->ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
2|ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 associated_section: 1 ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 associated_title_command: 1 ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 node_directions:
  next->é
  prev->Top
  up->Top
3|é
 associated_section: 2 é
 associated_title_command: 2 é
 node_directions:
  next->à è ù
  prev->ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
  up->Top
4|à è ù
 associated_section: 3 à è ù
 associated_title_command: 3 à è ù
 node_directions:
  next->â ê î ô û Â Ê Î Ô Û
  prev->é
  up->Top
5|â ê î ô û Â Ê Î Ô Û
 associated_section: 4 â ê î ô û Â Ê Î Ô Û
 associated_title_command: 4 â ê î ô û Â Ê Î Ô Û
 node_directions:
  next->ç
  prev->à è ù
  up->Top
6|ç
 associated_section: 5 ç
 associated_title_command: 5 ç
 node_directions:
  prev->â ê î ô û Â Ê Î Ô Û
  up->Top
';

$result_sections_list{'char_us_ascii_latin1_in_refs_no_translit_files'} = '1|accented char in latin1 in refs
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 section_children:
  1|ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
  2|é
  3|à è ù
  4|â ê î ô û Â Ê Î Ô Û
  5|ç
2|ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 associated_anchor_command: ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 associated_node: ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 section_directions:
  next->é
  up->accented char in latin1 in refs
 toplevel_directions:
  next->é
  prev->accented char in latin1 in refs
  up->accented char in latin1 in refs
3|é
 associated_anchor_command: é
 associated_node: é
 section_directions:
  next->à è ù
  prev->ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
  up->accented char in latin1 in refs
 toplevel_directions:
  next->à è ù
  prev->ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
  up->accented char in latin1 in refs
4|à è ù
 associated_anchor_command: à è ù
 associated_node: à è ù
 section_directions:
  next->â ê î ô û Â Ê Î Ô Û
  prev->é
  up->accented char in latin1 in refs
 toplevel_directions:
  next->â ê î ô û Â Ê Î Ô Û
  prev->é
  up->accented char in latin1 in refs
5|â ê î ô û Â Ê Î Ô Û
 associated_anchor_command: â ê î ô û Â Ê Î Ô Û
 associated_node: â ê î ô û Â Ê Î Ô Û
 section_directions:
  next->ç
  prev->à è ù
  up->accented char in latin1 in refs
 toplevel_directions:
  next->ç
  prev->à è ù
  up->accented char in latin1 in refs
6|ç
 associated_anchor_command: ç
 associated_node: ç
 section_directions:
  prev->â ê î ô û Â Ê Î Ô Û
  up->accented char in latin1 in refs
 toplevel_directions:
  prev->â ê î ô û Â Ê Î Ô Û
  up->accented char in latin1 in refs
';

$result_sectioning_root{'char_us_ascii_latin1_in_refs_no_translit_files'} = 'level: -1
list:
 1|accented char in latin1 in refs
';

$result_headings_list{'char_us_ascii_latin1_in_refs_no_translit_files'} = '';

$result_indices_sort_strings{'char_us_ascii_latin1_in_refs_no_translit_files'} = 'cp:
 Ä Ë Ï Ö Ü
 â ê î ô û Â Ê Î Ô Û
 ä ë ï ö ü ÿ
 ç
 é
 è
';

$result_converted_sort_strings{'file_html'}->{'char_us_ascii_latin1_in_refs_no_translit_files'} = 'cp:
 Ä Ë Ï Ö Ü
 â ê î ô û Â Ê Î Ô Û
 ä ë ï ö ü ÿ
 ç
 é
 è
';

$result_converted_sort_strings{'file_info'}->{'char_us_ascii_latin1_in_refs_no_translit_files'} = 'cp:
 Ä Ë Ï Ö Ü
 â ê î ô û Â Ê Î Ô Û
 ä ë ï ö ü ÿ
 ç
 é
 è
';

1;
