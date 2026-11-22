use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'enumerate_argument'} = '*document_root C1
 *before_node_section C8
  *preamble_before_content
  *normal_command@enumerate C2 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:1}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C2 l4
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:A}
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l5
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C2 l7
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
   *normal_command@end C1 l8
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C2 l10
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:0}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l11
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
';


$result_texis{'enumerate_argument'} = '@enumerate 1
@end enumerate

@enumerate A@c comment
@end enumerate

@enumerate z @c comment
@end enumerate

@enumerate 0
@end enumerate
';


$result_texts{'enumerate_argument'} = '


';

$result_errors{'enumerate_argument'} = '';

$result_nodes_list{'enumerate_argument'} = '';

$result_sections_list{'enumerate_argument'} = '';

$result_sectioning_root{'enumerate_argument'} = '';

$result_headings_list{'enumerate_argument'} = '';


$result_converted{'plaintext'}->{'enumerate_argument'} = '';


$result_converted{'html_text'}->{'enumerate_argument'} = '


';


$result_converted{'xml'}->{'enumerate_argument'} = '<enumerate first="1" endspaces=" "><enumeratefirst> 1</enumeratefirst>
</enumerate>

<enumerate first="A" endspaces=" "><enumeratefirst> A</enumeratefirst><!-- c comment -->
</enumerate>

<enumerate first="z" endspaces=" "><enumeratefirst> z </enumeratefirst><!-- c comment -->
</enumerate>

<enumerate first="0" endspaces=" "><enumeratefirst> 0</enumeratefirst>
</enumerate>
';

1;
