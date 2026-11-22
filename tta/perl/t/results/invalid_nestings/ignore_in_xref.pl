use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ignore_in_xref'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *@node C3 l1 {first}
 |EXTRA
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C2 l3
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{first}
     {normal_text:first}
    *brace_arg C2
     {spaces_before_argument:\\n}
     *@ignore C3 l4
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      {raw:ignore me\\n}
      *@end C1 l6
      |EXTRA
      |text_arg:{ignore}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:ignore}
        {spaces_after_argument:\\n}
   {normal_text:.\\n}
';


$result_texis{'ignore_in_xref'} = '@node first

@xref{first,
@ignore
ignore me
@end ignore
}.
';


$result_texts{'ignore_in_xref'} = '
first.
';

$result_errors{'ignore_in_xref'} = '* W l4|@ignore should not appear anywhere inside @xref
 warning: @ignore should not appear anywhere inside @xref

';

$result_nodes_list{'ignore_in_xref'} = '1|first
';

$result_sections_list{'ignore_in_xref'} = '';

$result_sectioning_root{'ignore_in_xref'} = '';

$result_headings_list{'ignore_in_xref'} = '';

1;
