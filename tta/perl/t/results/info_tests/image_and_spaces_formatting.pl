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
 *@node C27 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@image C1 l3
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {words}
  { }
  *@image C1 l3
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {words}
  { }
  *@image C1 l3
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {words}
  { }
  *@image C1 l3
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {words}
  { }
  *@image C1 l3
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {words}
  { }
  *@image C1 l3
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {words}
  { }
  *@image C1 l3
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {words}
  {\\n}
  {empty_line:\\n}
  *paragraph C15
   {Some text }
   *@image C1 l5
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   { }
   *@image C1 l5
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   { }
   *@image C1 l5
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   { }
   *@image C1 l5
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   { }
   *@image C1 l5
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   { }
   *@image C1 l5
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   { }
   *@image C1 l5
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   {.\\n}
  {empty_line:\\n}
  *paragraph C15
   {Some text }
   *@image C1 l7
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   { text aaaaaaaaa }
   *@image C1 l7
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   { text bbbbbbbbbbb }
   *@image C1 l7
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   { text ccccccccccccc }
   *@image C1 l7
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   { text ddddddddddddd }
   *@image C1 l7
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   { text eeeeeeeeeeeeeee }
   *@image C1 l7
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   { text fffffffffff }
   *@image C1 l7
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   {.\\n}
  {empty_line:\\n}
  *paragraph C3
   {AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA }
   *@image C1 l9
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBB }
   *@image C1 l11
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {Text. }
   *@image C1 l13
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   {       }
   *@image C1 l13
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {words}
   {.\\n}
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
