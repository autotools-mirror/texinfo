use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'direntry_dircategory_and_commands'} = '*document_root C3
 *before_node_section C7
  *@dircategory C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {``category---}
    *@var C1 l1
     *brace_container C1
      {th  ere}
    {?\'\'}
  *@direntry C3 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C6 l3
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {foo}
    {menu_entry_separator:: }
    *menu_entry_node C3
    |EXTRA
    |manual_content:{foo}
     {(}
     {foo}
     {)}
    {menu_entry_separator:.   }
    *menu_entry_description C1
     *preformatted C3
      {``hello---}
      *@var C1 l3
       *brace_container C1
        {there}
      {?\'\'\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{direntry}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {direntry}
  {empty_line:\\n}
  *@dircategory C1 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cat2}
  *@direntry C4 l7
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C2
    |EXTRA
    |node_content:{aaa }
    |normalized:{aaa}
     {aaa}
     {space_at_end_menu_node: }
    {menu_entry_separator:::               }
    *menu_entry_description C1
     *preformatted C2
      {aaaa\\n}
      {                   bbbbb\\n}
   *menu_comment C1
    *preformatted C2
     {after_menu_description_line:\\n}
     {menutitle\\n}
   *@end C1 l12
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{direntry}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {direntry}
  {empty_line:\\n}
  {empty_line:\\n}
 *@node C1 l15 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C3 l16 {Test dircategory and direntry}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Test dircategory and direntry}
  {empty_line:\\n}
  *paragraph C1
   {Text\\n}
';


$result_texis{'direntry_dircategory_and_commands'} = '@dircategory ``category---@var{th  ere}?\'\'
@direntry
* foo: (foo).   ``hello---@var{there}?\'\'
@end direntry

@dircategory cat2
@direntry
* aaa ::               aaaa
                   bbbbb

menutitle
@end direntry


@node Top
@top Test dircategory and direntry

Text
';


$result_texts{'direntry_dircategory_and_commands'} = '* foo: (foo).   "hello--there?"

* aaa::               aaaa
                   bbbbb

menutitle


Test dircategory and direntry
*****************************

Text
';

$result_errors{'direntry_dircategory_and_commands'} = '';

$result_nodes_list{'direntry_dircategory_and_commands'} = '1|Top
 associated_section: Test dircategory and direntry
 associated_title_command: Test dircategory and direntry
';

$result_sections_list{'direntry_dircategory_and_commands'} = '1|Test dircategory and direntry
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'direntry_dircategory_and_commands'} = 'level: -1
list:
 1|Test dircategory and direntry
';

$result_headings_list{'direntry_dircategory_and_commands'} = '';


$result_converted{'info'}->{'direntry_dircategory_and_commands'} = 'This is , produced from .

INFO-DIR-SECTION "category--TH ERE?"
START-INFO-DIR-ENTRY
* foo: (foo).   "hello--THERE?"
END-INFO-DIR-ENTRY

INFO-DIR-SECTION cat2
START-INFO-DIR-ENTRY
* aaa ::               aaaa
                   bbbbb

menutitle
END-INFO-DIR-ENTRY


File: ,  Node: Top,  Up: (dir)

Test dircategory and direntry
*****************************

Text


Tag Table:
Node: Top264

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
