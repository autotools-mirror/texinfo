use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'recursive_synindex'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C4
   *normal_command@defindex C1 l1
   |misc_args:A{aaa}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:aaa}
     {spaces_after_argument:\\n}
   *normal_command@defindex C1 l2
   |misc_args:A{bbb}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:bbb}
     {spaces_after_argument:\\n}
   *normal_command@synindex C1 l3
   |misc_args:A{aaa|bbb}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:aaa bbb}
     {spaces_after_argument:\\n}
   *normal_command@synindex C1 l4
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:bbb aaa}
';


$result_texis{'recursive_synindex'} = '@defindex aaa
@defindex bbb
@synindex aaa bbb
@synindex bbb aaa';


$result_texts{'recursive_synindex'} = '';

$result_errors{'recursive_synindex'} = '* W l4|@synindex leads to a merging of bbb in itself, ignoring
 warning: @synindex leads to a merging of bbb in itself, ignoring

';

$result_indices{'recursive_synindex'} = 'aaa ->bbb
bbb
cp
fn C
ky C
pg C
tp C
vr C
';

$result_nodes_list{'recursive_synindex'} = '';

$result_sections_list{'recursive_synindex'} = '';

$result_sectioning_root{'recursive_synindex'} = '';

$result_headings_list{'recursive_synindex'} = '';

1;
