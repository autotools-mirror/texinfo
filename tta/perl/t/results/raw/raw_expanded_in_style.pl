use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'raw_expanded_in_style'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   *normal_command@code C1 l1
    *brace_container C2
     {normal_text:\\n}
     *normal_command@html C3 l2
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *rawpreformatted C1
       {normal_text:in html\\n}
      *normal_command@end C1 l4
      |text_arg:{html}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:html}
        {spaces_after_argument:\\n}
';


$result_texis{'raw_expanded_in_style'} = '@code{
@html
in html
@end html
}';


$result_texts{'raw_expanded_in_style'} = '
in html
';

$result_errors{'raw_expanded_in_style'} = '';

$result_nodes_list{'raw_expanded_in_style'} = '';

$result_sections_list{'raw_expanded_in_style'} = '';

$result_sectioning_root{'raw_expanded_in_style'} = '';

$result_headings_list{'raw_expanded_in_style'} = '';


$result_converted{'plaintext'}->{'raw_expanded_in_style'} = '‘ in html
’
';


$result_converted{'xml'}->{'raw_expanded_in_style'} = '<para><code>
in html
</code></para>';


$result_converted{'html_text'}->{'raw_expanded_in_style'} = '<p><code class="code">
in html
</code></p>';

1;
