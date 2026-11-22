use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'in_errormsg'} = '*document_root C1
 *before_node_section C8
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *normal_command@anchor C1 l2
  |identifier:{in-ref}
  |is_target:{1}
   *brace_arg C1
    {normal_text:in ref}
  {spaces_after_close_brace:\\n}
  *paragraph C3
   {normal_text:Text. }
   *normal_command@errormsg C1 l3
    *brace_arg C3
     *normal_command@anchor C1 l3
     |identifier:{in-anchor}
     |is_target:{1}
      *brace_arg C1
       {normal_text:in anchor}
     {spaces_after_close_brace: }
     *normal_command@ref C1 l3
      *brace_arg C1
      |node_content:A{0|0}
      |normalized:{in-ref}
       {normal_text:in ref}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@errormsg C1 l5
   *brace_arg C1
    {spaces_before_argument:\\n}
  *normal_command@table C3 l6
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l6
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l7
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:item}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l8
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'in_errormsg'} = '
@anchor{in ref}
Text. @errormsg{@anchor{in anchor} @ref{in ref}}

@errormsg{
}@table @asis
@item item
@end table
';


$result_texts{'in_errormsg'} = 'Text. 

item
';

$result_errors{'in_errormsg'} = '* W l3|@anchor should not appear anywhere inside @errormsg
 warning: @anchor should not appear anywhere inside @errormsg

* W l3|@ref should not appear anywhere inside @errormsg
 warning: @ref should not appear anywhere inside @errormsg

* E l5|@errormsg missing closing brace
 @errormsg missing closing brace

* E l9|misplaced }
 misplaced }

';

$result_nodes_list{'in_errormsg'} = '';

$result_sections_list{'in_errormsg'} = '';

$result_sectioning_root{'in_errormsg'} = '';

$result_headings_list{'in_errormsg'} = '';

1;
