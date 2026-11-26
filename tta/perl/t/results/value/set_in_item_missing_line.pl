use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'set_in_item_missing_line'} = '*document_root C1
 *before_node_section C4
  *preamble
  *normal_command@table C4 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l1
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l2
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:xx }
       *normal_command@set C1
       |misc_args:A{n|}
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:n}
         {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l3
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:jj}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l4
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C4 l6
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l6
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l7
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:cxx }
       *normal_command@set C1
       |misc_args:A{cn|}
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:cn}
         *normal_command@c C1
          *line_arg C2
           {rawline_text:}
           {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l8
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:jj}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l9
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'set_in_item_missing_line'} = '@table @code
@item xx @set n
@item jj
@end table

@table @code
@item cxx @set cn@c
@item jj
@end table
';


$result_texts{'set_in_item_missing_line'} = 'xx 
jj

cxx 
jj
';

$result_errors{'set_in_item_missing_line'} = '* W l2|@set should only appear at the beginning of a line
 warning: @set should only appear at the beginning of a line

* W l7|@set should only appear at the beginning of a line
 warning: @set should only appear at the beginning of a line

';

$result_nodes_list{'set_in_item_missing_line'} = '';

$result_sections_list{'set_in_item_missing_line'} = '';

$result_sectioning_root{'set_in_item_missing_line'} = '';

$result_headings_list{'set_in_item_missing_line'} = '';

1;
