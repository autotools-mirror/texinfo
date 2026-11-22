use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'verb_at_end_of_line_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   {normal_text:verb at end of line }
   *@verb C1 l1
    *brace_container C2
     {raw:\\n}
     {raw:\\n}
';


$result_texis{'verb_at_end_of_line_not_closed'} = 'verb at end of line @verb{

}';


$result_texts{'verb_at_end_of_line_not_closed'} = 'verb at end of line 

';

$result_errors{'verb_at_end_of_line_not_closed'} = '* E l1|@verb without associated character
 @verb without associated character

* E l1|@verb missing closing brace
 @verb missing closing brace

';

$result_nodes_list{'verb_at_end_of_line_not_closed'} = '';

$result_sections_list{'verb_at_end_of_line_not_closed'} = '';

$result_sectioning_root{'verb_at_end_of_line_not_closed'} = '';

$result_headings_list{'verb_at_end_of_line_not_closed'} = '';

1;
