use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'pxref_test'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C3 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C9
   {normal_text:Hey (}
   *normal_command@pxref C4 l3
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:in pxref}
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text:) and continue (}
   *normal_command@pxref C4 l3
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:in pxref}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:name}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text:) and end.\\n}
   *normal_command@pxref C4 l4
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:n}
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text:. }
   *normal_command@pxref C4 l4
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:n}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:name}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text:.\\n}
';


$result_texis{'pxref_test'} = '@node Top

Hey (@pxref{in pxref,,, m}) and continue (@pxref{in pxref, name,, m}) and end.
@pxref{n,,, m}. @pxref{n, name,, m}.
';


$result_texts{'pxref_test'} = '
Hey (in pxref) and continue (in pxref) and end.
n. n.
';

$result_errors{'pxref_test'} = '';

$result_nodes_list{'pxref_test'} = '1|Top
';

$result_sections_list{'pxref_test'} = '';

$result_sectioning_root{'pxref_test'} = '';

$result_headings_list{'pxref_test'} = '';


$result_converted{'info'}->{'pxref_test'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

Hey (*note (m)in pxref::) and continue (*note name: (m)in pxref.) and
end.  *note (m)n::.  *note name: (m)n.


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
