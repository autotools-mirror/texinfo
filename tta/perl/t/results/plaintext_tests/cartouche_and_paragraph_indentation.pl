use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'cartouche_and_paragraph_indentation'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
 *@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *@chapter C8 l5 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:aa\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:bb\\n}
  {empty_line:\\n}
  *@cartouche C7 l11
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:toto}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:cc\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:dd\\n}
   {empty_line:\\n}
   *@end C1 l17
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:cartouche}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l19 {chap2}
 |EXTRA
 |identifier:{chap2}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap2}
    {spaces_after_argument:\\n}
 *@chapter C6 l20 {c2}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@cartouche C7 l22
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:titi}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:ll m\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:mm\\n}
   {empty_line:\\n}
   *@end C1 l28
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:cartouche}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:oo\\n}
  {empty_line:\\n}
';


$result_texis{'cartouche_and_paragraph_indentation'} = '@node top
@top top

@node chap
@chapter chap

aa

bb

@cartouche toto

cc

dd

@end cartouche

@node chap2
@chapter c2

@cartouche titi

ll m

mm

@end cartouche

oo

';


$result_texts{'cartouche_and_paragraph_indentation'} = 'top
***

1 chap
******

aa

bb

toto

cc

dd


2 c2
****

titi

ll m

mm


oo

';

$result_errors{'cartouche_and_paragraph_indentation'} = '';

$result_nodes_list{'cartouche_and_paragraph_indentation'} = '1|top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  next->chap2
  prev->top
  up->top
3|chap2
 associated_section: 2 c2
 associated_title_command: 2 c2
 node_directions:
  prev->chap
  up->top
';

$result_sections_list{'cartouche_and_paragraph_indentation'} = '1|top
 associated_anchor_command: top
 associated_node: top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
  2|c2
2|chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  next->c2
  up->top
 toplevel_directions:
  next->c2
  prev->top
  up->top
3|c2
 associated_anchor_command: chap2
 associated_node: chap2
 section_directions:
  prev->chap
  up->top
 toplevel_directions:
  prev->chap
  up->top
';

$result_sectioning_root{'cartouche_and_paragraph_indentation'} = 'level: -1
list:
 1|top
';

$result_headings_list{'cartouche_and_paragraph_indentation'} = '';


$result_converted{'plaintext'}->{'cartouche_and_paragraph_indentation'} = 'top
***

1 chap
******

aa

   bb

                                 toto

   cc

   dd

2 c2
****

                                 titi

ll m

   mm

   oo

';

1;
