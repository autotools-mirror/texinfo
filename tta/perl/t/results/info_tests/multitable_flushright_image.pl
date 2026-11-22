use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_flushright_image'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@multitable C3 l1
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      {normal_text:aaaaaaaaaaaaaaaaaaaaaa}
     {normal_text: }
     *bracketed_arg C1 l1
      {normal_text:bbbbbbbbbbbbbbbbbbbbbbb}
     {spaces_after_argument:\\n}
   *multitable_body C2
    *row C2
    |row_number:{1}
     *normal_command@item C3 l2
     |cell_number:{1}
      {ignorable_spaces_after_command:\\n}
      *normal_command@flushright C8 l3
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *normal_command@center C1 l4
        *line_arg C4
         {spaces_before_argument: }
         {normal_text:CCCC }
         *normal_command@image C1 l4
         |input_encoding_name:{utf-8}
          *brace_arg C1
           {normal_text:figure}
         {spaces_after_argument:\\n}
       {empty_line:\\n}
       *paragraph C6
        {normal_text:AAA\\n}
        *normal_command@image C5 l7
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
        {normal_text:BBB }
        *normal_command@image C5 l8
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
       *normal_command@image C5 l10
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
       *normal_command@end C1 l11
       |text_arg:{flushright}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:flushright}
         {spaces_after_argument:\\n}
      {empty_line:\\n}
     *normal_command@tab C8 l13
     |cell_number:{2}
      {ignorable_spaces_after_command:\\n}
      *normal_command@center C1 l14
       *line_arg C4
        {spaces_before_argument: }
        {normal_text:CCCC }
        *normal_command@image C1 l14
        |input_encoding_name:{utf-8}
         *brace_arg C1
          {normal_text:figure}
        {spaces_after_argument:\\n}
      {empty_line:\\n}
      *paragraph C6
       {normal_text:AAA\\n}
       *normal_command@image C5 l17
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
       {normal_text:BBB }
       *normal_command@image C5 l18
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
      *normal_command@image C5 l20
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
    *row C2
    |row_number:{2}
     *normal_command@item C2 l22
     |cell_number:{1}
      {ignorable_spaces_after_command:\\n}
      *normal_command@flushright C8 l23
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *paragraph C3
        {normal_text:FFFR }
        *normal_command@image C1 l24
        |input_encoding_name:{utf-8}
         *brace_arg C1
          {normal_text:figure}
        {normal_text:\\n}
       {empty_line:\\n}
       *normal_command@image C1 l26
       |input_encoding_name:{utf-8}
        *brace_arg C1
         {normal_text:figure}
       {normal_text:\\n}
       {empty_line:\\n}
       *paragraph C5
        {normal_text:AA }
        *normal_command@image C1 l28
        |input_encoding_name:{utf-8}
         *brace_arg C1
          {normal_text:figure}
        {normal_text: BB }
        *normal_command@image C1 l28
        |input_encoding_name:{utf-8}
         *brace_arg C1
          {normal_text:figure}
        {normal_text:\\n}
       *normal_command@end C1 l29
       |text_arg:{flushright}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:flushright}
         {spaces_after_argument:\\n}
     *normal_command@tab C2 l30
     |cell_number:{2}
      {ignorable_spaces_after_command:\\n}
      *normal_command@flushleft C8 l31
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *paragraph C3
        {normal_text:FFFL }
        *normal_command@image C1 l32
        |input_encoding_name:{utf-8}
         *brace_arg C1
          {normal_text:figure}
        {normal_text:\\n}
       {empty_line:\\n}
       *normal_command@image C1 l34
       |input_encoding_name:{utf-8}
        *brace_arg C1
         {normal_text:figure}
       {normal_text:\\n}
       {empty_line:\\n}
       *paragraph C5
        {normal_text:AA }
        *normal_command@image C1 l36
        |input_encoding_name:{utf-8}
         *brace_arg C1
          {normal_text:figure}
        {normal_text: BB }
        *normal_command@image C1 l36
        |input_encoding_name:{utf-8}
         *brace_arg C1
          {normal_text:figure}
        {normal_text:\\n}
       *normal_command@end C1 l37
       |text_arg:{flushleft}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:flushleft}
         {spaces_after_argument:\\n}
   *normal_command@end C1 l38
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable_flushright_image'} = '@multitable {aaaaaaaaaaaaaaaaaaaaaa} {bbbbbbbbbbbbbbbbbbbbbbb}
@item
@flushright
@center CCCC @image{figure}

AAA
@image{figure, , , ,txt}
BBB @image{figure, , , ,txt}

@image{figure, , , ,txt}
@end flushright

@tab
@center CCCC @image{figure}

AAA
@image{figure, , , ,txt}
BBB @image{figure, , , ,txt}

@image{figure, , , ,txt}

@item
@flushright
FFFR @image{figure}

@image{figure}

AA @image{figure} BB @image{figure}
@end flushright
@tab
@flushleft
FFFL @image{figure}

@image{figure}

AA @image{figure} BB @image{figure}
@end flushleft
@end multitable
';


$result_texts{'multitable_flushright_image'} = 'CCCC figure

AAA
figure
BBB figure

figure

CCCC figure

AAA
figure
BBB figure

figure

FFFR figure

figure

AA figure BB figure
FFFL figure

figure

AA figure BB figure
';

$result_errors{'multitable_flushright_image'} = '';

$result_nodes_list{'multitable_flushright_image'} = '';

$result_sections_list{'multitable_flushright_image'} = '';

$result_sectioning_root{'multitable_flushright_image'} = '';

$result_headings_list{'multitable_flushright_image'} = '';


$result_converted{'info'}->{'multitable_flushright_image'} = Encode::encode('utf-8', 'This is , produced from .

  CCCC   1  A  B            CCCC   1  A  B  
        2  C  D                  2  C  D
        3  E  F                  3  E  F
                         
                  AAA    AAA  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ] BBB  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]
                   [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]    
              BBB  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]     [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]
                         
                   [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]

     FFFR   1  A  B      FFFL   1  A  B  
              2  C  D      2  C  D
              3  E  F      3  E  F
                         
            1  A  B        1  A  B  
              2  C  D      2  C  D
              3  E  F      3  E  F
                         
       AA   1  A  B      AA   1  A  B  
              2  C  D      2  C  D
  3  E  F BB   1  A  B     3  E  F BB   1  A  B  
              2  C  D      2  C  D
              3  E  F      3  E  F

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'multitable_flushright_image'} = '* W |document without nodes
 warning: document without nodes

';

1;
