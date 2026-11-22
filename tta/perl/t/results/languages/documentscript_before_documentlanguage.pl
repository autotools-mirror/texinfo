use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentscript_before_documentlanguage'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C4
   *normal_command@documentscript C1 l2
   |global_command_number:{1}
   |text_arg:{Latn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Latn}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@documentlanguage C1 l4
   |global_command_number:{1}
   |text_arg:{sr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:sr}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l6 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l7 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l10 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defivar C2 l12
   *def_line C1 l12
   |def_command:{defivar}
   |documentlanguage:{sr}
   |element_node:{chap}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *untranslated_def_line_arg C1
      |documentlanguage:{sr}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:some}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:other}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:ivar}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l13
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
';


$result_texis{'documentscript_before_documentlanguage'} = '
@documentscript Latn

@documentlanguage sr

@node Top
@top top

@node chap
@chapter Chap

@defivar some other ivar
@end defivar
';


$result_texts{'documentscript_before_documentlanguage'} = '

top
***

1 Chap
******

Променљива примерка од some: other ivar
';

$result_errors{'documentscript_before_documentlanguage'} = '';

$result_nodes_list{'documentscript_before_documentlanguage'} = '1|Top
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

$result_sections_list{'documentscript_before_documentlanguage'} = '1|top
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

$result_sectioning_root{'documentscript_before_documentlanguage'} = 'level: -1
list:
 1|top
';

$result_headings_list{'documentscript_before_documentlanguage'} = '';

$result_indices_sort_strings{'documentscript_before_documentlanguage'} = 'vr:
 other од some
';


$result_converted{'plaintext'}->{'documentscript_before_documentlanguage'} = 'top
***

1 Chap
******

 -- Променљива примерка од some: other ivar
';

$result_converted_sort_strings{'plaintext'}->{'documentscript_before_documentlanguage'} = 'vr:
 other од some
';

1;
