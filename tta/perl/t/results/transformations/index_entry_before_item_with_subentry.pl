use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'index_entry_before_item_with_subentry'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
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
 *@node C1 l4 {Chap}
 |EXTRA
 |identifier:{Chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
 *@chapter C4 l5 {chap}
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
  *@itemize C4 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@item C3 l8
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:first item\\n}
    {empty_line:\\n}
   *@item C3 l11
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: \\n}
    *index_entry_command@cindex C1 l10
    |EXTRA
    |element_node:{Chap}
    |index_entry:I{cp,1}
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:entry}
      {spaces_after_argument: }
      *@subentry C1 l10
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:subentry}
        {spaces_after_argument:\\n}
    *paragraph C1
     {normal_text:second item\\n}
   *@end C1 l12
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l14 {Node index}
 |EXTRA
 |identifier:{Node-index}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Node index}
    {spaces_after_argument:\\n}
 *@chapter C3 l15 {Chap printindex}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap printindex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 l17
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
';


$result_texis{'index_entry_before_item_with_subentry'} = '@node Top
@top top

@node Chap
@chapter chap

@itemize
@item first item

@item 
@cindex entry @subentry subentry
second item
@end itemize

@node Node index
@chapter Chap printindex

@printindex cp
';


$result_texts{'index_entry_before_item_with_subentry'} = 'top
***

1 chap
******

first item

second item

2 Chap printindex
*****************

';

$result_errors{'index_entry_before_item_with_subentry'} = '';

$result_nodes_list{'index_entry_before_item_with_subentry'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chap
2|Chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  next->Node index
  prev->Top
  up->Top
3|Node index
 associated_section: 2 Chap printindex
 associated_title_command: 2 Chap printindex
 node_directions:
  prev->Chap
  up->Top
';

$result_sections_list{'index_entry_before_item_with_subentry'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
  2|Chap printindex
2|chap
 associated_anchor_command: Chap
 associated_node: Chap
 section_directions:
  next->Chap printindex
  up->top
 toplevel_directions:
  next->Chap printindex
  prev->top
  up->top
3|Chap printindex
 associated_anchor_command: Node index
 associated_node: Node index
 section_directions:
  prev->chap
  up->top
 toplevel_directions:
  prev->chap
  up->top
';

$result_sectioning_root{'index_entry_before_item_with_subentry'} = 'level: -1
list:
 1|top
';

$result_headings_list{'index_entry_before_item_with_subentry'} = '';

$result_indices_sort_strings{'index_entry_before_item_with_subentry'} = 'cp:
 entry, subentry
';

1;
