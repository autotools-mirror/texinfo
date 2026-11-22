use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multiline_image_and_align'} = '*document_root C1
 *before_node_section C20
  *preamble_before_content
  *normal_command@center C1 l1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@image C1 l1
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@center C1 l3
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:CCCC }
    *normal_command@image C1 l3
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {spaces_after_argument: \\n}
  {empty_line:\\n}
  *normal_command@center C1 l5
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:fffffffffffffffffffffffffffffffffffffff }
    *normal_command@image C1 l5
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@center C1 l7
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:dddd }
    *normal_command@image C1 l7
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {normal_text: iiiii}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@flushright C7 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C3
    {normal_text:AAA\\n}
    *normal_command@image C1 l11
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {normal_text:\\n}
   {empty_line:\\n}
   *paragraph C5
    {normal_text:BBB }
    *normal_command@image C1 l13
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {normal_text: gggg }
    *normal_command@image C1 l13
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {normal_text:\\n}
   {empty_line:\\n}
   *paragraph C3
    {normal_text:HHH\\n}
    *normal_command@image C1 l16
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
    {normal_text: JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ\\n}
   *normal_command@end C1 l17
   |text_arg:{flushright}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:flushright}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@center C1 l19
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@image C5 l19
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {normal_text:txt}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@center C1 l21
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:CCCC }
    *normal_command@image C5 l21
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {normal_text:txt}
    {spaces_after_argument: \\n}
  {empty_line:  \\n}
  *normal_command@center C1 l23
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:fffffffffffffffffffffffffffffffffffffff }
    *normal_command@image C5 l23
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {normal_text:txt}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@center C1 l25
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:dddd }
    *normal_command@image C5 l25
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {normal_text:txt}
    {normal_text: iiiii}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@flushright C7 l27
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C3
    {normal_text:AAA\\n}
    *normal_command@image C5 l29
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {normal_text:txt}
    {normal_text:\\n}
   {empty_line:\\n}
   *paragraph C5
    {normal_text:BBB }
    *normal_command@image C5 l31
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {normal_text:txt}
    {normal_text: gggg }
    *normal_command@image C5 l31
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {normal_text:txt}
    {normal_text:\\n}
   {empty_line:\\n}
   *paragraph C3
    {normal_text:HHH\\n}
    *normal_command@image C5 l34
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:figure}
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C1
      {normal_text:txt}
    {normal_text: JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ\\n}
   *normal_command@end C1 l35
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

@center @image{figure, , , ,txt}

@center CCCC @image{figure, , , ,txt} 
  
@center fffffffffffffffffffffffffffffffffffffff @image{figure, , , ,txt}

@center dddd @image{figure, , , ,txt} iiiii

@flushright
AAA
@image{figure, , , ,txt}

BBB @image{figure, , , ,txt} gggg @image{figure, , , ,txt}

HHH
@image{figure, , , ,txt} JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
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

figure

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


$result_converted{'info'}->{'multiline_image_and_align'} = Encode::encode('utf-8', 'This is , produced from .

                                1  A  B  
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

                                   [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]

                               CCCC  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]

              fffffffffffffffffffffffffffffffffffffff  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]

                            dddd  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ] iiiii

                                                                    AAA
                                                                     [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]

                                                       BBB  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ] gggg  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]

                                                                    HHH
                              [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ] JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'multiline_image_and_align'} = '* W |document without nodes
 warning: document without nodes

';

1;
