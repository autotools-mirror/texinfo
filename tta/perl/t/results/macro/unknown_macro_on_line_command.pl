use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unknown_macro_on_line_command'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@setfilename C1 l1
   |text_arg:{file}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:file}
';


$result_texis{'unknown_macro_on_line_command'} = '@setfilename file';


$result_texts{'unknown_macro_on_line_command'} = '';

$result_errors{'unknown_macro_on_line_command'} = '* E l1|unknown command `begin\'
 unknown command `begin\'

* E l1|misplaced {
 misplaced {

* E l1|misplaced }
 misplaced }

';

$result_nodes_list{'unknown_macro_on_line_command'} = '';

$result_sections_list{'unknown_macro_on_line_command'} = '';

$result_sectioning_root{'unknown_macro_on_line_command'} = '';

$result_headings_list{'unknown_macro_on_line_command'} = '';

1;
