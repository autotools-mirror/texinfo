use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'a_comma_after_node'} = '*document_root C2
 *before_node_section
 *@node C3 l1 {Commands}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Commands}
  *arguments_line C3
   *line_arg C1
    {Commands}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Requirements}
   |normalized:{Requirements}
    {Requirements}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Nodes and Menus}
   |normalized:{Nodes-and-Menus}
    {Nodes and Menus}
  {empty_line:\\n}
  *paragraph C1
   {A comma in text, end.\\n}
';


$result_texis{'a_comma_after_node'} = '@node Commands, Requirements, Nodes and Menus

A comma in text, end.
';


$result_texts{'a_comma_after_node'} = '
A comma in text, end.
';

$result_errors{'a_comma_after_node'} = '* E l1|Next reference to nonexistent `Requirements\'
 Next reference to nonexistent `Requirements\'

* E l1|Prev reference to nonexistent `Nodes and Menus\'
 Prev reference to nonexistent `Nodes and Menus\'

';

$result_nodes_list{'a_comma_after_node'} = '1|Commands
';

$result_sections_list{'a_comma_after_node'} = '';

$result_sectioning_root{'a_comma_after_node'} = '';

$result_headings_list{'a_comma_after_node'} = '';

1;
