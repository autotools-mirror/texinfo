use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'indent_before_macro_definition_and_other'} = '*document_root C1
 *before_node_section C13
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@indent l2
   {ignorable_spaces_after_command:\\n}
  *normal_command@author C1 l3
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:someone}
    {spaces_after_argument:\\n}
  *normal_command@image C1 l4
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:my_image}
  {normal_text:\\n}
  *normal_command@vskip C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:0pt plus 1filll}
    {spaces_after_argument:\\n}
  *normal_command@html C3 l6
  >SOURCEMARKS
  >ignored_conditional_block<1>
   >*normal_command@ifnothtml C3 l9
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
    >{raw:not html\\n}
    >*normal_command@end C1 l11
    >|text_arg:{ifnothtml}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnothtml}
      >{spaces_after_argument:\\n}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *rawpreformatted C1
    {normal_text:<code>in c</code>\\n}
   *normal_command@end C1 l8
   |text_arg:{html}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:html}
     {spaces_after_argument:\\n}
  *normal_command@setchapternewpage C1 l12
  |misc_args:A{on}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:on}
    {spaces_after_argument:\\n}
  *normal_command@anchor C1 l13
  |identifier:{spot}
  |is_target:{1}
   *brace_arg C1
    {normal_text:spot}
  {spaces_after_close_brace:\\n}
  *index_entry_command@cpindex C1 l14
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ei}
    {spaces_after_argument:\\n}
  *normal_command@macro C3 l15
  |formal_args:A{g}
  |macro_name:{aaa}
   *arguments_line C1
    {macro_line: aaa {g}\\n}
   {raw:ll /g/\\n}
   *normal_command@end C1 l17
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *paragraph C1
  |indent:{1}
   {normal_text:HHERE\\n}
';


$result_texis{'indent_before_macro_definition_and_other'} = '
@indent
@author someone
@image{my_image}
@vskip 0pt plus 1filll
@html
<code>in c</code>
@end html
@setchapternewpage on
@anchor{spot}
@cpindex ei
@macro aaa {g}
ll /g/
@end macro
HHERE
';


$result_texts{'indent_before_macro_definition_and_other'} = 'someone
my_image
<code>in c</code>
HHERE
';

$result_errors{'indent_before_macro_definition_and_other'} = '* W l3|@author not meaningful outside `@titlepage\', `@documentinfo\' and `@quotation\' environments
 warning: @author not meaningful outside `@titlepage\', `@documentinfo\' and `@quotation\' environments

* W l14|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'indent_before_macro_definition_and_other'} = '';

$result_sections_list{'indent_before_macro_definition_and_other'} = '';

$result_sectioning_root{'indent_before_macro_definition_and_other'} = '';

$result_headings_list{'indent_before_macro_definition_and_other'} = '';

$result_indices_sort_strings{'indent_before_macro_definition_and_other'} = 'cp:
 ei
';


$result_converted{'plaintext'}->{'indent_before_macro_definition_and_other'} = '[my_image]
   HHERE
';

$result_converted_sort_strings{'plaintext'}->{'indent_before_macro_definition_and_other'} = 'cp:
 ei
';

$result_converted_errors{'plaintext'}->{'indent_before_macro_definition_and_other'} = '* W l4|could not find @image file `my_image.txt\' nor alternate text
 warning: could not find @image file `my_image.txt\' nor alternate text

';


$result_converted{'html_text'}->{'indent_before_macro_definition_and_other'} = '<img class="image" src="my_image.jpg" alt="my_image">
<code>in c</code>
<a class="anchor" id="spot"></a><a class="index-entry-id" id="index-ei"></a>
<p>HHERE
</p>';

$result_converted_errors{'html_text'}->{'indent_before_macro_definition_and_other'} = '* W l4|@image file `my_image\' (for HTML) not found, using `my_image.jpg\'
 warning: @image file `my_image\' (for HTML) not found, using `my_image.jpg\'

';

1;
