use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'accents_in_var_enable_encoding'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@documentencoding C1 l1
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{utf-8}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:utf-8}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *normal_command@var C1 l3
    *brace_container C6
     {normal_text:AA}
     *normal_command@, C1 l3
      *following_arg C1
       {normal_text:c}
     {normal_text: }
     *normal_command@u C1 l3
      *brace_container C1
       {normal_text:r}
     {normal_text: }
     *normal_command@` C1 l3
      *following_arg C1
       {normal_text:e}
   {normal_text:.\\n}
';


$result_texis{'accents_in_var_enable_encoding'} = '@documentencoding utf-8

@var{AA@,c @u{r} @`e}.
';


$result_texts{'accents_in_var_enable_encoding'} = '
AAc, r( e`.
';

$result_errors{'accents_in_var_enable_encoding'} = '';

$result_nodes_list{'accents_in_var_enable_encoding'} = '';

$result_sections_list{'accents_in_var_enable_encoding'} = '';

$result_sectioning_root{'accents_in_var_enable_encoding'} = '';

$result_headings_list{'accents_in_var_enable_encoding'} = '';


$result_converted{'plaintext'}->{'accents_in_var_enable_encoding'} = 'AAÇ R̆ È.
';

1;
