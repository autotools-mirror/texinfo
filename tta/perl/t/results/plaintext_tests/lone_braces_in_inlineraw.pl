use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'lone_braces_in_inlineraw'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   *normal_command@inlineraw C2 l1
   |expand_index:{1}
   |format:{plaintext}
    *brace_arg C1
     {normal_text:plaintext}
    *brace_arg C2
     {spaces_before_argument: }
     *balanced_braces C1 l1
      {normal_text:{truc}}
   {normal_text:.\\n}
';


$result_texis{'lone_braces_in_inlineraw'} = '@inlineraw{plaintext, {truc}}.
';


$result_texts{'lone_braces_in_inlineraw'} = '{truc}.
';

$result_errors{'lone_braces_in_inlineraw'} = '';

$result_nodes_list{'lone_braces_in_inlineraw'} = '';

$result_sections_list{'lone_braces_in_inlineraw'} = '';

$result_sectioning_root{'lone_braces_in_inlineraw'} = '';

$result_headings_list{'lone_braces_in_inlineraw'} = '';


$result_converted{'plaintext'}->{'lone_braces_in_inlineraw'} = '{truc}.
';

1;
