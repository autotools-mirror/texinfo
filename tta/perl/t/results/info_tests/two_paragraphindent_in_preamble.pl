use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'two_paragraphindent_in_preamble'} = '*document_root C5
 *before_node_section C3
  *preamble_before_content C6
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
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@paragraphindent C1 l7
   |EXTRA
   |global_command_number:{1}
   |misc_args:A{1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@paragraphindent C1 l9
   |EXTRA
   |global_command_number:{2}
   |misc_args:A{6}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:6}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:After two paragraphindent.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l13 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C6 l14 {test @@paragraphindent in preamble effect in preamble}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:test }
    *normal_command@@
    {normal_text:paragraphindent in preamble effect in preamble}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:First para.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Second para.\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
 *postamble_after_end C1
  {text_after_end:\\n}
';


$result_texis{'two_paragraphindent_in_preamble'} = '@copying
In copying.

Copying second para.
@end copying

@paragraphindent 1

@paragraphindent 6

After two paragraphindent.

@node Top
@top test @@paragraphindent in preamble effect in preamble

First para.

Second para.

@bye

';


$result_texts{'two_paragraphindent_in_preamble'} = '


After two paragraphindent.

test @paragraphindent in preamble effect in preamble
****************************************************

First para.

Second para.

';

$result_errors{'two_paragraphindent_in_preamble'} = '';

$result_nodes_list{'two_paragraphindent_in_preamble'} = '1|Top
 associated_section: test @@paragraphindent in preamble effect in preamble
 associated_title_command: test @@paragraphindent in preamble effect in preamble
';

$result_sections_list{'two_paragraphindent_in_preamble'} = '1|test @@paragraphindent in preamble effect in preamble
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'two_paragraphindent_in_preamble'} = 'level: -1
list:
 1|test @@paragraphindent in preamble effect in preamble
';

$result_headings_list{'two_paragraphindent_in_preamble'} = '';


$result_converted{'info'}->{'two_paragraphindent_in_preamble'} = Encode::encode('utf-8', 'This is , produced from .

In copying.

      Copying second para.

      After two paragraphindent.


File: ,  Node: Top,  Up: (dir)

test @paragraphindent in preamble effect in preamble
****************************************************

First para.

      Second para.


Tag Table:
Node: Top102

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
