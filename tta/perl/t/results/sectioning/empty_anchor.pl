use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_anchor'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *normal_command@anchor C1 l1
   *brace_arg
  *paragraph C3
   {normal_text:. \\n}
   *normal_command@anchor C1 l2
    *brace_arg C1
     {spaces_before_argument:   }
   {normal_text:.\\n}
';


$result_texis{'empty_anchor'} = '@anchor{}. 
@anchor{   }.
';


$result_texts{'empty_anchor'} = '. 
.
';

$result_errors{'empty_anchor'} = '* E l1|empty argument in @anchor
 empty argument in @anchor

* E l2|empty argument in @anchor
 empty argument in @anchor

';

$result_nodes_list{'empty_anchor'} = '';

$result_sections_list{'empty_anchor'} = '';

$result_sectioning_root{'empty_anchor'} = '';

$result_headings_list{'empty_anchor'} = '';

1;
