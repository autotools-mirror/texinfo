use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'defindex_too_much_args'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@defindex C1 l1
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:chose    machin}
';


$result_texis{'defindex_too_much_args'} = '@defindex chose    machin';


$result_texts{'defindex_too_much_args'} = '';

$result_errors{'defindex_too_much_args'} = '* E l1|bad argument to @defindex: chose    machin
 bad argument to @defindex: chose    machin

';

$result_nodes_list{'defindex_too_much_args'} = '';

$result_sections_list{'defindex_too_much_args'} = '';

$result_sectioning_root{'defindex_too_much_args'} = '';

$result_headings_list{'defindex_too_much_args'} = '';

1;
