use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'wrong_braces_with_end_of_lines'} = '*document_root C1
 *before_node_section C4
  *preamble
  *normal_command@deffn C3 l1
   *def_line C1 l1
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C8
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:category}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:args}
     {spaces: }
     *def_arg C1
      *bracketed_arg C3 l1
       {spaces_before_argument:   }
       >SOURCEMARKS
       >defline_continuation<1><p:1>
       {normal_text:more args}
       {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C3
     {normal_text:deffn with }
     *normal_command@{
     {normal_text:\\n}
   *normal_command@end C1 l4
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument: \\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l6
   *def_line C1 l6
   |def_command:{deffn}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffn}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:category}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:args}
     {spaces:    }
     >SOURCEMARKS
     >defline_continuation<2><p:2>
     *def_arg C1
      *def_line_arg C1
       {normal_text:more}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:args}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C3
     {normal_text:deffn with }
     *normal_command@}
     {normal_text:\\n}
   *normal_command@end C1 l9
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument: \\n}
';


$result_texis{'wrong_braces_with_end_of_lines'} = '@deffn category name args {   more args
}deffn with @{
@end deffn 

@deffn category name args    more args
deffn with @}
@end deffn 
';


$result_texts{'wrong_braces_with_end_of_lines'} = 'category: name args more args
deffn with {

category: name args    more args
deffn with }
';

$result_errors{'wrong_braces_with_end_of_lines'} = '* E l1|misplaced {
 misplaced {

* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l6|misplaced }
 misplaced }

* W l7|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'wrong_braces_with_end_of_lines'} = '';

$result_sections_list{'wrong_braces_with_end_of_lines'} = '';

$result_sectioning_root{'wrong_braces_with_end_of_lines'} = '';

$result_headings_list{'wrong_braces_with_end_of_lines'} = '';

$result_indices_sort_strings{'wrong_braces_with_end_of_lines'} = 'fn:
 name
 name
';

1;
