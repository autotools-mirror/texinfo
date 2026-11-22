use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_line_in_command_in_expanded_not_expanded'} = '*document_root C1
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C3
   *normal_command@tex C3 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *elided_rawpreformatted C7
     {raw:@anchor{a\\n}
     {raw:\\n}
     {raw:b}.\\n}
     {raw:\\n}
     {raw:@code{v\\n}
     {raw:\\n}
     {raw:n}\\n}
    *normal_command@end C1 l10
    |text_arg:{tex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@html C3 l12
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C5
     *normal_command@anchor C1 l13
     |identifier:{ha-hb}
     |is_target:{1}
      *brace_arg C3
       {normal_text:ha\\n}
       {empty_line:\\n}
       {normal_text:hb}
     {normal_text:.\\n}
     {empty_line:\\n}
     *normal_command@code C1 l17
      *brace_container C3
       {normal_text:hv\\n}
       {empty_line:\\n}
       {normal_text:hn}
     {normal_text:\\n}
    *normal_command@end C1 l20
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
';


$result_texis{'empty_line_in_command_in_expanded_not_expanded'} = '
@tex
@anchor{a

b}.

@code{v

n}
@end tex

@html
@anchor{ha

hb}.

@code{hv

hn}
@end html
';


$result_texts{'empty_line_in_command_in_expanded_not_expanded'} = '
.

hv

hn
';

$result_errors{'empty_line_in_command_in_expanded_not_expanded'} = '';

$result_nodes_list{'empty_line_in_command_in_expanded_not_expanded'} = '';

$result_sections_list{'empty_line_in_command_in_expanded_not_expanded'} = '';

$result_sectioning_root{'empty_line_in_command_in_expanded_not_expanded'} = '';

$result_headings_list{'empty_line_in_command_in_expanded_not_expanded'} = '';


$result_converted{'plaintext'}->{'empty_line_in_command_in_expanded_not_expanded'} = '';


$result_converted{'xml'}->{'empty_line_in_command_in_expanded_not_expanded'} = '<preamblebeforebeginning>
</preamblebeforebeginning><tex endspaces=" ">
@anchor{a

b}.

@code{v

n}
</tex>

<html endspaces=" ">
<anchor identifier="ha-hb">ha

hb</anchor>.

<code>hv

hn</code>
</html>
';

1;
