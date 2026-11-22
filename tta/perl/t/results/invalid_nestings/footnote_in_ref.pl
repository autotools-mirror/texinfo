use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'footnote_in_ref'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C3 l1 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   *normal_command@xref C2 l3
    *brace_arg C1
     {normal_text:first}
    *brace_arg C4
     {spaces_before_argument: }
     {normal_text:Text}
     *normal_command@footnote C1 l3
     |global_command_number:{1}
      *brace_command_context C3
       *paragraph C1
        {normal_text:First para\\n}
       {empty_line:\\n}
       *paragraph C1
        {normal_text:seond para}
     {normal_text:.}
';


$result_texis{'footnote_in_ref'} = '@node first

@xref{first, Text@footnote{First para

seond para}.}';


$result_texts{'footnote_in_ref'} = '
first';

$result_errors{'footnote_in_ref'} = '* W l3|@footnote should not appear anywhere inside @xref
 warning: @footnote should not appear anywhere inside @xref

* E l3|@xref missing closing brace
 @xref missing closing brace

';

$result_nodes_list{'footnote_in_ref'} = '1|first
';

$result_sections_list{'footnote_in_ref'} = '';

$result_sectioning_root{'footnote_in_ref'} = '';

$result_headings_list{'footnote_in_ref'} = '';

1;
