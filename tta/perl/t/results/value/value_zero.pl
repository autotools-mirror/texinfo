use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'value_zero'} = '*document_root C1
 *before_node_section C2
  *preamble C1
   *normal_command@set C1
   |misc_args:A{zero|0}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:zero 0}
     {spaces_after_argument:\\n}
  *paragraph C2
   {normal_text:Value\\n}
   {normal_text:0}
   >SOURCEMARKS
   >value_expansion<start;1>{0}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:zero}
   >value_expansion<end;1><p:1>
';


$result_texis{'value_zero'} = '@set zero 0
Value
0';


$result_texts{'value_zero'} = 'Value
0';

$result_errors{'value_zero'} = '';

$result_nodes_list{'value_zero'} = '';

$result_sections_list{'value_zero'} = '';

$result_sectioning_root{'value_zero'} = '';

$result_headings_list{'value_zero'} = '';

1;
