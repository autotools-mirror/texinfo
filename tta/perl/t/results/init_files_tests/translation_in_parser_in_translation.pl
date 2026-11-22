use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'translation_in_parser_in_translation'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@documentlanguage C1 l1
   |EXTRA
   |global_command_number:{1}
   |text_arg:{fr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:fr}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 l4 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l6 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *@chapter C4 l7 {Chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C3 l9
   *def_line C1 l9
   |EXTRA
   |def_command:{deftypeop}
   |documentlanguage:{fr}
   |element_node:{chap}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:da}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:db}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:dc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:dd}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:de}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:DOC\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'translation_in_parser_in_translation'} = '@documentlanguage fr

@node Top
@top top

@node chap
@chapter Chap

@deftypeop da db dc dd de
DOC
@end deftypeop

';


$result_texts{'translation_in_parser_in_translation'} = '
top
***

1 Chap
******

da de db: dc dd de
DOC

';

$result_errors{'translation_in_parser_in_translation'} = '';

$result_nodes_list{'translation_in_parser_in_translation'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'translation_in_parser_in_translation'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'translation_in_parser_in_translation'} = 'level: -1
list:
 1|top
';

$result_headings_list{'translation_in_parser_in_translation'} = '';

$result_indices_sort_strings{'translation_in_parser_in_translation'} = 'fn:
 dd de db
';

$result_converted_sort_strings{'file_html'}->{'translation_in_parser_in_translation'} = 'fn:
 m on n: o p q r
CC dd


Method on s: t u v w x
DD db

 entry



';

1;
