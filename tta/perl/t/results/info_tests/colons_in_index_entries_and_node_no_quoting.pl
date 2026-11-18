use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'colons_in_index_entries_and_node_no_quoting'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content
 *@node C4 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{One_003a_003anode_002c-with-entries_002e}
     {One}
     *@asis C1 l4
      *brace_container C1
       {::}
     {node}
     *@comma C1 l4
      *brace_container
     { with entries.}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Concept-Index}
     {Concept Index}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C14 l8 {One@asis{::}node@comma{} with entries.}
 |EXTRA
 |identifier:{One_003a_003anode_002c-with-entries_002e}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    {One}
    *@asis C1 l8
     *brace_container C1
      {::}
    {node}
    *@comma C1 l8
     *brace_container
    { with entries.}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l10
  |EXTRA
  |element_node:{One_003a_003anode_002c-with-entries_002e}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {:}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l11
  |EXTRA
  |element_node:{One_003a_003anode_002c-with-entries_002e}
  |index_entry:I{cp,2}
   *line_arg C3
    {spaces_before_argument: }
    {:a}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l12
  |EXTRA
  |element_node:{One_003a_003anode_002c-with-entries_002e}
  |index_entry:I{cp,3}
   *line_arg C3
    {spaces_before_argument: }
    {b:c}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@example C3 l14
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {some example just to have text\\n}
   *@end C1 l16
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l18
  |EXTRA
  |element_node:{One_003a_003anode_002c-with-entries_002e}
  |index_entry:I{cp,4}
   *line_arg C3
    {spaces_before_argument: }
    {d::e}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l19
  |EXTRA
  |element_node:{One_003a_003anode_002c-with-entries_002e}
  |index_entry:I{cp,5}
   *line_arg C3
    {spaces_before_argument: }
    {f :d}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l20
  |EXTRA
  |element_node:{One_003a_003anode_002c-with-entries_002e}
  |index_entry:I{cp,6}
   *line_arg C3
    {spaces_before_argument: }
    {g: h}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {node one\\n}
  {empty_line:\\n}
 *@node C4 l24 {Concept Index}
 |EXTRA
 |identifier:{Concept-Index}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Concept Index}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 l26
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'colons_in_index_entries_and_node_no_quoting'} = '@node Top

@menu
* One@asis{::}node@comma{} with entries.::
* Concept Index::
@end menu

@node One@asis{::}node@comma{} with entries.

@cindex :
@cindex :a
@cindex b:c

@example
some example just to have text
@end example

@cindex d::e
@cindex f :d
@cindex g: h

node one

@node Concept Index

@printindex cp

';


$result_texts{'colons_in_index_entries_and_node_no_quoting'} = '
* One::node, with entries.::
* Concept Index::



some example just to have text


node one



';

$result_errors{'colons_in_index_entries_and_node_no_quoting'} = '';

$result_nodes_list{'colons_in_index_entries_and_node_no_quoting'} = '1|Top
 menus:
  One@asis{::}node@comma{} with entries.
  Concept Index
 node_directions:
  next->One@asis{::}node@comma{} with entries.
2|One@asis{::}node@comma{} with entries.
 node_directions:
  next->Concept Index
  prev->Top
  up->Top
3|Concept Index
 node_directions:
  prev->One@asis{::}node@comma{} with entries.
  up->Top
';

$result_sections_list{'colons_in_index_entries_and_node_no_quoting'} = '';

$result_sectioning_root{'colons_in_index_entries_and_node_no_quoting'} = '';

$result_headings_list{'colons_in_index_entries_and_node_no_quoting'} = '';

$result_indices_sort_strings{'colons_in_index_entries_and_node_no_quoting'} = 'cp:
 :
 :a
 b:c
 d::e
 f :d
 g: h
';

$result_converted_sort_strings{'file_info'}->{'colons_in_index_entries_and_node_no_quoting'} = 'cp:
 :
 :a
 b:c
 d::e
 f :d
 g: h
';

$result_converted_errors{'file_info'}->{'colons_in_index_entries_and_node_no_quoting'} = '* W l4|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

* W l8|node name should not contain `,\': One::node, with entries.
 warning: node name should not contain `,\': One::node, with entries.

* W l8|node name with index entries should not contain `:\'
 warning: node name with index entries should not contain `:\'

';

1;
