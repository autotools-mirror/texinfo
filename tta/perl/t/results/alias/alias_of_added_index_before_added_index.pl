use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'alias_of_added_index_before_added_index'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C4
   *@alias C1 l1
   |EXTRA
   |misc_args:A{new|sliindex}
    *line_arg C3
     {spaces_before_argument: }
     {new = sliindex}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@defindex C1 l3
   |EXTRA
   |misc_args:A{sli}
    *line_arg C3
     {spaces_before_argument: }
     {sli}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l5 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C4 l6 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@sliindex C1 l8
  |EXTRA
  |alias_of:{new}
  |element_node:{Top}
  |index_entry:I{sli,1}
   *line_arg C3
    {spaces_before_argument: }
    {entry}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l10 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
 *@chapter C3 l11 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 l13
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{sli}
   *line_arg C3
    {spaces_before_argument: }
    {sli}
    {spaces_after_argument:\\n}
';


$result_texis{'alias_of_added_index_before_added_index'} = '@alias new = sliindex

@defindex sli

@node Top
@top top

@sliindex entry

@node chap
@chapter Chapter

@printindex sli
';


$result_texts{'alias_of_added_index_before_added_index'} = '

top
***


1 Chapter
*********

';

$result_errors{'alias_of_added_index_before_added_index'} = '';

$result_indices{'alias_of_added_index_before_added_index'} = 'cp
fn C
ky C
pg C
sli
tp C
vr C
';

$result_nodes_list{'alias_of_added_index_before_added_index'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'alias_of_added_index_before_added_index'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'alias_of_added_index_before_added_index'} = 'level: -1
list:
 1|top
';

$result_headings_list{'alias_of_added_index_before_added_index'} = '';

$result_indices_sort_strings{'alias_of_added_index_before_added_index'} = 'sli:
 entry
';


$result_converted{'plaintext'}->{'alias_of_added_index_before_added_index'} = 'top
***

1 Chapter
*********

* Menu:

* entry:                                 Top.                   (line 2)

';

$result_converted_sort_strings{'plaintext'}->{'alias_of_added_index_before_added_index'} = 'sli:
 entry
';

1;
