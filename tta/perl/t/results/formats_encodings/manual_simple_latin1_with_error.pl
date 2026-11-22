use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'manual_simple_latin1_with_error'} = '*document_root C6
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo.tex\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@documentencoding C1 manual_simple_latin1_with_error.texi:l3
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{iso-8859-1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:iso-8859-1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 manual_simple_latin1_with_error.texi:l5 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 manual_simple_latin1_with_error.texi:l6 {Testé}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Testé}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C2 manual_simple_latin1_with_error.texi:l8 {ésseulé}
 |EXTRA
 |identifier:{_00e9sseul_00e9}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ésseulé}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 manual_simple_latin1_with_error.texi:l10 {Chapitré}
 |EXTRA
 |identifier:{Chapitr_00e9}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapitré}
    {spaces_after_argument:\\n}
 *@chapter C4 manual_simple_latin1_with_error.texi:l11 {Chapitré}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapitré}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@value C1
   *brace_container C1
    {normal_text:non_connùe}
  {normal_text:\\n}
';


$result_texis{'manual_simple_latin1_with_error'} = '\\input texinfo.tex

@documentencoding iso-8859-1

@node Top
@top Testé

@node ésseulé

@node Chapitré
@chapter Chapitré

@value{non_connùe}
';


$result_texts{'manual_simple_latin1_with_error'} = '
Testé
*****


1 Chapitré
**********

non_connùe
';

$result_errors{'manual_simple_latin1_with_error'} = '* W manual_simple_latin1_with_error.texi:l13|undefined flag: non_connùe
 warning: undefined flag: non_connùe

* W manual_simple_latin1_with_error.texi:l8|node `ésseulé\' unreferenced
 warning: node `ésseulé\' unreferenced

';

$result_nodes_list{'manual_simple_latin1_with_error'} = '1|Top
 associated_section: Testé
 associated_title_command: Testé
 node_directions:
  next->Chapitré
2|ésseulé
3|Chapitré
 associated_section: 1 Chapitré
 associated_title_command: 1 Chapitré
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'manual_simple_latin1_with_error'} = '1|Testé
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapitré
 section_children:
  1|Chapitré
2|Chapitré
 associated_anchor_command: Chapitré
 associated_node: Chapitré
 section_directions:
  up->Testé
 toplevel_directions:
  prev->Testé
  up->Testé
';

$result_sectioning_root{'manual_simple_latin1_with_error'} = 'level: -1
list:
 1|Testé
';

$result_headings_list{'manual_simple_latin1_with_error'} = '';

1;
