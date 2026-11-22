use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'second_level_lone_braces_in_html'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C3
   *@html C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C3
     {normal_text:{a}
     *@code C1 l2
      *brace_container C1
       *balanced_braces C2 l2
        {normal_text:{\\n}
        {normal_text:}}
     {normal_text:\\n}
    *@end C1 l4
    |EXTRA
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@html C3 l6
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C3
     {normal_text:{b}
     *@code C1 l7
      *brace_container C3
       {normal_text:\\n}
       *balanced_braces C1 l8
        {normal_text:{c d}}
       {normal_text:\\n}
     {normal_text:\\n}
    *@end C1 l10
    |EXTRA
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
';


$result_texis{'second_level_lone_braces_in_html'} = '@html
{a@code{{
}}
@end html

@html
{b@code{
{c d}
}
@end html
';


$result_texts{'second_level_lone_braces_in_html'} = '{a{
}

{b
{c d}

';

$result_errors{'second_level_lone_braces_in_html'} = '';

$result_nodes_list{'second_level_lone_braces_in_html'} = '';

$result_sections_list{'second_level_lone_braces_in_html'} = '';

$result_sectioning_root{'second_level_lone_braces_in_html'} = '';

$result_headings_list{'second_level_lone_braces_in_html'} = '';


$result_converted{'plaintext'}->{'second_level_lone_braces_in_html'} = '';


$result_converted{'xml'}->{'second_level_lone_braces_in_html'} = '<html endspaces=" ">
{a<code>{
}</code>
</html>

<html endspaces=" ">
{b<code>
{c d}
</code>
</html>
';

1;
