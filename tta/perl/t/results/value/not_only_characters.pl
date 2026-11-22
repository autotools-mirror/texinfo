use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'not_only_characters'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@set C1
   |misc_args:A{-e_\'::;|hh}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:-e_\'::; hh}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:Say hh.\\n}
   >SOURCEMARKS
   >value_expansion<start;1><p:4>{hh}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:-e_\'::;}
   >value_expansion<end;1><p:6>
';


$result_texis{'not_only_characters'} = '@set -e_\'::; hh

Say hh.
';


$result_texts{'not_only_characters'} = '
Say hh.
';

$result_errors{'not_only_characters'} = '';

$result_nodes_list{'not_only_characters'} = '';

$result_sections_list{'not_only_characters'} = '';

$result_sectioning_root{'not_only_characters'} = '';

$result_headings_list{'not_only_characters'} = '';

1;
