use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ref_in_ref'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C2 l1 {first}
 |EXTRA
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  *paragraph C1
   *normal_command@ref C1 l2
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{first}
     *normal_command@ref C1 l2
      *brace_arg C1
      |EXTRA
      |node_content:A{0|0}
      |normalized:{first}
       {normal_text:first}
';


$result_texis{'ref_in_ref'} = '@node first
@ref{@ref{first}}';


$result_texts{'ref_in_ref'} = 'first';

$result_errors{'ref_in_ref'} = '* W l2|@ref should not appear anywhere inside @ref
 warning: @ref should not appear anywhere inside @ref

* W l2|@ref to `@ref{first}\', different from node name `first\'
 warning: @ref to `@ref{first}\', different from node name `first\'

';

$result_nodes_list{'ref_in_ref'} = '1|first
';

$result_sections_list{'ref_in_ref'} = '';

$result_sectioning_root{'ref_in_ref'} = '';

$result_headings_list{'ref_in_ref'} = '';

1;
