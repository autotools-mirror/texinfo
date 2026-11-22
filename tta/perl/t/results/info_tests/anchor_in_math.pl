use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_math'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *@node C6 l1 {Top}
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
  *paragraph C3
   {normal_text:Some }
   *@math C1 l3
    *brace_arg C2
     {normal_text:A + B }
     *@anchor C1 l3
     |EXTRA
     |identifier:{in-math}
     |is_target:{1}
      *brace_arg C1
       {normal_text:in math}
   {normal_text: and after.\\n}
  {empty_line:\\n}
  *@displaymath C11 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {normal_text:f(x) = }
   *@anchor C1 l6
   |EXTRA
   |identifier:{equal-point}
   |is_target:{1}
    *brace_arg C1
     {normal_text:equal point}
   {spaces_after_close_brace: }
   {normal_text:\\frac}
   *balanced_braces C1 l6
    {normal_text:{a}}
   *balanced_braces C1 l6
    {normal_text:{b}}
   {normal_text: }
   *@anchor C1 l6
   |EXTRA
   |identifier:{displm-point}
   |is_target:{1}
    *brace_arg C1
     {normal_text:displm point}
   {spaces_after_close_brace:\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:displaymath}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'anchor_in_math'} = '@node Top

Some @math{A + B @anchor{in math}} and after.

@displaymath
f(x) = @anchor{equal point} \\frac{a}{b} @anchor{displm point}
@end displaymath

';


$result_texts{'anchor_in_math'} = '
Some A + B  and after.

f(x) = \\frac{a}{b} 
';

$result_errors{'anchor_in_math'} = '* W l3|@anchor should not appear anywhere inside @math
 warning: @anchor should not appear anywhere inside @math

';

$result_nodes_list{'anchor_in_math'} = '1|Top
';

$result_sections_list{'anchor_in_math'} = '';

$result_sectioning_root{'anchor_in_math'} = '';

$result_headings_list{'anchor_in_math'} = '';


$result_converted{'info'}->{'anchor_in_math'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

Some A + B and after.

f(x) = \\frac{a}{b}


Tag Table:
Node: Top27
Ref: in math71
Ref: equal point90
Ref: displm point102

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
