use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'simple'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@defindex C1 l1
   |EXTRA
   |misc_args:A{idx}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:idx}
';


$result_texis{'simple'} = '@defindex idx';


$result_texts{'simple'} = '';

$result_errors{'simple'} = '';

$result_indices{'simple'} = 'cp
fn C
idx
ky C
pg C
tp C
vr C
';

$result_nodes_list{'simple'} = '';

$result_sections_list{'simple'} = '';

$result_sectioning_root{'simple'} = '';

$result_headings_list{'simple'} = '';

1;
