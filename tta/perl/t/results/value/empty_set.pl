use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_set'} = '*document_root C1
 *before_node_section C2
  *preamble C2
   *normal_command@set C1
   |misc_args:A{myspace|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:myspace}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:1  1\\n}
   >SOURCEMARKS
   >value_expansion<start;1><p:2>{}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:myspace}
   >value_expansion<end;1><p:2>
';


$result_texis{'empty_set'} = '@set myspace

1  1
';


$result_texts{'empty_set'} = '
1  1
';

$result_errors{'empty_set'} = '';

$result_nodes_list{'empty_set'} = '';

$result_sections_list{'empty_set'} = '';

$result_sectioning_root{'empty_set'} = '';

$result_headings_list{'empty_set'} = '';

1;
