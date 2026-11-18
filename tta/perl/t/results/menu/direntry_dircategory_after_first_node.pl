use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'direntry_dircategory_after_first_node'} = '*document_root C3
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
    {Top}
    {spaces_after_argument:\\n}
 *@top C4 l2 {direntry direcategory after first node}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {direntry direcategory after first node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@dircategory C1 l4
   *line_arg C3
    {spaces_before_argument: }
    {Cat}
    {spaces_after_argument:\\n}
  *@direntry C3 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C6 l6
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {in text}
    {menu_entry_separator:: }
    *menu_entry_node C3
    |EXTRA
    |manual_content:A{1|1}
     {(}
     {in_text}
     {)}
    {menu_entry_separator:. }
    *menu_entry_description C1
     *preformatted C1
      {in text\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{direntry}
    *line_arg C3
     {spaces_before_argument: }
     {direntry}
     {spaces_after_argument:\\n}
';


$result_texis{'direntry_dircategory_after_first_node'} = '@node Top
@top direntry direcategory after first node

@dircategory Cat
@direntry
* in text: (in_text). in text
@end direntry
';


$result_texts{'direntry_dircategory_after_first_node'} = 'direntry direcategory after first node
**************************************

* in text: (in_text). in text
';

$result_errors{'direntry_dircategory_after_first_node'} = '* W l4|@dircategory after first node
 warning: @dircategory after first node

* W l5|@direntry after first node
 warning: @direntry after first node

';

$result_nodes_list{'direntry_dircategory_after_first_node'} = '1|Top
 associated_section: direntry direcategory after first node
 associated_title_command: direntry direcategory after first node
';

$result_sections_list{'direntry_dircategory_after_first_node'} = '1|direntry direcategory after first node
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'direntry_dircategory_after_first_node'} = 'level: -1
list:
 1|direntry direcategory after first node
';

$result_headings_list{'direntry_dircategory_after_first_node'} = '';

1;
