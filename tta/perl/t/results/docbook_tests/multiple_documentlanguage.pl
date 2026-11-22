use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multiple_documentlanguage'} = '*document_root C11
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@documentlanguage C1 l1
   |EXTRA
   |global_command_number:{1}
   |text_arg:{ja}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ja}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l4 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l7 {Chap no new language}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap no new language}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l9
  |EXTRA
  |global_command_number:{2}
  |text_arg:{fr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l10 {chapter fr}
 |EXTRA
 |identifier:{chapter-fr}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter fr}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l11 {chapter fr}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter fr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l13
  |EXTRA
  |global_command_number:{3}
  |text_arg:{pt}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:pt}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l14 {subnode pt}
 |EXTRA
 |identifier:{subnode-pt}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subnode pt}
    {spaces_after_argument:\\n}
 *normal_command@section C3 l15 {section pt}
 |EXTRA
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section pt}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l17
  |EXTRA
  |global_command_number:{4}
  |text_arg:{fr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l18 {subnode fr}
 |EXTRA
 |identifier:{subnode-fr}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subnode fr}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l19 {section fr}
 |EXTRA
 |section_heading_number:{2.2}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section fr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'multiple_documentlanguage'} = '@documentlanguage ja

@node Top
@top top

@node chap
@chapter Chap no new language

@documentlanguage fr
@node chapter fr
@chapter chapter fr

@documentlanguage pt
@node subnode pt
@section section pt

@documentlanguage fr
@node subnode fr
@section section fr

';


$result_texts{'multiple_documentlanguage'} = '
top
***

1 Chap no new language
**********************

2 chapter fr
************

2.1 section pt
==============

2.2 section fr
==============

';

$result_errors{'multiple_documentlanguage'} = '';

$result_nodes_list{'multiple_documentlanguage'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap no new language
 associated_title_command: 1 Chap no new language
 node_directions:
  next->chapter fr
  prev->Top
  up->Top
3|chapter fr
 associated_section: 2 chapter fr
 associated_title_command: 2 chapter fr
 node_directions:
  prev->chap
  up->Top
4|subnode pt
 associated_section: 2.1 section pt
 associated_title_command: 2.1 section pt
 node_directions:
  next->subnode fr
  up->chapter fr
5|subnode fr
 associated_section: 2.2 section fr
 associated_title_command: 2.2 section fr
 node_directions:
  prev->subnode pt
  up->chapter fr
';

$result_sections_list{'multiple_documentlanguage'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap no new language
 section_children:
  1|Chap no new language
  2|chapter fr
2|Chap no new language
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  next->chapter fr
  up->top
 toplevel_directions:
  next->chapter fr
  prev->top
  up->top
3|chapter fr
 associated_anchor_command: chapter fr
 associated_node: chapter fr
 section_directions:
  prev->Chap no new language
  up->top
 toplevel_directions:
  prev->Chap no new language
  up->top
 section_children:
  1|section pt
  2|section fr
4|section pt
 associated_anchor_command: subnode pt
 associated_node: subnode pt
 section_directions:
  next->section fr
  up->chapter fr
5|section fr
 associated_anchor_command: subnode fr
 associated_node: subnode fr
 section_directions:
  prev->section pt
  up->chapter fr
';

$result_sectioning_root{'multiple_documentlanguage'} = 'level: -1
list:
 1|top
';

$result_headings_list{'multiple_documentlanguage'} = '';


$result_converted{'docbook'}->{'multiple_documentlanguage'} = '<chapter label="1" id="chap" lang="ja">
<title>Chap no new language</title>

</chapter>
<chapter label="2" id="chapter-fr" lang="fr">
<title>chapter fr</title>

<sect1 label="2.1" id="subnode-pt" lang="pt">
<title>section pt</title>

</sect1>
<sect1 label="2.2" id="subnode-fr">
<title>section fr</title>

</sect1>
</chapter>
';

1;
