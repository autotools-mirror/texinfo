use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'long_uref_after_item'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@itemize C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@item C2 l2
   |item_number:{1}
    {ignorable_spaces_after_command:\\n}
    *paragraph C2
     *normal_command@uref C1 l3
      *brace_arg C1
       {normal_text:http://foo.org/some/long/url/which/goes/past/eighty/columns/and/has/no/alternative/text.html}
     {normal_text:\\n}
   *normal_command@end C1 l4
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
';


$result_texis{'long_uref_after_item'} = '@itemize
@item
@uref{http://foo.org/some/long/url/which/goes/past/eighty/columns/and/has/no/alternative/text.html}
@end itemize
';


$result_texts{'long_uref_after_item'} = 'http://foo.org/some/long/url/which/goes/past/eighty/columns/and/has/no/alternative/text.html
';

$result_errors{'long_uref_after_item'} = '';

$result_nodes_list{'long_uref_after_item'} = '';

$result_sections_list{'long_uref_after_item'} = '';

$result_sectioning_root{'long_uref_after_item'} = '';

$result_headings_list{'long_uref_after_item'} = '';


$result_converted{'plaintext'}->{'long_uref_after_item'} = '   • 
     <http://foo.org/some/long/url/which/goes/past/eighty/columns/and/has/no/alternative/text.html>
';

1;
