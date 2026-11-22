use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'form_feeds_in_preamble'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C9
   *normal_command@settitle C1 l1
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:A manual}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\f\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:comment}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l6
   |EXTRA
   |formal_args:A{field}
   |macro_name:{cdfRef}
    *arguments_line C1
     {macro_line: cdfRef{field}\\n}
    {raw:@ref{\\field\\ (Compact Disc fields)}\\n}
    *normal_command@end C1 l8
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\f\\n}
   {empty_line:\\n}
 *normal_command@node C1 l12 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C1 l13 {The}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:The}
    {spaces_after_argument:\\n}
';


$result_texis{'form_feeds_in_preamble'} = '@settitle A manual


@c comment

@macro cdfRef{field}
@ref{\\field\\ (Compact Disc fields)}
@end macro



@node Top
@top The
';


$result_texts{'form_feeds_in_preamble'} = '





The
***
';

$result_errors{'form_feeds_in_preamble'} = '';

$result_nodes_list{'form_feeds_in_preamble'} = '1|Top
 associated_section: The
 associated_title_command: The
';

$result_sections_list{'form_feeds_in_preamble'} = '1|The
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'form_feeds_in_preamble'} = 'level: -1
list:
 1|The
';

$result_headings_list{'form_feeds_in_preamble'} = '';


$result_converted{'info'}->{'form_feeds_in_preamble'} = Encode::encode('utf-8', 'This is , produced from .






File: ,  Node: Top,  Up: (dir)

The
***


Tag Table:
Node: Top33

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
