use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'enumerate_arguments'} = '*document_root C1
 *before_node_section C13
  *preamble_before_content
  *normal_command@enumerate C4 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:a}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:value\\n}
   *normal_command@item C2 l3
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:value\\n}
   *normal_command@end C1 l4
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C4 l6
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:A}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l7
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:value\\n}
   *normal_command@item C2 l8
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:value\\n}
   *normal_command@end C1 l9
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C4 l11
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:c}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l12
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:value\\n}
   *normal_command@item C2 l13
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:value\\n}
   *normal_command@end C1 l14
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C4 l16
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:C}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l17
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:value\\n}
   *normal_command@item C2 l18
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:value\\n}
   *normal_command@end C1 l19
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C4 l21
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:1}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l22
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:value\\n}
   *normal_command@item C2 l23
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:value\\n}
   *normal_command@end C1 l24
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C4 l26
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:3}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l27
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:value\\n}
   *normal_command@item C2 l28
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:value\\n}
   *normal_command@end C1 l29
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'enumerate_arguments'} = '@enumerate a
@item value
@item value
@end enumerate

@enumerate A
@item value
@item value
@end enumerate

@enumerate c
@item value
@item value
@end enumerate

@enumerate C
@item value
@item value
@end enumerate

@enumerate 1
@item value
@item value
@end enumerate

@enumerate 3
@item value
@item value
@end enumerate

';


$result_texts{'enumerate_arguments'} = 'a. value
b. value

A. value
B. value

c. value
d. value

C. value
D. value

1. value
2. value

3. value
4. value

';

$result_errors{'enumerate_arguments'} = '';

$result_nodes_list{'enumerate_arguments'} = '';

$result_sections_list{'enumerate_arguments'} = '';

$result_sectioning_root{'enumerate_arguments'} = '';

$result_headings_list{'enumerate_arguments'} = '';


$result_converted{'latex_text'}->{'enumerate_arguments'} = '\\begin{document}
\\begin{enumerate}[label=\\alph*.]
\\item value
\\item value
\\end{enumerate}

\\begin{enumerate}[label=\\Alph*.]
\\item value
\\item value
\\end{enumerate}

\\begin{enumerate}[label=\\alph*.,start=3]
\\item value
\\item value
\\end{enumerate}

\\begin{enumerate}[label=\\Alph*.,start=3]
\\item value
\\item value
\\end{enumerate}

\\begin{enumerate}[start=1]
\\item value
\\item value
\\end{enumerate}

\\begin{enumerate}[start=3]
\\item value
\\item value
\\end{enumerate}

';

1;
