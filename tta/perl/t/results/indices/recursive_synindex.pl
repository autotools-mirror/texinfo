use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'recursive_synindex'} = '*document_root C1
 *before_node_section C4
  *@defindex C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{aaa}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {aaa}
  *@defindex C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{bbb}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {bbb}
  *@synindex C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{aaa|bbb}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {aaa bbb}
  *@synindex C1 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
    {bbb aaa}
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
