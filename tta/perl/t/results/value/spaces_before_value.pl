use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'spaces_before_value'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@set C1
   |EXTRA
   |misc_args:A{var|val}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:var val}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:val\\n}
   >SOURCEMARKS
   >value_expansion<start;1>{val}
    >*normal_command@value C2
     >{spaces_after_cmd_before_arg:  }
     >*brace_container C1
      >{normal_text:var}
   >value_expansion<end;1><p:3>
';


$result_texis{'spaces_before_value'} = '@set var val

val
';


$result_texts{'spaces_before_value'} = '
val
';

$result_errors{'spaces_before_value'} = '';

$result_nodes_list{'spaces_before_value'} = '';

$result_sections_list{'spaces_before_value'} = '';

$result_sectioning_root{'spaces_before_value'} = '';

$result_headings_list{'spaces_before_value'} = '';

1;
