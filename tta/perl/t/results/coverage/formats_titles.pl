use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'formats_titles'} = '*document_root C1
 *before_node_section C10
  *preamble_before_content
  *@itemize C4 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C1
    *paragraph C1
     {normal_text:before first itemize\\n}
   *@item C2 l3
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:item\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C1
    *paragraph C1
     {normal_text:before first enumerate\\n}
   *@item C2 l8
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:enum\\n}
   *@end C1 l9
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C4 l11
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@emph l11
     {spaces_after_argument:\\n}
   *before_item C1
    *paragraph C1
     {normal_text:before first table\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l13
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:tab}
       {spaces_after_argument:\\n}
   *@end C1 l14
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@vtable C4 l16
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@asis l16
     {spaces_after_argument:\\n}
   *before_item C1
    *paragraph C1
     {normal_text:before first vtable\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l18
     |EXTRA
     |index_entry:I{vr,1}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:vtab}
       {spaces_after_argument:\\n}
   *@end C1 l19
   |EXTRA
   |text_arg:{vtable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:vtable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@multitable C4 l21
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@columnfractions C1 l21
     |EXTRA
     |misc_args:A{0.5|0.5}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.5 0.5}
       {spaces_after_argument:\\n}
   *before_item C1
    *paragraph C1
     {normal_text:before first multitable\\n}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l23
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:item multit }
     *@tab C2 l23
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:tab multit\\n}
   *@end C1 l24
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'formats_titles'} = '@itemize
before first itemize
@item item
@end itemize

@enumerate
before first enumerate
@item enum
@end enumerate

@table @emph
before first table
@item tab
@end table

@vtable @asis
before first vtable
@item vtab
@end vtable

@multitable @columnfractions 0.5 0.5
before first multitable
@item item multit @tab tab multit
@end multitable
';


$result_texts{'formats_titles'} = 'before first itemize
item

before first enumerate
1. enum

before first table
tab

before first vtable
vtab

before first multitable
item multit tab multit
';

$result_errors{'formats_titles'} = '* W l18|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

';

$result_nodes_list{'formats_titles'} = '';

$result_sections_list{'formats_titles'} = '';

$result_sectioning_root{'formats_titles'} = '';

$result_headings_list{'formats_titles'} = '';

$result_indices_sort_strings{'formats_titles'} = 'vr:
 vtab
';

1;
