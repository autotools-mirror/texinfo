use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'heading_separator_in_accent_command'} = '*document_root C1
 *before_node_section C4
  *preamble
  *paragraph C2
   *normal_command@, C1 l1
    *brace_container C1
     *normal_command@|
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@oddfooting C1 l3
   *line_arg C9
    {spaces_before_argument: }
    {normal_text:a }
    *normal_command@|
    {normal_text: }
    *normal_command@^ C1 l3
     *brace_container C1
      *normal_command@|
    {normal_text: }
    *normal_command@|
    {normal_text: b}
    {spaces_after_argument:\\n}
';


$result_texis{'heading_separator_in_accent_command'} = '@,{@|}

@oddfooting a @| @^{@|} @| b
';


$result_texts{'heading_separator_in_accent_command'} = ',

';

$result_errors{'heading_separator_in_accent_command'} = '* W l1|@| should not appear in @,
 warning: @| should not appear in @,

* E l1|@| should only appear in heading or footing
 @| should only appear in heading or footing

* W l3|@| should not appear in @^
 warning: @| should not appear in @^

';

$result_nodes_list{'heading_separator_in_accent_command'} = '';

$result_sections_list{'heading_separator_in_accent_command'} = '';

$result_sectioning_root{'heading_separator_in_accent_command'} = '';

$result_headings_list{'heading_separator_in_accent_command'} = '';

1;
