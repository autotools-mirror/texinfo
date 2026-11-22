use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'non_break_spaces'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content C2
   *@documentencoding C1 non_break_spaces.texi:l1
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{utf-8}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:utf-8}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C3 non_break_spaces.texi:l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:NO-BREAK SPACE: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbb\\n}
   {normal_text:NARROW NO-BREAK SPACE: ccccccccccccccccccccccccccccccccccccccccccccccccccccccccc dddddddddddddddddddd\\n}
';


$result_texis{'non_break_spaces'} = '@documentencoding utf-8

@node Top

NO-BREAK SPACE: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbb
NARROW NO-BREAK SPACE: ccccccccccccccccccccccccccccccccccccccccccccccccccccccccc dddddddddddddddddddd
';


$result_texts{'non_break_spaces'} = '

NO-BREAK SPACE: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbb
NARROW NO-BREAK SPACE: ccccccccccccccccccccccccccccccccccccccccccccccccccccccccc dddddddddddddddddddd
';

$result_errors{'non_break_spaces'} = '';

$result_nodes_list{'non_break_spaces'} = '1|Top
';

$result_sections_list{'non_break_spaces'} = '';

$result_sectioning_root{'non_break_spaces'} = '';

$result_headings_list{'non_break_spaces'} = '';

1;
