use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'set_no_end_of_line'} = '*document_root C1
 *before_node_section C1
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{arg|}
   *line_arg C1
    {rawline_text:arg}
';


$result_texis{'set_no_end_of_line'} = '@set arg';


$result_texts{'set_no_end_of_line'} = '';

$result_errors{'set_no_end_of_line'} = '';

$result_nodes_list{'set_no_end_of_line'} = '';

$result_sections_list{'set_no_end_of_line'} = '';

$result_sectioning_root{'set_no_end_of_line'} = '';

$result_headings_list{'set_no_end_of_line'} = '';

1;
