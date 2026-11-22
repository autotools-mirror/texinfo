use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'formats_only_title_comments'} = '*document_root C1
 *before_node_section C10
  *preamble_before_content
  *normal_command@itemize C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C2
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment itemize}
      {spaces_after_argument:\\n}
    *paragraph C1
     {normal_text:before first itemize\\n}
   *normal_command@end C1 l4
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C3 l6
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment on enumerate line}
       {spaces_after_argument:\\n}
   *before_item C2
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment enumerate}
      {spaces_after_argument:\\n}
    *paragraph C1
     {normal_text:before first enumerate\\n}
   *normal_command@end C1 l9
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C3 l11
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@emph l11
     {spaces_after_argument:\\n}
   *before_item C2
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment table}
      {spaces_after_argument:\\n}
    *paragraph C1
     {normal_text:before first table\\n}
   *normal_command@end C1 l14
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@vtable C3 l16
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *normal_command@asis l16
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment on vtable line}
       {spaces_after_argument:\\n}
   *before_item C1
    *paragraph C1
     {normal_text:before first vtable\\n}
   *normal_command@end C1 l18
   |text_arg:{vtable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:vtable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@multitable C3 l20
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@columnfractions C1 l20
     |misc_args:A{0.5|0.5}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.5 0.5}
       {spaces_after_argument:\\n}
   *before_item C2
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment multitable}
      {spaces_after_argument:\\n}
    *paragraph C1
     {normal_text:before first multitable\\n}
   *normal_command@end C1 l23
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'formats_only_title_comments'} = '@itemize
@c comment itemize
before first itemize
@end itemize

@enumerate @c comment on enumerate line
@c comment enumerate
before first enumerate
@end enumerate

@table @emph
@c comment table
before first table
@end table

@vtable @asis @c comment on vtable line
before first vtable
@end vtable

@multitable @columnfractions 0.5 0.5
@c comment multitable
before first multitable
@end multitable
';


$result_texts{'formats_only_title_comments'} = 'before first itemize

before first enumerate

before first table

before first vtable

before first multitable
';

$result_errors{'formats_only_title_comments'} = '* W l1|@itemize has text but no @item
 warning: @itemize has text but no @item

* W l6|@enumerate has text but no @item
 warning: @enumerate has text but no @item

* W l11|@table has text but no @item
 warning: @table has text but no @item

* W l16|@vtable has text but no @item
 warning: @vtable has text but no @item

* W l20|@multitable has text but no @item
 warning: @multitable has text but no @item

';

$result_nodes_list{'formats_only_title_comments'} = '';

$result_sections_list{'formats_only_title_comments'} = '';

$result_sectioning_root{'formats_only_title_comments'} = '';

$result_headings_list{'formats_only_title_comments'} = '';

1;
