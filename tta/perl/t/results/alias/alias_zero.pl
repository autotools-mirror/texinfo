use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'alias_zero'} = '*document_root C1
 *before_node_section C2
  *@alias C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{0|strong}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {0 = strong}
  *paragraph C2
   *@strong C1 l2
   |INFO
   |alias_of:{0}
    *brace_container C1
     {g}
   {.\\n}
';


$result_texis{'alias_zero'} = '@alias 0 = strong
@strong{g}.
';


$result_texts{'alias_zero'} = 'g.
';

$result_errors{'alias_zero'} = '';

$result_nodes_list{'alias_zero'} = '';

$result_sections_list{'alias_zero'} = '';

$result_sectioning_root{'alias_zero'} = '';

$result_headings_list{'alias_zero'} = '';

1;
