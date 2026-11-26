use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'customize_definition_index_translations'} = '*document_root C16
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo @c -*-texinfo-*-\\n}
   {empty_line:\\n}
  *preamble_before_content C2
   *normal_command@syncodeindex C1 customize_definition_index_translations.texi:l3
   |misc_args:A{vr|fn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:vr fn}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 customize_definition_index_translations.texi:l5 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 customize_definition_index_translations.texi:l6 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 customize_definition_index_translations.texi:l8 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 customize_definition_index_translations.texi:l9 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defcv C2 customize_definition_index_translations.texi:l11
   *def_line C1 customize_definition_index_translations.texi:l11
   |def_command:{defcv}
   |element_node:{Chapter}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defcv}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:cvdefault}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l11
       {normal_text:cv class default}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l11
       {normal_text:default}
     {spaces_after_argument:\\n}
   *normal_command@end C1 customize_definition_index_translations.texi:l12
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defop C2 customize_definition_index_translations.texi:l14
   *def_line C1 customize_definition_index_translations.texi:l14
   |def_command:{defop}
   |element_node:{Chapter}
   |index_entry:I{fn,1}
   |original_def_cmdname:{defop}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:opdefault}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l14
       {normal_text:op class default}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l14
       {normal_text:default}
     {spaces_after_argument:\\n}
   *normal_command@end C1 customize_definition_index_translations.texi:l15
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 customize_definition_index_translations.texi:l17
  |global_command_number:{1}
  |text_arg:{fr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr}
    {spaces_after_argument:\\n}
 *normal_command@node C1 customize_definition_index_translations.texi:l18 {Chapter fr}
 |identifier:{Chapter-fr}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter fr}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 customize_definition_index_translations.texi:l19 {chap fr}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap fr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defcv C2 customize_definition_index_translations.texi:l21
   *def_line C1 customize_definition_index_translations.texi:l21
   |def_command:{defcv}
   |documentlanguage:{fr}
   |element_node:{Chapter-fr}
   |index_entry:I{vr,2}
   |original_def_cmdname:{defcv}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:cvfr}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l21
       {normal_text:cv class fr}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l21
       {normal_text:fr}
     {spaces_after_argument:\\n}
   *normal_command@end C1 customize_definition_index_translations.texi:l22
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defop C2 customize_definition_index_translations.texi:l24
   *def_line C1 customize_definition_index_translations.texi:l24
   |def_command:{defop}
   |documentlanguage:{fr}
   |element_node:{Chapter-fr}
   |index_entry:I{fn,2}
   |original_def_cmdname:{defop}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:opfr}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l24
       {normal_text:op class fr}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l24
       {normal_text:fr}
     {spaces_after_argument:\\n}
   *normal_command@end C1 customize_definition_index_translations.texi:l25
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 customize_definition_index_translations.texi:l27 {section fr}
 |identifier:{section-fr}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section fr}
    {spaces_after_argument:\\n}
 *normal_command@section C3 customize_definition_index_translations.texi:l28 {sec fr}
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec fr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 customize_definition_index_translations.texi:l30
  |global_command_number:{2}
  |text_arg:{de}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:de}
    {spaces_after_argument:\\n}
 *normal_command@node C1 customize_definition_index_translations.texi:l31 {Chapter de}
 |identifier:{Chapter-de}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter de}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 customize_definition_index_translations.texi:l32 {chap de}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap de}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defcv C2 customize_definition_index_translations.texi:l34
   *def_line C1 customize_definition_index_translations.texi:l34
   |def_command:{defcv}
   |documentlanguage:{de}
   |element_node:{Chapter-de}
   |index_entry:I{vr,3}
   |original_def_cmdname:{defcv}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:cvde}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l34
       {normal_text:cv class de}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l34
       {normal_text:de}
     {spaces_after_argument:\\n}
   *normal_command@end C1 customize_definition_index_translations.texi:l35
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defop C2 customize_definition_index_translations.texi:l37
   *def_line C1 customize_definition_index_translations.texi:l37
   |def_command:{defop}
   |documentlanguage:{de}
   |element_node:{Chapter-de}
   |index_entry:I{fn,3}
   |original_def_cmdname:{defop}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:opde}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l37
       {normal_text:op class de}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l37
       {normal_text:de}
     {spaces_after_argument:\\n}
   *normal_command@end C1 customize_definition_index_translations.texi:l38
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 customize_definition_index_translations.texi:l40
  |global_command_number:{3}
  |text_arg:{de_AT}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:de_AT}
    {spaces_after_argument:\\n}
 *normal_command@node C1 customize_definition_index_translations.texi:l41 {Chapter de_AT}
 |identifier:{Chapter-de_005fAT}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter de_AT}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 customize_definition_index_translations.texi:l42 {chap de_AT}
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap de_AT}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defcv C2 customize_definition_index_translations.texi:l44
   *def_line C1 customize_definition_index_translations.texi:l44
   |def_command:{defcv}
   |documentlanguage:{de_AT}
   |element_node:{Chapter-de_005fAT}
   |index_entry:I{vr,4}
   |original_def_cmdname:{defcv}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:cvdeAT}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l44
       {normal_text:cv class deAT}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l44
       {normal_text:deAT}
     {spaces_after_argument:\\n}
   *normal_command@end C1 customize_definition_index_translations.texi:l45
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defop C2 customize_definition_index_translations.texi:l47
   *def_line C1 customize_definition_index_translations.texi:l47
   |def_command:{defop}
   |documentlanguage:{de_AT}
   |element_node:{Chapter-de_005fAT}
   |index_entry:I{fn,4}
   |original_def_cmdname:{defop}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:opdeAT}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l47
       {normal_text:op class deAT}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 customize_definition_index_translations.texi:l47
       {normal_text:deAT}
     {spaces_after_argument:\\n}
   *normal_command@end C1 customize_definition_index_translations.texi:l48
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 customize_definition_index_translations.texi:l50 {Last chapter}
 |identifier:{Last-chapter}
 |is_target:{1}
 |isindex:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Last chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 customize_definition_index_translations.texi:l51 {Last Chapter}
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Last Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 customize_definition_index_translations.texi:l53
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'customize_definition_index_translations'} = '\\input texinfo @c -*-texinfo-*-

