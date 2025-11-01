use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'def_not_closed_in_menu_description'} = '*document_root C1
 *before_node_section C1
  *@menu C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l2
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:{info}
     {(}
     {info}
     {)}
    {menu_entry_separator::: }
    *menu_entry_description C2
     *preformatted C1
      {before deff }
     *@deffn C2 l2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *def_line C1 l2
      |EXTRA
      |def_command:{deffn}
      |def_index_element:
       |* C1
        |*def_line_arg C1
         |{truc}
      |index_entry:I{fn,1}
      |original_def_cmdname:{deffn}
       *block_line_arg C5
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        *def_category C1
         *def_line_arg C1
          {bidule}
        {spaces: }
        *def_name C1
         *def_line_arg C1
          {truc}
        {spaces: }
        *def_arg C1
         *def_line_arg C1
          {chose}
      *def_item C1
       *preformatted C2
        {empty_line:\\n}
        {deffn text\\n}
   *@end C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
';


$result_texis{'def_not_closed_in_menu_description'} = '@menu
* (info):: before deff @deffn bidule truc chose

deffn text
@end menu
';


$result_texts{'def_not_closed_in_menu_description'} = '* (info):: before deff bidule: truc chose

deffn text
';

$result_errors{'def_not_closed_in_menu_description'} = '* W l2|@deffn should only appear at the beginning of a line
 warning: @deffn should only appear at the beginning of a line

* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l5|`@end\' expected `deffn\', but saw `menu\'
 `@end\' expected `deffn\', but saw `menu\'

';

$result_nodes_list{'def_not_closed_in_menu_description'} = '';

$result_sections_list{'def_not_closed_in_menu_description'} = '';

$result_sectioning_root{'def_not_closed_in_menu_description'} = '';

$result_headings_list{'def_not_closed_in_menu_description'} = '';

$result_indices_sort_strings{'def_not_closed_in_menu_description'} = 'fn:
 truc
';

1;
