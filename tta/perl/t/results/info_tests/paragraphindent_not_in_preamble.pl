use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'paragraphindent_not_in_preamble'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@copying C5 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:In copying.\\n}
    {empty_line:\\n}
    *paragraph C1
     {normal_text:Copying second para.\\n}
    *normal_command@end C1 l5
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l7 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C10 l8 {test @@paragraphindent effect in preamble}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:test }
    *normal_command@@
    {normal_text:paragraphindent effect in preamble}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:First para.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Before paragraphindent.\\n}
  {empty_line:\\n}
  *normal_command@paragraphindent C1 l14
  |global_command_number:{1}
  |misc_args:A{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:After paragraphindent.\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
 *postamble_after_end C1
  {text_after_end:\\n}
';


$result_texis{'paragraphindent_not_in_preamble'} = '@copying
In copying.

Copying second para.
@end copying

@node Top
@top test @@paragraphindent effect in preamble

First para.

Before paragraphindent.

@paragraphindent 1

After paragraphindent.

@bye

';


$result_texts{'paragraphindent_not_in_preamble'} = '
test @paragraphindent effect in preamble
****************************************

First para.

Before paragraphindent.


After paragraphindent.

';

$result_errors{'paragraphindent_not_in_preamble'} = '';

$result_nodes_list{'paragraphindent_not_in_preamble'} = '1|Top
 associated_section: test @@paragraphindent effect in preamble
 associated_title_command: test @@paragraphindent effect in preamble
';

$result_sections_list{'paragraphindent_not_in_preamble'} = '1|test @@paragraphindent effect in preamble
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'paragraphindent_not_in_preamble'} = 'level: -1
list:
 1|test @@paragraphindent effect in preamble
';

$result_headings_list{'paragraphindent_not_in_preamble'} = '';


$result_converted{'info'}->{'paragraphindent_not_in_preamble'} = Encode::encode('utf-8', 'This is , produced from .

In copying.

   Copying second para.


File: ,  Node: Top,  Up: (dir)

test @paragraphindent effect in preamble
****************************************

First para.

   Before paragraphindent.

 After paragraphindent.


Tag Table:
Node: Top65

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
