use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'paragraphindent_in_preamble_and_in_document'} = '*document_root C5
 *before_node_section C3
  *preamble_before_content C4
   *@copying C5 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:In copying.\\n}
    {empty_line:\\n}
    *paragraph C1
     {normal_text:Copying second para.\\n}
    *@end C1 l5
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@paragraphindent C1 l7
   |EXTRA
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
 *@node C1 l11 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C10 l12 {test @@paragraphindent in preamble effect in preamble}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:test }
    *@@
    {normal_text:paragraphindent in preamble effect in preamble}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:First para.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Second para.\\n}
  {empty_line:\\n}
  *@paragraphindent C1 l18
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Third para after second paragraphindent.\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
 *postamble_after_end C1
  {text_after_end:\\n}
';


$result_texis{'paragraphindent_in_preamble_and_in_document'} = '@copying
In copying.

Copying second para.
@end copying

@paragraphindent 1

After paragraphindent.

@node Top
@top test @@paragraphindent in preamble effect in preamble

First para.

Second para.

@paragraphindent 3

Third para after second paragraphindent.

@bye

';


$result_texts{'paragraphindent_in_preamble_and_in_document'} = '

After paragraphindent.

test @paragraphindent in preamble effect in preamble
****************************************************

First para.

Second para.


Third para after second paragraphindent.

';

$result_errors{'paragraphindent_in_preamble_and_in_document'} = '';

$result_nodes_list{'paragraphindent_in_preamble_and_in_document'} = '1|Top
 associated_section: test @@paragraphindent in preamble effect in preamble
 associated_title_command: test @@paragraphindent in preamble effect in preamble
';

$result_sections_list{'paragraphindent_in_preamble_and_in_document'} = '1|test @@paragraphindent in preamble effect in preamble
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'paragraphindent_in_preamble_and_in_document'} = 'level: -1
list:
 1|test @@paragraphindent in preamble effect in preamble
';

$result_headings_list{'paragraphindent_in_preamble_and_in_document'} = '';


$result_converted{'info'}->{'paragraphindent_in_preamble_and_in_document'} = Encode::encode('utf-8', 'This is , produced from .

In copying.

 Copying second para.

 After paragraphindent.


File: ,  Node: Top,  Up: (dir)

test @paragraphindent in preamble effect in preamble
****************************************************

First para.

 Second para.

   Third para after second paragraphindent.


Tag Table:
Node: Top88

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
