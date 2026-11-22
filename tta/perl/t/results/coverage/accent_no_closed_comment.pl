use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'accent_no_closed_comment'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   *@~ C1 l1
    *brace_container C2
     {normal_text:e }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
';


$result_texis{'accent_no_closed_comment'} = '@~{e @c comment
}';


$result_texts{'accent_no_closed_comment'} = 'e ~';

$result_errors{'accent_no_closed_comment'} = '* E l1|@~ missing closing brace
 @~ missing closing brace

';

$result_nodes_list{'accent_no_closed_comment'} = '';

$result_sections_list{'accent_no_closed_comment'} = '';

$result_sectioning_root{'accent_no_closed_comment'} = '';

$result_headings_list{'accent_no_closed_comment'} = '';

1;
