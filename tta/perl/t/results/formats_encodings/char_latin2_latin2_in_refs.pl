use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'char_latin2_latin2_in_refs'} = '*document_root C6
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@documentencoding C1 char_latin2_latin2_in_refs.texi:l3
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-2}
   |text_arg:{ISO-8859-2}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ISO-8859-2}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 char_latin2_latin2_in_refs.texi:l5 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |isindex:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C9 char_latin2_latin2_in_refs.texi:l6 {char latin2 latin2 in refs}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:char latin2 latin2 in refs}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 char_latin2_latin2_in_refs.texi:l8
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0104-_0105-_0118-_0119}
     {normal_text:Ą ą Ę ę}
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 char_latin2_latin2_in_refs.texi:l10
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:Aogonek(0xa1=0241) aogonek(0xb1=0261) Eogonek(0xea=0352) eogonek}
    {spaces_after_argument:\\n}
  *normal_command@menu C3 char_latin2_latin2_in_refs.texi:l13
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 char_latin2_latin2_in_refs.texi:l14
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0104-_0105-_0118-_0119}
     {normal_text:Ą ą Ę ę}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 char_latin2_latin2_in_refs.texi:l15
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 char_latin2_latin2_in_refs.texi:l17 {Ą ą Ę ę}
 |EXTRA
 |identifier:{_0104-_0105-_0118-_0119}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Ą ą Ę ę}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 char_latin2_latin2_in_refs.texi:l18 {Ą ą Ę ę}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Ą ą Ę ę}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 char_latin2_latin2_in_refs.texi:l20
  |EXTRA
  |element_node:{_0104-_0105-_0118-_0119}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Ą ą Ę ę}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'char_latin2_latin2_in_refs'} = '\\input texinfo

@documentencoding ISO-8859-2

@node Top
@top char latin2 latin2 in refs

@ref{Ą ą Ę ę}.

@printindex cp

@c Aogonek(0xa1=0241) aogonek(0xb1=0261) Eogonek(0xea=0352) eogonek
@menu
* Ą ą Ę ę::
@end menu

@node Ą ą Ę ę
@chapter Ą ą Ę ę

@cindex Ą ą Ę ę

@bye
';


$result_texts{'char_latin2_latin2_in_refs'} = '
char latin2 latin2 in refs
**************************

Ą ą Ę ę.


* Ą ą Ę ę::

1 Ą ą Ę ę
*********


';

$result_errors{'char_latin2_latin2_in_refs'} = '';

$result_nodes_list{'char_latin2_latin2_in_refs'} = '1|Top
 associated_section: char latin2 latin2 in refs
 associated_title_command: char latin2 latin2 in refs
 menus:
  Ą ą Ę ę
 node_directions:
  next->Ą ą Ę ę
2|Ą ą Ę ę
 associated_section: 1 Ą ą Ę ę
 associated_title_command: 1 Ą ą Ę ę
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'char_latin2_latin2_in_refs'} = '1|char latin2 latin2 in refs
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Ą ą Ę ę
 section_children:
  1|Ą ą Ę ę
2|Ą ą Ę ę
 associated_anchor_command: Ą ą Ę ę
 associated_node: Ą ą Ę ę
 section_directions:
  up->char latin2 latin2 in refs
 toplevel_directions:
  prev->char latin2 latin2 in refs
  up->char latin2 latin2 in refs
';

$result_sectioning_root{'char_latin2_latin2_in_refs'} = 'level: -1
list:
 1|char latin2 latin2 in refs
';

$result_headings_list{'char_latin2_latin2_in_refs'} = '';

$result_indices_sort_strings{'char_latin2_latin2_in_refs'} = 'cp:
 Ą ą Ę ę
';

$result_converted_sort_strings{'file_html'}->{'char_latin2_latin2_in_refs'} = 'cp:
 Ą ą Ę ę
';

$result_converted_sort_strings{'file_info'}->{'char_latin2_latin2_in_refs'} = 'cp:
 Ą ą Ę ę
';

1;
