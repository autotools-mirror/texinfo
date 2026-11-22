use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'footnote_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   {normal_text:AAA}
   *normal_command@footnote C1 l1
    *brace_command_context C4
     {spaces_before_argument: }
     *paragraph C1
      {normal_text:in footnote\\n}
     {empty_line:\\n}
     *paragraph C1
      {normal_text:Second paragraph.\\n}
';


$result_texis{'footnote_not_closed'} = 'AAA@footnote{ in footnote

Second paragraph.
}';


$result_texts{'footnote_not_closed'} = 'AAA';

$result_errors{'footnote_not_closed'} = '* E l1|@footnote missing closing brace
 @footnote missing closing brace

';

$result_nodes_list{'footnote_not_closed'} = '';

$result_sections_list{'footnote_not_closed'} = '';

$result_sectioning_root{'footnote_not_closed'} = '';

$result_headings_list{'footnote_not_closed'} = '';

1;
