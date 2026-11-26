use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ref_empty_node'} = '*document_root C1
 *before_node_section C3
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content
  *paragraph C8
   *normal_command@ref C4 l2
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:manual}
   {normal_text: }
   *normal_command@ref C5 l2
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {spaces_before_argument: }
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:Manual}
   {normal_text: }
   *normal_command@inforef C3 l2
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:imanual}
   {normal_text:\\n}
   *normal_command@xref C5 l3
    *brace_arg C1
     {spaces_before_argument: }
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:Bidule}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:Truc}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:file}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:Printed}
   {normal_text:.\\n}
';


$result_texis{'ref_empty_node'} = '
@ref{,,,manual} @ref{,,, , Manual} @inforef{,,imanual}
@xref{ , Bidule, Truc, file, Printed}.
';


$result_texts{'ref_empty_node'} = '  
.
';

$result_errors{'ref_empty_node'} = '* W l2|@inforef is obsolete
 warning: @inforef is obsolete

';

$result_nodes_list{'ref_empty_node'} = '';

$result_sections_list{'ref_empty_node'} = '';

$result_sectioning_root{'ref_empty_node'} = '';

$result_headings_list{'ref_empty_node'} = '';

1;
