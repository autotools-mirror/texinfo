use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'brace_commands_spaces_end_of_lines'} = '*document_root C1
 *before_node_section C18
  *preamble_before_content
  *normal_command@image C1 l1
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C2
    {spaces_before_argument:\\n}
    {normal_text:a}
  {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@image C1 l4
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C2
    {spaces_before_argument: \\n}
    {normal_text:a}
  {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@image C2 l7
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:a}
   *brace_arg C2
    {spaces_before_argument:\\n}
    {normal_text:b}
  {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@image C2 l10
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:a}
   *brace_arg C2
    {spaces_before_argument: \\n}
    {normal_text:b}
  {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@image C2 l13
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:a}
   *brace_arg C3
    {spaces_before_argument:\\n}
    {spaces_before_argument: }
    {normal_text:b}
  {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@image C2 l16
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:a}
   *brace_arg C3
    {spaces_before_argument: \\n}
    {spaces_before_argument: }
    {normal_text:b}
  {normal_text:\\n}
';


$result_texis{'brace_commands_spaces_end_of_lines'} = '@image{
a}

@image{ 
a}

@image{a,
b}

@image{a, 
b}

@image{a,
 b}

@image{a, 
 b}
';


$result_texts{'brace_commands_spaces_end_of_lines'} = 'a

a

a

a

a

a
';

$result_errors{'brace_commands_spaces_end_of_lines'} = '';

$result_nodes_list{'brace_commands_spaces_end_of_lines'} = '';

$result_sections_list{'brace_commands_spaces_end_of_lines'} = '';

$result_sectioning_root{'brace_commands_spaces_end_of_lines'} = '';

$result_headings_list{'brace_commands_spaces_end_of_lines'} = '';


$result_converted{'xml'}->{'brace_commands_spaces_end_of_lines'} = '<image><imagefile>
a</imagefile></image>

<image><imagefile> 
a</imagefile></image>

<image><imagefile>a</imagefile><imagewidth>
b</imagewidth></image>

<image><imagefile>a</imagefile><imagewidth> 
b</imagewidth></image>

<image><imagefile>a</imagefile><imagewidth>
 b</imagewidth></image>

<image><imagefile>a</imagefile><imagewidth> 
 b</imagewidth></image>
';

1;
