use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'definfoenclose_bad_argument'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *@definfoenclose C1 l1
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:#phoo,;,:}
';


$result_texis{'definfoenclose_bad_argument'} = '@definfoenclose #phoo,;,:';


$result_texts{'definfoenclose_bad_argument'} = '';

$result_errors{'definfoenclose_bad_argument'} = '* W l1|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* E l1|bad argument to @definfoenclose
 bad argument to @definfoenclose

';

$result_nodes_list{'definfoenclose_bad_argument'} = '';

$result_sections_list{'definfoenclose_bad_argument'} = '';

$result_sectioning_root{'definfoenclose_bad_argument'} = '';

$result_headings_list{'definfoenclose_bad_argument'} = '';

1;
