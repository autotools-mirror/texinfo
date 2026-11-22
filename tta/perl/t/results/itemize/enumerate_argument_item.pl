use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'enumerate_argument_item'} = '*document_root C1
 *before_node_section C8
  *preamble_before_content
  *normal_command@enumerate C4 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:1}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:numeric first\\n}
   *normal_command@item C2 l3
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:numeric second\\n}
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
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
   *normal_command@item C2 l7
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:upper case first\\n}
   *normal_command@item C2 l8
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:upper case second\\n}
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
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:z}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
   *normal_command@item C2 l12
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:lower case first\\n}
   *normal_command@item C2 l13
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:lower case second\\n}
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
     {normal_text:0}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l17
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:numeric zero first\\n}
   *normal_command@item C2 l18
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:numeric zero second\\n}
   *normal_command@end C1 l19
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
';


$result_texis{'enumerate_argument_item'} = '@enumerate 1
@item numeric first
@item numeric second
@end enumerate

@enumerate A@c comment
@item upper case first
@item upper case second
@end enumerate

@enumerate z @c comment
@item lower case first
@item lower case second
@end enumerate

@enumerate 0
@item numeric zero first
@item numeric zero second
@end enumerate
';


$result_texts{'enumerate_argument_item'} = '1. numeric first
2. numeric second

A. upper case first
B. upper case second

z. lower case first
aa. lower case second

0. numeric zero first
1. numeric zero second
';

$result_errors{'enumerate_argument_item'} = '';

$result_nodes_list{'enumerate_argument_item'} = '';

$result_sections_list{'enumerate_argument_item'} = '';

$result_sectioning_root{'enumerate_argument_item'} = '';

$result_headings_list{'enumerate_argument_item'} = '';


$result_converted{'plaintext'}->{'enumerate_argument_item'} = '  1. numeric first
  2. numeric second

  A. upper case first
  B. upper case second

  z. lower case first
  aa. lower case second

  0. numeric zero first
  1. numeric zero second
';


$result_converted{'html_text'}->{'enumerate_argument_item'} = '<ol class="enumerate">
<li> numeric first
</li><li> numeric second
</li></ol>

<ol class="enumerate" type="A" start="1">
<li> upper case first
</li><li> upper case second
</li></ol>

<ol class="enumerate" type="a" start="26">
<li> lower case first
</li><li> lower case second
</li></ol>

<ol class="enumerate" start="0">
<li> numeric zero first
</li><li> numeric zero second
</li></ol>
';


$result_converted{'xml'}->{'enumerate_argument_item'} = '<enumerate first="1" endspaces=" "><enumeratefirst> 1</enumeratefirst>
<listitem> <para>numeric first
</para></listitem><listitem> <para>numeric second
</para></listitem></enumerate>

<enumerate first="A" endspaces=" "><enumeratefirst> A</enumeratefirst><!-- c comment -->
<listitem> <para>upper case first
</para></listitem><listitem> <para>upper case second
</para></listitem></enumerate>

<enumerate first="z" endspaces=" "><enumeratefirst> z </enumeratefirst><!-- c comment -->
<listitem> <para>lower case first
</para></listitem><listitem> <para>lower case second
</para></listitem></enumerate>

<enumerate first="0" endspaces=" "><enumeratefirst> 0</enumeratefirst>
<listitem> <para>numeric zero first
</para></listitem><listitem> <para>numeric zero second
</para></listitem></enumerate>
';

1;
