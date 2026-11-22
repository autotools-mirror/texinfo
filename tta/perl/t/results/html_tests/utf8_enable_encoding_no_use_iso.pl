use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'utf8_enable_encoding_no_use_iso'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@documentencoding C1 l1
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{utf-8}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:utf-8}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   {normal_text:AA }
   *normal_command@^ C1 l3
    *following_arg C1
     {normal_text:e}
   {normal_text: --- -- \'` \'\' ``}
';


$result_texis{'utf8_enable_encoding_no_use_iso'} = '@documentencoding utf-8

AA @^e --- -- \'` \'\' ``';


$result_texts{'utf8_enable_encoding_no_use_iso'} = '
AA e^ -- - \'` " "';

$result_errors{'utf8_enable_encoding_no_use_iso'} = '';

$result_nodes_list{'utf8_enable_encoding_no_use_iso'} = '';

$result_sections_list{'utf8_enable_encoding_no_use_iso'} = '';

$result_sectioning_root{'utf8_enable_encoding_no_use_iso'} = '';

$result_headings_list{'utf8_enable_encoding_no_use_iso'} = '';


$result_converted{'html_text'}->{'utf8_enable_encoding_no_use_iso'} = '
<p>AA ê — – ’‘ ” “</p>';

1;
