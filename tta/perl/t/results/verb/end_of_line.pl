use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'end_of_line'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C3
   {normal_text:verb at end of line }
   *normal_command@verb C1 l1
    *brace_container C4
     {raw:\\n}
     {raw:\\n}
     {raw:@{ in verb at end of line @c comment\\n}
     {raw:and now end}
   {normal_text:after end.}
';


$result_texis{'end_of_line'} = 'verb at end of line @verb{

@{ in verb at end of line @c comment
and now end}after end.';


$result_texts{'end_of_line'} = 'verb at end of line 

@{ in verb at end of line @c comment
and now endafter end.';

$result_errors{'end_of_line'} = '* E l1|@verb without associated character
 @verb without associated character

';

$result_nodes_list{'end_of_line'} = '';

$result_sections_list{'end_of_line'} = '';

$result_sectioning_root{'end_of_line'} = '';

$result_headings_list{'end_of_line'} = '';

1;
