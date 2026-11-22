use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'closing_brace_in_value_in_ignored_inline'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content C2
   *@set C1
   |EXTRA
   |misc_args:A{closebrace|}}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:closebrace }}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   *@inlinefmt C2 l3
   |EXTRA
   |expand_index:{1}
   |format:{html}
   >SOURCEMARKS
   >value_expansion<end;1>
    *brace_arg C1
     {normal_text:html}
    *brace_arg C2
     {spaces_before_argument:\\n}
     {normal_text:truc }
     >SOURCEMARKS
     >value_expansion<start;1><p:5>{}}
      >*@value C1
       >*brace_container C1
        >{normal_text:closebrace}
   {normal_text:\\n}
   {normal_text:machin\\n}
  {empty_line:\\n}
  *paragraph C1
   *@inlinefmt C2 l7
   |EXTRA
   |format:{tex}
    *brace_arg C1
     {normal_text:tex}
    *elided_brace_command_arg C1
     {raw:\\nbidule @value{closebrace}\\nafter\\n}
';


$result_texis{'closing_brace_in_value_in_ignored_inline'} = '@set closebrace }

@inlinefmt{html,
truc }
machin

@inlinefmt{tex,
bidule @value{closebrace}
after
}';


$result_texts{'closing_brace_in_value_in_ignored_inline'} = '
truc 
machin

';

$result_errors{'closing_brace_in_value_in_ignored_inline'} = '* E l7|@inlinefmt missing closing brace
 @inlinefmt missing closing brace

';

$result_nodes_list{'closing_brace_in_value_in_ignored_inline'} = '';

$result_sections_list{'closing_brace_in_value_in_ignored_inline'} = '';

$result_sectioning_root{'closing_brace_in_value_in_ignored_inline'} = '';

$result_headings_list{'closing_brace_in_value_in_ignored_inline'} = '';

1;
