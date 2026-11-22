use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'complex_recursive_synindex'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C38 l2 {chap}
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defindex C1 l4
  |misc_args:A{aaa}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:aaa}
    {spaces_after_argument:\\n}
  *normal_command@defindex C1 l5
  |misc_args:A{bbb}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:bbb}
    {spaces_after_argument:\\n}
  *normal_command@defindex C1 l6
  |misc_args:A{ccc}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ccc}
    {spaces_after_argument:\\n}
  *normal_command@defindex C1 l7
  |misc_args:A{ddd}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ddd}
    {spaces_after_argument:\\n}
  *normal_command@defindex C1 l8
  |misc_args:A{eee}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:eee}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@synindex C1 l10
  |misc_args:A{aaa|bbb}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:aaa bbb}
    {spaces_after_argument:\\n}
  *normal_command@synindex C1 l11
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:bbb aaa}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@synindex C1 l13
  |misc_args:A{ccc|aaa}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ccc aaa}
    {spaces_after_argument:\\n}
  *normal_command@synindex C1 l14
  |misc_args:A{ddd|bbb}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ddd bbb}
    {spaces_after_argument:\\n}
  *index_entry_command@eeeindex C1 l15
  |element_node:{chap}
  |index_entry:I{eee,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:e before synindex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@synindex C1 l17
  |misc_args:A{eee|ddd}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:eee ddd}
    {spaces_after_argument:\\n}
  *normal_command@synindex C1 l18
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:bbb eee}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cccindex C1 l20
  |element_node:{chap}
  |index_entry:I{ccc,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c index}
    {spaces_after_argument:\\n}
  *index_entry_command@bbbindex C1 l21
  |element_node:{chap}
  |index_entry:I{bbb,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:b entry}
    {spaces_after_argument:\\n}
  *index_entry_command@aaaindex C1 l22
  |element_node:{chap}
  |index_entry:I{aaa,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a entry}
    {spaces_after_argument:\\n}
  *index_entry_command@dddindex C1 l23
  |element_node:{chap}
  |index_entry:I{ddd,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:d index}
    {spaces_after_argument:\\n}
  *index_entry_command@eeeindex C1 l24
  |element_node:{chap}
  |index_entry:I{eee,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:e index}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:bbb\\n}
  *normal_command@printindex C1 l27
  |global_command_number:{1}
  |misc_args:A{bbb}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:bbb}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:aaa\\n}
  *normal_command@printindex C1 l30
  |global_command_number:{2}
  |misc_args:A{aaa}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:aaa}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:ccc\\n}
  *normal_command@printindex C1 l33
  |global_command_number:{3}
  |misc_args:A{ccc}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ccc}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:ddd\\n}
  *normal_command@printindex C1 l36
  |global_command_number:{4}
  |misc_args:A{ddd}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ddd}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:eee\\n}
  *normal_command@printindex C1 l39
  |global_command_number:{5}
  |misc_args:A{eee}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:eee}
    {spaces_after_argument:\\n}
';


$result_texis{'complex_recursive_synindex'} = '@node Top
@node chap

@defindex aaa
@defindex bbb
@defindex ccc
@defindex ddd
@defindex eee

@synindex aaa bbb
@synindex bbb aaa

@synindex ccc aaa
@synindex ddd bbb
@eeeindex e before synindex

@synindex eee ddd
@synindex bbb eee

@cccindex c index
@bbbindex b entry
@aaaindex a entry
@dddindex d index
@eeeindex e index

bbb
@printindex bbb

aaa
@printindex aaa

ccc
@printindex ccc

ddd
@printindex ddd

eee
@printindex eee
';


$result_texts{'complex_recursive_synindex'} = '





bbb

aaa

ccc

ddd

eee
';

$result_errors{'complex_recursive_synindex'} = '* W l11|@synindex leads to a merging of bbb in itself, ignoring
 warning: @synindex leads to a merging of bbb in itself, ignoring

* W l18|@synindex leads to a merging of bbb in itself, ignoring
 warning: @synindex leads to a merging of bbb in itself, ignoring

* W l30|printing an index `aaa\' merged in another one, `bbb\'
 warning: printing an index `aaa\' merged in another one, `bbb\'

* W l33|printing an index `ccc\' merged in another one, `bbb\'
 warning: printing an index `ccc\' merged in another one, `bbb\'

* W l36|printing an index `ddd\' merged in another one, `bbb\'
 warning: printing an index `ddd\' merged in another one, `bbb\'

* W l39|printing an index `eee\' merged in another one, `bbb\'
 warning: printing an index `eee\' merged in another one, `bbb\'

* W l2|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_indices{'complex_recursive_synindex'} = 'aaa ->bbb
bbb
ccc ->bbb
cp
ddd ->bbb
eee ->bbb
fn C
ky C
pg C
tp C
vr C
';

$result_nodes_list{'complex_recursive_synindex'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'complex_recursive_synindex'} = '';

$result_sectioning_root{'complex_recursive_synindex'} = '';

$result_headings_list{'complex_recursive_synindex'} = '';

$result_indices_sort_strings{'complex_recursive_synindex'} = 'bbb:
 a entry
 b entry
 c index
 d index
 e before synindex
 e index
';

1;
