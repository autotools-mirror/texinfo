use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'verb_not_closed'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   *@verb C1 l1
   |INFO
   |delimiter:{.}
    *brace_container C1
     {raw:  }   . }
';


$result_texis{'verb_not_closed'} = '@verb{.  }   . .}';


$result_texts{'verb_not_closed'} = '  }   . ';

$result_errors{'verb_not_closed'} = '* E l1|@verb missing closing delimiter sequence: .}
 @verb missing closing delimiter sequence: .}

';

$result_nodes_list{'verb_not_closed'} = '';

$result_sections_list{'verb_not_closed'} = '';

$result_sectioning_root{'verb_not_closed'} = '';

$result_headings_list{'verb_not_closed'} = '';

1;
