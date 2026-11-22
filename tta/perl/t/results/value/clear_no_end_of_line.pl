use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'clear_no_end_of_line'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@clear C1
   |misc_args:A{jj}
    *line_arg C2
     {spaces_before_argument: }
     {rawline_text:jj}
';


$result_texis{'clear_no_end_of_line'} = '@clear jj';


$result_texts{'clear_no_end_of_line'} = '';

$result_errors{'clear_no_end_of_line'} = '';

$result_nodes_list{'clear_no_end_of_line'} = '';

$result_sections_list{'clear_no_end_of_line'} = '';

$result_sectioning_root{'clear_no_end_of_line'} = '';

$result_headings_list{'clear_no_end_of_line'} = '';

1;
