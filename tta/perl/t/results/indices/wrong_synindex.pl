use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'wrong_synindex'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@defindex C1 l1
   |misc_args:A{aaa}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:aaa}
     {spaces_after_argument:\\n}
   *normal_command@synindex C1 l2
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:aaa aaa}
';


$result_texis{'wrong_synindex'} = '@defindex aaa
@synindex aaa aaa';


$result_texts{'wrong_synindex'} = '';

$result_errors{'wrong_synindex'} = '* W l2|@synindex leads to a merging of aaa in itself, ignoring
 warning: @synindex leads to a merging of aaa in itself, ignoring

';

$result_indices{'wrong_synindex'} = 'aaa
cp
fn C
ky C
pg C
tp C
vr C
';

$result_nodes_list{'wrong_synindex'} = '';

$result_sections_list{'wrong_synindex'} = '';

$result_sectioning_root{'wrong_synindex'} = '';

$result_headings_list{'wrong_synindex'} = '';

1;