@syncodeindex vr fn

@node Top
@top top

@node Chapter
@chapter chap

@defcv cvdefault {cv class default} {default}
@end defcv

@defop opdefault {op class default} {default}
@end defop

@documentlanguage fr
@node Chapter fr
@chapter chap fr

@defcv cvfr {cv class fr} {fr}
@end defcv

@defop opfr {op class fr} {fr}
@end defop

@node section fr
@section sec fr

@documentlanguage de
@node Chapter de
@chapter chap de

@defcv cvde {cv class de} {de}
@end defcv

@defop opde {op class de} {de}
@end defop

@documentlanguage de_AT
@node Chapter de_AT
@chapter chap de_AT

@defcv cvdeAT {cv class deAT} {deAT}
@end defcv

@defop opdeAT {op class deAT} {deAT}
@end defop

@node Last chapter
@chapter Last Chapter

@printindex fn
@bye
';


$result_texts{'customize_definition_index_translations'} = '
top
***

1 chap
******

cvdefault of cv class default: default

opdefault on op class default: default

2 chap fr
*********

cvfr de cv class fr: fr

opfr de op class fr: fr

2.1 sec fr
==========

3 chap de
*********

cvde of cv class de: de

opde on op class de: de

4 chap de_AT
************

cvdeAT of cv class deAT: deAT

opdeAT on op class deAT: deAT

5 Last Chapter
**************

';

$result_errors{'customize_definition_index_translations'} = '';

$result_indices{'customize_definition_index_translations'} = 'cp
fn C
ky C
pg C
tp C
vr C ->fn
';

$result_nodes_list{'customize_definition_index_translations'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chapter
2|Chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  next->Chapter fr
  prev->Top
  up->Top
3|Chapter fr
 associated_section: 2 chap fr
 associated_title_command: 2 chap fr
 node_directions:
  next->Chapter de
  prev->Chapter
  up->Top
4|section fr
 associated_section: 2.1 sec fr
 associated_title_command: 2.1 sec fr
 node_directions:
  up->Chapter fr
5|Chapter de
 associated_section: 3 chap de
 associated_title_command: 3 chap de
 node_directions:
  next->Chapter de_AT
  prev->Chapter fr
  up->Top
6|Chapter de_AT
 associated_section: 4 chap de_AT
 associated_title_command: 4 chap de_AT
 node_directions:
  next->Last chapter
  prev->Chapter de
  up->Top
7|Last chapter
 associated_section: 5 Last Chapter
 associated_title_command: 5 Last Chapter
 node_directions:
  prev->Chapter de_AT
  up->Top
';

$result_sections_list{'customize_definition_index_translations'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
  2|chap fr
  3|chap de
  4|chap de_AT
  5|Last Chapter
2|chap
 associated_anchor_command: Chapter
 associated_node: Chapter
 section_directions:
  next->chap fr
  up->top
 toplevel_directions:
  next->chap fr
  prev->top
  up->top
3|chap fr
 associated_anchor_command: Chapter fr
 associated_node: Chapter fr
 section_directions:
  next->chap de
  prev->chap
  up->top
 toplevel_directions:
  next->chap de
  prev->chap
  up->top
 section_children:
  1|sec fr
4|sec fr
 associated_anchor_command: section fr
 associated_node: section fr
 section_directions:
  up->chap fr
5|chap de
 associated_anchor_command: Chapter de
 associated_node: Chapter de
 section_directions:
  next->chap de_AT
  prev->chap fr
  up->top
 toplevel_directions:
  next->chap de_AT
  prev->chap fr
  up->top
6|chap de_AT
 associated_anchor_command: Chapter de_AT
 associated_node: Chapter de_AT
 section_directions:
  next->Last Chapter
  prev->chap de
  up->top
 toplevel_directions:
  next->Last Chapter
  prev->chap de
  up->top
7|Last Chapter
 associated_anchor_command: Last chapter
 associated_node: Last chapter
 section_directions:
  prev->chap de_AT
  up->top
 toplevel_directions:
  prev->chap de_AT
  up->top
';

$result_sectioning_root{'customize_definition_index_translations'} = 'level: -1
list:
 1|top
';

$result_headings_list{'customize_definition_index_translations'} = '';

$result_indices_sort_strings{'customize_definition_index_translations'} = 'fn:
 de in op class de
 de von cv class de
 deAT in op class deAT
 deAT von cv class deAT
 default of cv class default
 default on op class default
 fr de cv class fr
 fr de op class fr
';

$result_converted_sort_strings{'file_html'}->{'customize_definition_index_translations'} = 'fn:
 deAT in op class deAT
 default of cv class default
 default on op class default
 La méthode fr pour la op class fr
 La variable fr de cv class fr
 Name de der op class de
 Variable de der cv class de
 Variable(AT) deAT der cv class deAT
';

1;
