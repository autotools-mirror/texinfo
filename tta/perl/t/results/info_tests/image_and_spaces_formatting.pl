use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'image_and_spaces_formatting'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C27 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@image C1 l3
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:words}
  {normal_text: }
  *normal_command@image C1 l3
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:words}
  {normal_text: }
  *normal_command@image C1 l3
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:words}
  {normal_text: }
  *normal_command@image C1 l3
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:words}
  {normal_text: }
  *normal_command@image C1 l3
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:words}
  {normal_text: }
  *normal_command@image C1 l3
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:words}
  {normal_text: }
  *normal_command@image C1 l3
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:words}
  {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C15
   {normal_text:Some text }
   *normal_command@image C1 l5
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text: }
   *normal_command@image C1 l5
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text: }
   *normal_command@image C1 l5
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text: }
   *normal_command@image C1 l5
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text: }
   *normal_command@image C1 l5
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text: }
   *normal_command@image C1 l5
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text: }
   *normal_command@image C1 l5
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C15
   {normal_text:Some text }
   *normal_command@image C1 l7
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text: text aaaaaaaaa }
   *normal_command@image C1 l7
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text: text bbbbbbbbbbb }
   *normal_command@image C1 l7
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text: text ccccccccccccc }
   *normal_command@image C1 l7
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text: text ddddddddddddd }
   *normal_command@image C1 l7
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text: text eeeeeeeeeeeeeee }
   *normal_command@image C1 l7
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text: text fffffffffff }
   *normal_command@image C1 l7
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA }
   *normal_command@image C1 l9
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBB }
   *normal_command@image C1 l11
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C5
   {normal_text:Text. }
   *normal_command@image C1 l13
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text:       }
   *normal_command@image C1 l13
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:words}
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'image_and_spaces_formatting'} = '@node Top

@image{words} @image{words} @image{words} @image{words} @image{words} @image{words} @image{words}

Some text @image{words} @image{words} @image{words} @image{words} @image{words} @image{words} @image{words}.

Some text @image{words} text aaaaaaaaa @image{words} text bbbbbbbbbbb @image{words} text ccccccccccccc @image{words} text ddddddddddddd @image{words} text eeeeeeeeeeeeeee @image{words} text fffffffffff @image{words}.

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA @image{words}

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBB @image{words}

Text. @image{words}       @image{words}.

';


$result_texts{'image_and_spaces_formatting'} = '
words words words words words words words

Some text words words words words words words words.

Some text words text aaaaaaaaa words text bbbbbbbbbbb words text ccccccccccccc words text ddddddddddddd words text eeeeeeeeeeeeeee words text fffffffffff words.

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA words

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBB words

Text. words       words.

';

$result_errors{'image_and_spaces_formatting'} = '';

$result_nodes_list{'image_and_spaces_formatting'} = '1|Top
';

$result_sections_list{'image_and_spaces_formatting'} = '';

$result_sectioning_root{'image_and_spaces_formatting'} = '';

$result_headings_list{'image_and_spaces_formatting'} = '';


$result_converted{'info'}->{'image_and_spaces_formatting'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

This is an image words. This is an image words. This is an image words. This is an image words. This is an image words. This is an image words. This is an image words.

Some text This is an image words. This is an image words. This is an image words. This is an image words. This is an image words. This is an image words. This is an image words..

   Some text This is an image words. text aaaaaaaaa This is an image words. text bbbbbbbbbbb This is an image words. text
ccccccccccccc This is an image words. text ddddddddddddd This is an image words. text eeeeeeeeeeeeeee This is an image words. text
fffffffffff This is an image words..

   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA This is an image words.

   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBB 
This is an image words.

   Text.  This is an image words.  This is an image words..


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
