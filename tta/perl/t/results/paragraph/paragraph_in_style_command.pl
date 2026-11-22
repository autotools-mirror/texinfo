use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'paragraph_in_style_command'} = '*document_root C1
 *before_node_section C8
  *preamble_before_content
  *paragraph C2
   {normal_text:a 2 paragraphs sample }
   *@samp C1 l1
    *brace_container C2
     {normal_text:in first paragraph\\n}
     {empty_line:\\n}
  *paragraph C1
   {normal_text:in second.\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:a 3 paragraphs sample }
   *@samp C1 l5
    *brace_container C2
     {normal_text:in first paragraph\\n}
     {empty_line:\\n}
  *paragraph C1
   {normal_text:in second\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in third.\\n}
';


$result_texis{'paragraph_in_style_command'} = 'a 2 paragraphs sample @samp{in first paragraph

}in second.

a 3 paragraphs sample @samp{in first paragraph

}in second

in third.
';


$result_texts{'paragraph_in_style_command'} = 'a 2 paragraphs sample in first paragraph

in second.

a 3 paragraphs sample in first paragraph

in second

in third.
';

$result_errors{'paragraph_in_style_command'} = '* E l1|@samp missing closing brace
 @samp missing closing brace

* E l3|misplaced }
 misplaced }

* E l5|@samp missing closing brace
 @samp missing closing brace

* E l9|misplaced }
 misplaced }

';

$result_nodes_list{'paragraph_in_style_command'} = '';

$result_sections_list{'paragraph_in_style_command'} = '';

$result_sectioning_root{'paragraph_in_style_command'} = '';

$result_headings_list{'paragraph_in_style_command'} = '';

1;
