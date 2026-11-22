use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comments'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *paragraph C2
   *normal_command@verb C1 l1
    *brace_container C4
     {verb_delimiter:a}
     {raw: comment @c comment\\n}
     {raw:in a verb }
     {verb_delimiter:a}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:comment}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   {normal_text:something }
   *normal_command@verb C1 l4
    *brace_container C3
     {verb_delimiter:,}
     {raw: in verb}
     {verb_delimiter:,}
   {normal_text: }
   *normal_command@c C1
    *line_arg C2
     {spaces_before_argument: }
     {rawline_text:other comment}
';


$result_texis{'comments'} = '@verb{a comment @c comment
in a verb a}@c comment

something @verb{, in verb,} @c other comment';


$result_texts{'comments'} = ' comment @c comment
in a verb 
something  in verb ';

$result_errors{'comments'} = '';

$result_nodes_list{'comments'} = '';

$result_sections_list{'comments'} = '';

$result_sectioning_root{'comments'} = '';

$result_headings_list{'comments'} = '';

1;
