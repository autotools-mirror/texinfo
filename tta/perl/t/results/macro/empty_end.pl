use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_end'} = '*document_root C1
 *before_node_section C1
  *@macro C3 l1
  |EXTRA
  |macro_name:{foo}
  |misc_args:A{aaa}
   *arguments_line C1
    {macro_line: foo {aaa, }\\n}
   {raw:in foo\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
     {macro}
';


$result_texis{'empty_end'} = '@macro foo {aaa, }
in foo
@end macro';


$result_texts{'empty_end'} = '';

$result_errors{'empty_end'} = '';

$result_nodes_list{'empty_end'} = '';

$result_sections_list{'empty_end'} = '';

$result_sectioning_root{'empty_end'} = '';

$result_headings_list{'empty_end'} = '';

1;
