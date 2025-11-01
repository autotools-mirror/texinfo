use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'punctuation_in_sc'} = '*document_root C1
 *before_node_section C1
  *paragraph C5
   {one }
   *@sc C1 l1
    *brace_container C1
     {two.}
   { three }
   *@sc C1 l1
    *brace_container C1
     {FOUR.}
   { five}
';


$result_texis{'punctuation_in_sc'} = 'one @sc{two.} three @sc{FOUR.} five';


$result_texts{'punctuation_in_sc'} = 'one TWO. three FOUR. five';

$result_errors{'punctuation_in_sc'} = '';

$result_nodes_list{'punctuation_in_sc'} = '';

$result_sections_list{'punctuation_in_sc'} = '';

$result_sectioning_root{'punctuation_in_sc'} = '';

$result_headings_list{'punctuation_in_sc'} = '';


$result_converted{'plaintext'}->{'punctuation_in_sc'} = 'one TWO.  three FOUR. five
';

1;
