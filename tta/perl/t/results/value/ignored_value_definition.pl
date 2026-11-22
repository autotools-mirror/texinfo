use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ignored_value_definition'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content C2
   *normal_command@set C1
   |EXTRA
   |misc_args:A{aa|outside}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:aa outside}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *normal_command@inlinefmt C2 l3
   |EXTRA
   |format:{tex}
    *brace_arg C1
     {normal_text:tex}
    *elided_brace_command_arg C1
     {raw:\\n@set aa in inlinefmt tex\\n}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:outside.\\n}
   >SOURCEMARKS
   >value_expansion<start;1>{outside}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:aa}
   >value_expansion<end;1><p:7>
';


$result_texis{'ignored_value_definition'} = '@set aa outside

@inlinefmt{tex,
@set aa in inlinefmt tex
}

outside.
';


$result_texts{'ignored_value_definition'} = '


outside.
';

$result_errors{'ignored_value_definition'} = '';

$result_nodes_list{'ignored_value_definition'} = '';

$result_sections_list{'ignored_value_definition'} = '';

$result_sectioning_root{'ignored_value_definition'} = '';

$result_headings_list{'ignored_value_definition'} = '';

1;
