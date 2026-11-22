use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'languages_scripts_variants'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content C3
   *@documentlanguage C1 l1
   |EXTRA
   |global_command_number:{1}
   |text_arg:{az}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:az}
     {spaces_after_argument:\\n}
   *@documentscript C1 l2
   |EXTRA
   |global_command_number:{1}
   |text_arg:{Latn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Latn}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l4 {top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
 *@top C3 l5 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:node chap\\n}
 *@chapter C32 l8 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguage C1 l10
  |EXTRA
  |global_command_number:{2}
  |text_arg:{sr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sr}
    {spaces_after_argument:\\n}
  *@documentscript C1 l11
  |EXTRA
  |global_command_number:{2}
  |text_arg:{Latn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Latn}
    {spaces_after_argument:\\n}
  *@documentlanguagevariant C1 l12
  |EXTRA
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ekavsk}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentscript C1 l14
  |EXTRA
  |global_command_number:{3}
  |text_arg:{}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *@documentlanguagevariant C1 l16
  |EXTRA
  |global_command_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ijekavsk}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguagevariant C2 l18
  |EXTRA
  |global_command_number:{3}
   *line_arg C1
    {spaces_before_argument: }
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *@documentscript C1 l20
  |EXTRA
  |global_command_number:{4}
  |text_arg:{Cyrl}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Cyrl}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguage C1 l22
  |EXTRA
  |global_command_number:{3}
  |text_arg:{fr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguage C1 l24
  |EXTRA
  |global_command_number:{4}
  |text_arg:{az}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:az}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguage C1 l26
  |EXTRA
  |global_command_number:{5}
  |text_arg:{az}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:az}
    {spaces_after_argument:\\n}
  *@documentscript C1 l27
  |EXTRA
  |global_command_number:{5}
  |text_arg:{Cyrl}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Cyrl}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentscript C1 l29
  |EXTRA
  |global_command_number:{6}
  |text_arg:{Arab}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Arab}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentscript C1 l31
  |EXTRA
  |global_command_number:{7}
  |text_arg:{Cyrl}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Cyrl}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguage C1 l33
  |EXTRA
  |global_command_number:{6}
  |text_arg:{fr_FR}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr_FR}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguage C1 l35
  |EXTRA
  |global_command_number:{7}
  |text_arg:{oc}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:oc}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguagevariant C1 l37
  |EXTRA
  |global_command_number:{4}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:aranes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguagevariant C1 l39
  |EXTRA
  |global_command_number:{5}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:auvern}
    {spaces_after_argument:\\n}
';


$result_texis{'languages_scripts_variants'} = '@documentlanguage az
@documentscript Latn

@node top
@top top

node chap
@chapter chap

@documentlanguage sr
@documentscript Latn
@documentlanguagevariant ekavsk

@documentscript

@documentlanguagevariant ijekavsk

@documentlanguagevariant ,

@documentscript Cyrl

@documentlanguage fr

@documentlanguage az

@documentlanguage az
@documentscript Cyrl

@documentscript Arab

@documentscript Cyrl

@documentlanguage fr_FR

@documentlanguage oc

@documentlanguagevariant aranes

@documentlanguagevariant auvern
';


$result_texts{'languages_scripts_variants'} = '
top
***

node chap
1 chap
******














';

$result_errors{'languages_scripts_variants'} = '';

$result_nodes_list{'languages_scripts_variants'} = '1|top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'languages_scripts_variants'} = '1|top
 associated_anchor_command: top
 associated_node: top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'languages_scripts_variants'} = 'level: -1
list:
 1|top
';

$result_headings_list{'languages_scripts_variants'} = '';

1;
