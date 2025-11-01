use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'bad_tab_nesting'} = '*document_root C1
 *before_node_section C1
  *@multitable C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *bracketed_arg C1 l1
      {truc}
     { }
     *bracketed_arg C1 l1
      {bidule}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {truc\\n}
       *@code C1 l3
        *brace_container
     *@tab C2 l3
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {bidule\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{multitable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {multitable}
';


$result_texis{'bad_tab_nesting'} = '@multitable {truc} {bidule}
@item truc
@code{}@tab bidule
@end multitable
';


$result_texts{'bad_tab_nesting'} = 'truc
bidule
';

$result_errors{'bad_tab_nesting'} = '* E l3|@code missing closing brace
 @code missing closing brace

* E l3|misplaced }
 misplaced }

';

$result_nodes_list{'bad_tab_nesting'} = '';

$result_sections_list{'bad_tab_nesting'} = '';

$result_sectioning_root{'bad_tab_nesting'} = '';

$result_headings_list{'bad_tab_nesting'} = '';

1;
