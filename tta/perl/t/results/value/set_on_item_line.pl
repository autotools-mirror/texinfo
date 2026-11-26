use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'set_on_item_line'} = '*document_root C1
 *before_node_section C4
  *preamble
  *normal_command@table C5 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l1
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l2
      *line_arg C2
       {spaces_before_argument: }
       *normal_command@set C1
       |misc_args:A{ca|b}
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:ca b}
         *normal_command@c C1
          *line_arg C2
           {rawline_text:}
           {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C2
      {normal_text:item text\\n}
      {normal_text:in item\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l5
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:cjj }
       *normal_command@set C1
       |misc_args:A{cj|}
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:cj}
         *normal_command@c C1
          *line_arg C2
           {rawline_text:}
           {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:line\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l7
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:cvvv }
       *normal_command@set C1
       |misc_args:A{cg|}
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:cg}
         *normal_command@c C1
          *line_arg C2
           {rawline_text:}
           {spaces_after_argument:\\n}
   *normal_command@end C1 l8
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C5 l10
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l10
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l11
      *line_arg C2
       {spaces_before_argument: }
       *normal_command@set C1
       |misc_args:A{a|b}
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:a b}
         {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C2
      {normal_text:item text\\n}
      {normal_text:in item\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l14
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:jj }
       *normal_command@set C1
       |misc_args:A{j|}
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:j}
         {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:line\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l16
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:vvv }
       *normal_command@set C1
       |misc_args:A{g|}
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:g}
         {spaces_after_argument:\\n}
   *normal_command@end C1 l17
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'set_on_item_line'} = '@table @code
@item @set ca b@c
item text
in item
@item cjj @set cj@c
line
@item cvvv @set cg@c
@end table

@table @code
@item @set a b
item text
in item
@item jj @set j
line
@item vvv @set g
@end table
';


$result_texts{'set_on_item_line'} = '
item text
in item
cjj 
line
cvvv 


item text
in item
jj 
line
vvv 
';

$result_errors{'set_on_item_line'} = '* W l2|@set should only appear at the beginning of a line
 warning: @set should only appear at the beginning of a line

* W l5|@set should only appear at the beginning of a line
 warning: @set should only appear at the beginning of a line

* W l7|@set should only appear at the beginning of a line
 warning: @set should only appear at the beginning of a line

* W l11|@set should only appear at the beginning of a line
 warning: @set should only appear at the beginning of a line

* W l14|@set should only appear at the beginning of a line
 warning: @set should only appear at the beginning of a line

* W l16|@set should only appear at the beginning of a line
 warning: @set should only appear at the beginning of a line

';

$result_nodes_list{'set_on_item_line'} = '';

$result_sections_list{'set_on_item_line'} = '';

$result_sectioning_root{'set_on_item_line'} = '';

$result_headings_list{'set_on_item_line'} = '';

1;
