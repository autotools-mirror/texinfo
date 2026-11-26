use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'novalidate_empty_refs'} = '*document_root C5
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content C2
   *normal_command@novalidate C1 l2
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C4 l4 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *normal_command@xref C1 l6
    *brace_arg C1
    |node_content:A{0|0}
     *normal_command@:
   {normal_text:.\\n}
   *normal_command@xref C1 l7
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{-}
     *normal_command@asis C1 l7
      *brace_container C1
       {normal_text: }
   {normal_text:.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {@
}
  *arguments_line C1
   *line_arg C2
    {spaces_before_argument: }
    *normal_command@\\n
 *normal_command@node C1 l10 {@:}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@:
    {spaces_after_argument:\\n}
 *normal_command@node C1 l11 {@asis{ }}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@asis C1 l11
     *brace_container C1
      {normal_text: }
    {spaces_after_argument:\\n}
';


$result_texis{'novalidate_empty_refs'} = '
@novalidate

@node Top

@xref{@:}.
@xref{@asis{ }}.

@node @
@node @:
@node @asis{ }
';


$result_texts{'novalidate_empty_refs'} = '

.
 .

';

$result_errors{'novalidate_empty_refs'} = '* W l9|@ should not occur at end of argument to line command
 warning: @ should not occur at end of argument to line command

* E l9|empty node name after expansion `@
\'
 empty node name after expansion `@
\'

* E l10|empty node name after expansion `@:\'
 empty node name after expansion `@:\'

* E l11|empty node name after expansion `@asis{ }\'
 empty node name after expansion `@asis{ }\'

';

$result_nodes_list{'novalidate_empty_refs'} = '1|Top
';

$result_sections_list{'novalidate_empty_refs'} = '';

$result_sectioning_root{'novalidate_empty_refs'} = '';

$result_headings_list{'novalidate_empty_refs'} = '';


$result_converted{'info'}->{'novalidate_empty_refs'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

*Note ::.  *Note ::.


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
