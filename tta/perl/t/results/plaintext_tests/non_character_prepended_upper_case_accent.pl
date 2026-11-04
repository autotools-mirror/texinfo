use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'non_character_prepended_upper_case_accent'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C4
   *@udotaccent C1 l1
    *brace_container C1
     {R}
   {.  A\\n}
   *@sc C1 l2
    *brace_container C1
     *@udotaccent C1 l2
      *brace_container C1
       {R}
   {.  B}
';


$result_texis{'non_character_prepended_upper_case_accent'} = '@udotaccent{R}.  A
@sc{@udotaccent{R}}.  B';


$result_texts{'non_character_prepended_upper_case_accent'} = '.R.  A
.R.  B';

$result_errors{'non_character_prepended_upper_case_accent'} = '';

$result_nodes_list{'non_character_prepended_upper_case_accent'} = '';

$result_sections_list{'non_character_prepended_upper_case_accent'} = '';

$result_sectioning_root{'non_character_prepended_upper_case_accent'} = '';

$result_headings_list{'non_character_prepended_upper_case_accent'} = '';


$result_converted{'plaintext'}->{'non_character_prepended_upper_case_accent'} = '.R. A .R. B
';

1;
