use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'set_flag_command_equivalent'} = '*document_root C1
 *before_node_section C4
  *preamble C2
   *normal_command@set C1 l1
   |global_command_number:{1}
   |misc_args:A{txicodequoteundirected|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:txicodequoteundirected}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:.\\n}
   >SOURCEMARKS
   >value_expansion<start;1>{}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:txicodequoteundirected}
   >value_expansion<end;1>
  {empty_line:\\n}
  *normal_command@clear C1 l5
  |global_command_number:{2}
  |misc_args:A{txicodequoteundirected}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:txicodequoteundirected}
    {spaces_after_argument:\\n}
';


$result_texis{'set_flag_command_equivalent'} = '@set txicodequoteundirected

.

@clear txicodequoteundirected
';


$result_texts{'set_flag_command_equivalent'} = '
.

';

$result_errors{'set_flag_command_equivalent'} = '';

$result_nodes_list{'set_flag_command_equivalent'} = '';

$result_sections_list{'set_flag_command_equivalent'} = '';

$result_sectioning_root{'set_flag_command_equivalent'} = '';

$result_headings_list{'set_flag_command_equivalent'} = '';

1;
