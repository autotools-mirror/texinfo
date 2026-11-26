use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'not_i_j_in_dotless'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C4
   *normal_command@dotless C2 l1
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {normal_text:a}
   {normal_text: bc, }
   *normal_command@^ C1 l1
    *brace_container C1
     *normal_command@dotless C1 l1
      *brace_container C1
       {normal_text:q}
   {normal_text:.}
';


$result_texis{'not_i_j_in_dotless'} = '@dotless a bc, @^{@dotless{q}}.';


$result_texts{'not_i_j_in_dotless'} = 'a bc, q^.';

$result_errors{'not_i_j_in_dotless'} = '* E l1|@dotless expects `i\' or `j\' as argument, not `a\'
 @dotless expects `i\' or `j\' as argument, not `a\'

* E l1|@dotless expects `i\' or `j\' as argument, not `q\'
 @dotless expects `i\' or `j\' as argument, not `q\'

';

$result_nodes_list{'not_i_j_in_dotless'} = '';

$result_sections_list{'not_i_j_in_dotless'} = '';

$result_sectioning_root{'not_i_j_in_dotless'} = '';

$result_headings_list{'not_i_j_in_dotless'} = '';

1;
