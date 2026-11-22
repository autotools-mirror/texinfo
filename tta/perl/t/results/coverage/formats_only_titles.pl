use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'formats_only_titles'} = '*document_root C1
 *before_node_section C10
  *preamble_before_content
  *@itemize C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C1
    *paragraph C1
     {normal_text:before first itemize\\n}
   *@end C1 l3
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C3 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C1
    *paragraph C1
     {normal_text:before first enumerate\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C3 l9
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@emph l9
     {spaces_after_argument:\\n}
   *before_item C1
    *paragraph C1
     {normal_text:before first table\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@vtable C3 l13
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@asis l13
     {spaces_after_argument:\\n}
   *before_item C1
    *paragraph C1
     {normal_text:before first vtable\\n}
   *@end C1 l15
   |EXTRA
   |text_arg:{vtable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:vtable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@multitable C3 l17
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@columnfractions C1 l17
     |EXTRA
     |misc_args:A{0.5|0.5}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.5 0.5}
       {spaces_after_argument:\\n}
   *before_item C1
    *paragraph C1
     {normal_text:before first multitable\\n}
   *@end C1 l19
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'formats_only_titles'} = '@itemize
before first itemize
@end itemize

@enumerate
before first enumerate
@end enumerate

@table @emph
before first table
@end table

@vtable @asis
before first vtable
@end vtable

@multitable @columnfractions 0.5 0.5
before first multitable
@end multitable
';


$result_texts{'formats_only_titles'} = 'before first itemize

before first enumerate

before first table

before first vtable

before first multitable
';

$result_errors{'formats_only_titles'} = '* W l1|@itemize has text but no @item
 warning: @itemize has text but no @item

* W l5|@enumerate has text but no @item
 warning: @enumerate has text but no @item

* W l9|@table has text but no @item
 warning: @table has text but no @item

* W l13|@vtable has text but no @item
 warning: @vtable has text but no @item

* W l17|@multitable has text but no @item
 warning: @multitable has text but no @item

';

$result_nodes_list{'formats_only_titles'} = '';

$result_sections_list{'formats_only_titles'} = '';

$result_sectioning_root{'formats_only_titles'} = '';

$result_headings_list{'formats_only_titles'} = '';

1;
