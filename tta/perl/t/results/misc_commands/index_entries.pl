use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'index_entries'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content
  *index_entry_command@cindex C1 l1
  |EXTRA
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cindex entry}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defindex C1 l3
  |EXTRA
  |misc_args:A{truc}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:truc}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@trucindex C1 l5
  |EXTRA
  |index_entry:I{truc,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:index truc}
    {spaces_after_argument:\\n}
';


$result_texis{'index_entries'} = '@cindex cindex entry

@defindex truc

@trucindex index truc
';


$result_texts{'index_entries'} = '

';

$result_errors{'index_entries'} = '* W l1|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W l5|entry for index `truc\' outside of any node
 warning: entry for index `truc\' outside of any node

';

$result_indices{'index_entries'} = 'cp
fn C
ky C
pg C
tp C
truc
vr C
';

$result_nodes_list{'index_entries'} = '';

$result_sections_list{'index_entries'} = '';

$result_sectioning_root{'index_entries'} = '';

$result_headings_list{'index_entries'} = '';

$result_indices_sort_strings{'index_entries'} = 'cp:
 cindex entry
truc:
 index truc
';

1;
