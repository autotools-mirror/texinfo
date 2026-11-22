use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'protected_brace'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@deffn C2 l1
   *def_line C1 l1
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *normal_command@{
     {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'protected_brace'} = '@deffn c @{
@end deffn
';


$result_texts{'protected_brace'} = 'c: {
';

$result_errors{'protected_brace'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'protected_brace'} = '';

$result_sections_list{'protected_brace'} = '';

$result_sectioning_root{'protected_brace'} = '';

$result_headings_list{'protected_brace'} = '';

$result_indices_sort_strings{'protected_brace'} = 'fn:
 {
';


$result_converted{'plaintext'}->{'protected_brace'} = ' -- c: {
';

$result_converted_sort_strings{'plaintext'}->{'protected_brace'} = 'fn:
 {
';

1;
