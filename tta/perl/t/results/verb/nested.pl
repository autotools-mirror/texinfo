use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'nested'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   *@b C1 l1
    *brace_container C3
     {in b }
     *@verb C1 l1
     |INFO
     |delimiter:{/}
      *brace_container C1
       {raw: in verb { } }
     { in b end}
';


$result_texis{'nested'} = '@b{in b @verb{/ in verb { } /} in b end}';


$result_texts{'nested'} = 'in b  in verb { }  in b end';

$result_errors{'nested'} = '';

$result_nodes_list{'nested'} = '';

$result_sections_list{'nested'} = '';

$result_sectioning_root{'nested'} = '';

$result_headings_list{'nested'} = '';

1;
