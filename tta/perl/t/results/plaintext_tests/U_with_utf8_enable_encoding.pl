use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'U_with_utf8_enable_encoding'} = '*document_root C1
 *before_node_section C2
  *preamble C1
   *normal_command@documentencoding C1 l1
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{utf-8}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:utf-8}
     {spaces_after_argument:\\n}
  *paragraph C2
   *normal_command@U C1 l2
    *brace_arg C1
     {normal_text:00FF}
   {normal_text: (should be a real y-dieresis in UTF-8).\\n}
';


$result_texis{'U_with_utf8_enable_encoding'} = '@documentencoding utf-8
@U{00FF} (should be a real y-dieresis in UTF-8).
';


$result_texts{'U_with_utf8_enable_encoding'} = 'U+00FF (should be a real y-dieresis in UTF-8).
';

$result_errors{'U_with_utf8_enable_encoding'} = '';

$result_nodes_list{'U_with_utf8_enable_encoding'} = '';

$result_sections_list{'U_with_utf8_enable_encoding'} = '';

$result_sectioning_root{'U_with_utf8_enable_encoding'} = '';

$result_headings_list{'U_with_utf8_enable_encoding'} = '';


$result_converted{'plaintext'}->{'U_with_utf8_enable_encoding'} = 'ÿ (should be a real y-dieresis in UTF-8).
';

1;
