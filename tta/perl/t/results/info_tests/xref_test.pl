use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'xref_test'} = '*document_root C2
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C3 l2 {Top}
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
  *paragraph C10
   *@xref C4 l4
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     {normal_text:in xref}
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text:. }
   *@xref C4 l4
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     {normal_text:bad xref}
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text: after xref.\\n}
   *@code C1 l5
    *brace_container C1
     *@xref C4 l5
      *brace_arg C1
      |EXTRA
      |node_content:A{0|0}
       {normal_text:bad nested xref}
      *brace_arg
      *brace_arg
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:m}
   {normal_text:.\\n}
   *@xref C4 l6
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     {normal_text:in ref ending with a dot.}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:name}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text: ! after xref and dot inside.\\n}
   *@xref C3 l7
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{in-ref-followed-by-symbol}
     {normal_text:in ref followed by symbol}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:m}
   {normal_text:# g.\\n}
';


$result_texis{'xref_test'} = '
@node Top

@xref{in xref,,, m}. @xref{bad xref,,, m} after xref.
@code{@xref{bad nested xref,,, m}}.
@xref{in ref ending with a dot., name,, m} ! after xref and dot inside.
@xref{in ref followed by symbol,, m}# g.
';


$result_texts{'xref_test'} = '
in xref. bad xref after xref.
bad nested xref.
in ref ending with a dot. ! after xref and dot inside.
in ref followed by symbol# g.
';

$result_errors{'xref_test'} = '* E l7|@xref reference to nonexistent node `in ref followed by symbol\'
 @xref reference to nonexistent node `in ref followed by symbol\'

';

$result_nodes_list{'xref_test'} = '1|Top
';

$result_sections_list{'xref_test'} = '';

$result_sectioning_root{'xref_test'} = '';

$result_headings_list{'xref_test'} = '';


$result_converted{'info'}->{'xref_test'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

*Note (m)in xref::.  *Note (m)bad xref:: after xref.  ‘*Note (m)bad
nested xref::’.  *Note name: (m)in ref ending with a dot.. !  after xref
and dot inside.  *Note m: in ref followed by symbol.# g.


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'xref_test'} = '* W l6|@xref node name should not contain `.\'
 warning: @xref node name should not contain `.\'

* W l6|`.\' or `,\' must follow @xref, not !
 warning: `.\' or `,\' must follow @xref, not !

* W l7|`.\' or `,\' must follow @xref, not #
 warning: `.\' or `,\' must follow @xref, not #

';

1;
