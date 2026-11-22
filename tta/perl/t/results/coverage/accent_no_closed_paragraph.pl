use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'accent_no_closed_paragraph'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *paragraph C1
   *normal_command@~ C1 l1
    *brace_container C2
     {normal_text:e\\n}
     {empty_line:\\n}
  *paragraph C1
   {normal_text:other para.\\n}
';


$result_texis{'accent_no_closed_paragraph'} = '@~{e

}other para.
';


$result_texts{'accent_no_closed_paragraph'} = 'e

~other para.
';

$result_errors{'accent_no_closed_paragraph'} = '* E l1|@~ missing closing brace
 @~ missing closing brace

';

$result_nodes_list{'accent_no_closed_paragraph'} = '';

$result_sections_list{'accent_no_closed_paragraph'} = '';

$result_sectioning_root{'accent_no_closed_paragraph'} = '';

$result_headings_list{'accent_no_closed_paragraph'} = '';

1;
