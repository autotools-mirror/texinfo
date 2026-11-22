use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'east_asian_in_w'} = '*document_root C1
 *before_node_section C7
  *preamble_before_content C2
   *normal_command@documentencoding C1 east_asian_in_w.texi:l1
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{utf-8}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:utf-8}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C4
   {normal_text:This option overrides an include file name section and aaaaa aaaa\\n}
   {normal_text:(}
   *normal_command@w C1 east_asian_in_w.texi:l4
    *brace_container C1
     {normal_text:包含文字}
   {normal_text:).\\n}
  {empty_line:\\n}
  *normal_command@noindent east_asian_in_w.texi:l6
  {ignorable_spaces_after_command:\\n}
  *paragraph C2
  |noindent:{1}
   {normal_text:This option overrides an include file name section and aaaaa aaaa\\n}
   {normal_text:(包含文字).\\n}
  {empty_line:\\n}
';


$result_texis{'east_asian_in_w'} = '@documentencoding utf-8

This option overrides an include file name section and aaaaa aaaa
(@w{包含文字}).

@noindent
This option overrides an include file name section and aaaaa aaaa
(包含文字).

';


$result_texts{'east_asian_in_w'} = '
This option overrides an include file name section and aaaaa aaaa
(包含文字).

This option overrides an include file name section and aaaaa aaaa
(包含文字).

';

$result_errors{'east_asian_in_w'} = '';

$result_nodes_list{'east_asian_in_w'} = '';

$result_sections_list{'east_asian_in_w'} = '';

$result_sectioning_root{'east_asian_in_w'} = '';

$result_headings_list{'east_asian_in_w'} = '';

1;
