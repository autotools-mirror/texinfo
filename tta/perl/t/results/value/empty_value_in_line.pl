use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_value_in_line'} = '*document_root C1
 *before_node_section C4
  *preamble C2
   *normal_command@set C1
   |misc_args:A{myspace|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:myspace}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:1 \\n}
  {empty_line: \\n}
  >SOURCEMARKS
  >value_expansion<start;1>{}
   >*normal_command@value C1
    >*brace_container C1
     >{normal_text:myspace}
  >value_expansion<end;1>
  *paragraph C1
   {normal_text:1\\n}
';


$result_texis{'empty_value_in_line'} = '@set myspace

1 
 
1
';


$result_texts{'empty_value_in_line'} = '
1 
 
1
';

$result_errors{'empty_value_in_line'} = '';

$result_nodes_list{'empty_value_in_line'} = '';

$result_sections_list{'empty_value_in_line'} = '';

$result_sectioning_root{'empty_value_in_line'} = '';

$result_headings_list{'empty_value_in_line'} = '';

1;
