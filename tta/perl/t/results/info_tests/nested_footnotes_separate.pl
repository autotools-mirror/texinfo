use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_footnotes_separate'} = '*document_root C2
 *before_node_section C1
  *preamble C1
   *normal_command@footnotestyle C1 l1
   |misc_args:A{separate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:separate}
     {spaces_after_argument:\\n}
 *normal_command@node C3 l2 {Top}
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
   {normal_text:F}
   *normal_command@footnote C1 l4
   |global_command_number:{2}
    *brace_command_context C3
     *paragraph C1
      {normal_text:F1\\n}
     {empty_line:\\n}
     *paragraph C3
      {normal_text:V}
      *normal_command@footnote C1 l6
      |global_command_number:{1}
       *brace_command_context C1
        *paragraph C1
         {normal_text:F2}
      {normal_text:\\n}
   {normal_text:\\n}
';


$result_texis{'nested_footnotes_separate'} = '@footnotestyle separate
@node Top

F@footnote{F1

V@footnote{F2}
}
';


$result_texts{'nested_footnotes_separate'} = '
F
';

$result_errors{'nested_footnotes_separate'} = '* W l6|@footnote should not appear anywhere inside @footnote
 warning: @footnote should not appear anywhere inside @footnote

';

$result_nodes_list{'nested_footnotes_separate'} = '1|Top
';

$result_sections_list{'nested_footnotes_separate'} = '';

$result_sectioning_root{'nested_footnotes_separate'} = '';

$result_headings_list{'nested_footnotes_separate'} = '';


$result_converted{'info'}->{'nested_footnotes_separate'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

F(1) (*note Top-Footnote-1::)


File: ,  Node: Top-Footnotes,  Up: Top

   (1) F1

   V(2) (*note Top-Footnotes-Footnote-2::)

   (2) F2


Tag Table:
Node: Top27
Node: Top-Footnotes92
Ref: Top-Footnote-1134
Ref: Top-Footnote-2189

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
