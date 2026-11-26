use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'paragraph_indent_asis'} = '*document_root C1
 *before_node_section C5
  *preamble C3
   *normal_command@paragraphindent C1 l1
   |global_command_number:{1}
   |misc_args:A{asis}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:asis}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   {spaces_before_paragraph:  }
  *paragraph C2
   {normal_text:para\\n}
   {normal_text:  fff\\n}
  {empty_line:\\n}
  *normal_command@quotation C4 l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {spaces_before_paragraph:  }
   *paragraph C1
    {normal_text:in quotation\\n}
   *normal_command@end C1 l8
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'paragraph_indent_asis'} = '@paragraphindent asis

  para
  fff

@quotation
  in quotation
@end quotation

';


$result_texts{'paragraph_indent_asis'} = '
para
  fff

in quotation

';

$result_errors{'paragraph_indent_asis'} = '';

$result_nodes_list{'paragraph_indent_asis'} = '';

$result_sections_list{'paragraph_indent_asis'} = '';

$result_sectioning_root{'paragraph_indent_asis'} = '';

$result_headings_list{'paragraph_indent_asis'} = '';


$result_converted{'plaintext'}->{'paragraph_indent_asis'} = '  para fff

       in quotation

';


$result_converted{'html_text'}->{'paragraph_indent_asis'} = '
<p>para
  fff
</p>
<blockquote class="quotation">
<p>in quotation
</p></blockquote>

';

1;
