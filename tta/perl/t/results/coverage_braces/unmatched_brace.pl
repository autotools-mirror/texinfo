use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'unmatched_brace'} = '*document_root C1
 *before_node_section C1
  *paragraph C4
   *@samp C1 l1
    *brace_container C1
     {Closing}
   { }
   *@samp C1 l1
    *brace_container C3
     { }
     *@}
     { without opening macro }
   {.}
';


$result_texis{'unmatched_brace'} = '@samp{Closing} @samp{ @} without opening macro }.';


$result_texts{'unmatched_brace'} = 'Closing  } without opening macro .';

$result_errors{'unmatched_brace'} = '* E l1|misplaced }
 misplaced }

';

$result_nodes_list{'unmatched_brace'} = '';

$result_sections_list{'unmatched_brace'} = '';

$result_sectioning_root{'unmatched_brace'} = '';

$result_headings_list{'unmatched_brace'} = '';

1;
