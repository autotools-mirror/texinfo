use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_category_or_no_name'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content
  *normal_command@deffn C3 l1
   *def_line C1 l1
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffn}
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:no category no name\\n}
   *normal_command@end C1 l3
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l5
   *def_line C1 l5
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffn}
    *block_line_arg C3
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l5
       {normal_text:only category}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:no name\\n}
   *normal_command@end C1 l7
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C5 l9
   *def_line C1 l9
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:c}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:d}
     {spaces_after_argument: \\n}
   *normal_command@deffnx C1 l10
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C3
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:deffnx_category}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l11
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C1
     {spaces_before_argument: \\n}
   *def_item C1
    *paragraph C1
     {normal_text:with deffnx missing category or name\\n}
   *normal_command@end C1 l13
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'no_category_or_no_name'} = '@deffn
no category no name
@end deffn

@deffn {only category}
no name
@end deffn

@deffn a b c d 
@deffnx deffnx_category
@deffnx 
with deffnx missing category or name
@end deffn
';


$result_texts{'no_category_or_no_name'} = 'no category no name

only category: 
no name

a: b c d
deffnx_category: 
with deffnx missing category or name
';

$result_errors{'no_category_or_no_name'} = '* W l1|missing category for @deffn
 warning: missing category for @deffn

* W l5|missing name for @deffn
 warning: missing name for @deffn

* W l9|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l10|missing name for @deffnx
 warning: missing name for @deffnx

* W l11|missing category for @deffnx
 warning: missing category for @deffnx

';

$result_nodes_list{'no_category_or_no_name'} = '';

$result_sections_list{'no_category_or_no_name'} = '';

$result_sectioning_root{'no_category_or_no_name'} = '';

$result_headings_list{'no_category_or_no_name'} = '';

$result_indices_sort_strings{'no_category_or_no_name'} = 'fn:
 b
';

1;
