use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_line_in_command_in_expanded_not_expanded'} = '*document_root C1
 *before_node_section C4
  {empty_line:\\n}
  *@tex C3 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *elided_rawpreformatted C7
    {raw:@anchor{a\\n}
    {raw:\\n}
    {raw:b}.\\n}
    {raw:\\n}
    {raw:@code{v\\n}
    {raw:\\n}
    {raw:n}\\n}
   *@end C1 l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{tex}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {tex}
  {empty_line:\\n}
  *@html C3 l12
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C5
    *@anchor C1 l13
    |EXTRA
    |is_target:{1}
    |normalized:{ha-hb}
     *brace_arg C3
      {ha\\n}
      {empty_line:\\n}
      {hb}
    {.\\n}
    {empty_line:\\n}
    *@code C1 l17
     *brace_container C3
      {hv\\n}
      {empty_line:\\n}
      {hn}
    {\\n}
   *@end C1 l20
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{html}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {html}
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


$result_converted{'xml'}->{'empty_line_in_command_in_expanded_not_expanded'} = '
<tex endspaces=" ">
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
