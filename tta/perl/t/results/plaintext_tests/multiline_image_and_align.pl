use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multiline_image_and_align'} = '*document_root C1
 *before_node_section C10
  *preamble_before_content
  *@center C1 l1
   *line_arg C3
    {spaces_before_argument: }
    *@image C1 l1
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@center C1 l3
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:CCCC }
    *@image C1 l3
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {spaces_after_argument: \\n}
  {empty_line:\\n}
  *@center C1 l5
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:fffffffffffffffffffffffffffffffffffffff }
    *@image C1 l5
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@center C1 l7
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:dddd }
    *@image C1 l7
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {normal_text: iiiii}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@flushright C7 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C3
    {normal_text:AAA\\n}
    *@image C1 l11
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {normal_text:\\n}
   {empty_line:\\n}
   *paragraph C5
    {normal_text:BBB }
    *@image C1 l13
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {normal_text: gggg }
    *@image C1 l13
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {normal_text:\\n}
   {empty_line:\\n}
   *paragraph C3
    {normal_text:HHH\\n}
    *@image C1 l16
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {normal_text: JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ\\n}
   *@end C1 l17
   |EXTRA
   |text_arg:{flushright}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:flushright}
     {spaces_after_argument:\\n}
';


$result_texis{'multiline_image_and_align'} = '@center @image{figure}

@center CCCC @image{figure} 

@center fffffffffffffffffffffffffffffffffffffff @image{figure}

@center dddd @image{figure} iiiii

@flushright
AAA
@image{figure}

BBB @image{figure} gggg @image{figure}

HHH
@image{figure} JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
@end flushright
';


$result_texts{'multiline_image_and_align'} = 'figure

CCCC figure

fffffffffffffffffffffffffffffffffffffff figure

dddd figure iiiii

AAA
figure

BBB figure gggg figure

HHH
figure JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
';

$result_errors{'multiline_image_and_align'} = '';

$result_nodes_list{'multiline_image_and_align'} = '';

$result_sections_list{'multiline_image_and_align'} = '';

$result_sectioning_root{'multiline_image_and_align'} = '';

$result_headings_list{'multiline_image_and_align'} = '';


$result_converted{'plaintext'}->{'multiline_image_and_align'} = '                                1  A  B  
                                 2  C  D
                                 3  E  F

                           CCCC   1  A  B  
                                 2  C  D
                                 3  E  F

          fffffffffffffffffffffffffffffffffffffff   1  A  B  
                                 2  C  D
                                 3  E  F

                           dddd   1  A  B  
                                 2  C  D
                              3  E  F iiiii

                                                                    AAA
                                                              1  A  B  
                                                                2  C  D
                                                                3  E  F

                                                        BBB   1  A  B  
                                                                2  C  D
                                               3  E  F gggg   1  A  B  
                                                                2  C  D
                                                                3  E  F

                                                                    HHH
                                                              1  A  B  
                                                                2  C  D
                         3  E  F JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
';

1;
