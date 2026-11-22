use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'split_test_before_first_node'} = '*document_root C5
 *before_node_section C3
  *preamble_before_content C2
   *@setfilename C1 l1
   |EXTRA
   |text_arg:{split_test_before_first_node.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:split_test_before_first_node.info}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:truc machin et reuc machin  ze aze zea zae eaz eaz zae\\n}
  {empty_line:\\n}
 *@node C1 l5 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C6 l6 {top}
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
   {normal_text:In top node\\n}
  {empty_line:\\n}
  *@menu C3 l10
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chap1}
     {normal_text:chap1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l12
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l14 {chap1}
 |EXTRA
 |identifier:{chap1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap1}
    {spaces_after_argument:\\n}
 *@chapter C4 l15 {chap}
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
   {normal_text:In chap1.\\n}
  {empty_line:\\n}
';


$result_texis{'split_test_before_first_node'} = '@setfilename split_test_before_first_node.info

truc machin et reuc machin  ze aze zea zae eaz eaz zae

@node Top
@top top

In top node

@menu
* chap1::
@end menu

@node chap1
@chapter chap

In chap1.

';


$result_texts{'split_test_before_first_node'} = '
truc machin et reuc machin  ze aze zea zae eaz eaz zae

top
***

In top node

* chap1::

1 chap
******

In chap1.

';

$result_errors{'split_test_before_first_node'} = '';

$result_nodes_list{'split_test_before_first_node'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chap1
 node_directions:
  next->chap1
2|chap1
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'split_test_before_first_node'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap1
 associated_node: chap1
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'split_test_before_first_node'} = 'level: -1
list:
 1|top
';

$result_headings_list{'split_test_before_first_node'} = '';

1;
