use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'similar_external_and_internal_node'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C3 l1 {aa}
 |EXTRA
 |identifier:{aa}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C2
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:aa}
   *line_arg C6
   |EXTRA
   |manual_content:A{2|2}
   |node_content:A{4|4}
   |normalized:{bb}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:toto}
    {normal_text:)}
    {normal_text:bb}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C8
   *normal_command@xref C4 l3
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     *normal_command@emph C1 l3
      *brace_container C1
       {normal_text:aa}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:ext}
   {normal_text:.\\n}
   *normal_command@xref C5 l4
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     *normal_command@var C1 l4
      *brace_container C1
       {normal_text:aa}
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:Book}
   {normal_text:.\\n}
   *normal_command@xref C1 l5
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{aa}
     *normal_command@emph C1 l5
      *brace_container C1
       {normal_text:aa}
   {normal_text:.\\n}
   *normal_command@xref C1 l6
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{aa}
     *normal_command@var C1 l6
      *brace_container C1
       {normal_text:aa}
   {normal_text:.\\n}
';


$result_texis{'similar_external_and_internal_node'} = '@node aa, (toto)bb

@xref{@emph{aa},,,ext}.
@xref{@var{aa},,,,Book}.
@xref{@emph{aa}}.
@xref{@var{aa}}.
';


$result_texts{'similar_external_and_internal_node'} = '
aa.
aa.
aa.
aa.
';

$result_errors{'similar_external_and_internal_node'} = '* W l5|@xref to `@emph{aa}\', different from node name `aa\'
 warning: @xref to `@emph{aa}\', different from node name `aa\'

* W l6|@xref to `@var{aa}\', different from node name `aa\'
 warning: @xref to `@var{aa}\', different from node name `aa\'

';

$result_nodes_list{'similar_external_and_internal_node'} = '1|aa
 node_directions:
  next-> (toto)bb

';

$result_sections_list{'similar_external_and_internal_node'} = '';

$result_sectioning_root{'similar_external_and_internal_node'} = '';

$result_headings_list{'similar_external_and_internal_node'} = '';


$result_converted{'info'}->{'similar_external_and_internal_node'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: aa,  Next: (toto)bb

*Note (ext)_aa_::.  *Note ()AA::.  *Note aa::.  *Note aa::.


Tag Table:
Node: aa27

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'similar_external_and_internal_node'} = '* W |document without Top node
 warning: document without Top node

';

1;
