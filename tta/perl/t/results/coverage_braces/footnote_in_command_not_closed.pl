use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'footnote_in_command_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   {normal_text:aaa}
   *@code C1 l1
    *brace_container C2
     {normal_text:in code}
     *@footnote C1 l1
      *brace_command_context C1
       *paragraph C1
        {normal_text:in footnote}
';


$result_texis{'footnote_in_command_not_closed'} = 'aaa@code{in code@footnote{in footnote}}';


$result_texts{'footnote_in_command_not_closed'} = 'aaain code';

$result_errors{'footnote_in_command_not_closed'} = '* E l1|@footnote missing closing brace
 @footnote missing closing brace

* E l1|@code missing closing brace
 @code missing closing brace

';

$result_nodes_list{'footnote_in_command_not_closed'} = '';

$result_sections_list{'footnote_in_command_not_closed'} = '';

$result_sectioning_root{'footnote_in_command_not_closed'} = '';

$result_headings_list{'footnote_in_command_not_closed'} = '';

1;
