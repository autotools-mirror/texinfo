use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'node_in_copying_not_closed'} = '*document_root C3
 *before_node_section C1
  *@copying C5 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {This is an unterminatted copyright notice\\n}
   {empty_line:\\n}
   {empty_line:\\n}
 *@node C1 l6 {Top}
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
 *@top C3 l7 {Top section}
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
    {Top section}
  {empty_line:\\n}
  *@insertcopying C1 l9
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
';


$result_texis{'node_in_copying_not_closed'} = '@copying

This is an unterminatted copyright notice


@node Top
@top Top section

@insertcopying
';


$result_texts{'node_in_copying_not_closed'} = 'Top section
***********

';

$result_errors{'node_in_copying_not_closed'} = '* E l6|@node seen before @end copying
 @node seen before @end copying

';

$result_nodes_list{'node_in_copying_not_closed'} = '1|Top
 associated_section: Top section
 associated_title_command: Top section
';

$result_sections_list{'node_in_copying_not_closed'} = '1|Top section
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'node_in_copying_not_closed'} = 'level: -1
list:
 1|Top section
';

$result_headings_list{'node_in_copying_not_closed'} = '';

1;
