use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ref_tests'} = '*document_root C2
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C7 l2 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C6
   *normal_command@ref C4 l4
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:in ref followed by comma}
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text:, \\n}
   *normal_command@ref C4 l5
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:in ref not followed by comma}
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text: after ref.\\n}
   *normal_command@code C1 l6
    *brace_container C1
     *normal_command@ref C4 l6
      *brace_arg C1
      |node_content:A{0|0}
       {normal_text:in ref followed by end command}
      *brace_arg
      *brace_arg
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:m}
   {normal_text:.\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C8
   *normal_command@ref C4 l9
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:in ref followed by comma}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:name}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text:,\\n}
   *normal_command@ref C4 l10
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:in ref not followed by comma}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:name}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text: after ref.\\n}
   *normal_command@code C1 l11
    *brace_container C1
     *normal_command@ref C4 l11
      *brace_arg C1
      |node_content:A{0|0}
       {normal_text:in ref followed by end command}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:name}
      *brace_arg
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:m}
   {normal_text:.\\n}
   *normal_command@ref C4 l12
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:in ref ending with a dot.}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:name}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text: after ref.\\n}
  {empty_line:\\n}
';


$result_texis{'ref_tests'} = '
@node Top

@ref{in ref followed by comma,,, m}, 
@ref{in ref not followed by comma,,, m} after ref.
@code{@ref{in ref followed by end command,,, m}}.


@ref{in ref followed by comma, name,, m},
@ref{in ref not followed by comma, name,, m} after ref.
@code{@ref{in ref followed by end command, name,, m}}.
@ref{in ref ending with a dot., name,, m} after ref.

';


$result_texts{'ref_tests'} = '
in ref followed by comma, 
in ref not followed by comma after ref.
in ref followed by end command.


in ref followed by comma,
in ref not followed by comma after ref.
in ref followed by end command.
in ref ending with a dot. after ref.

';

$result_errors{'ref_tests'} = '';

$result_nodes_list{'ref_tests'} = '1|Top
';

$result_sections_list{'ref_tests'} = '';

$result_sectioning_root{'ref_tests'} = '';

$result_headings_list{'ref_tests'} = '';


$result_converted{'info'}->{'ref_tests'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

*note (m)in ref followed by comma::, *note (m)in ref not followed by
comma:: after ref.  ‘*note (m)in ref followed by end command::’.

   *note name: (m)in ref followed by comma, *note name: (m)in ref not
followed by comma. after ref.  ‘*note name: (m)in ref followed by end
command.’.  *note name: (m)in ref ending with a dot.. after ref.


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'ref_tests'} = '* W l12|@ref node name should not contain `.\'
 warning: @ref node name should not contain `.\'

';

1;
