use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'raw_in_para'} = '*document_root C1
 *before_node_section C9
  *preamble
  *paragraph C1
   {normal_text:para\\n}
  *normal_command@verbatim C3 l2
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:in verbatim\\n}
   *normal_command@end C1 l4
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:para b html\\n}
   *normal_command@html C3 l7
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:in html\\n}
    *normal_command@end C1 l9
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
   {normal_text:in para\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:para b tex\\n}
   *normal_command@tex C3 l13
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C3
     {normal_text:in tex1\\n}
     {empty_line:\\n}
     {normal_text:in tex2\\n}
    *normal_command@end C1 l17
    |text_arg:{tex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:End.\\n}
';


$result_texis{'raw_in_para'} = 'para
@verbatim
in verbatim
@end verbatim

para b html
@html
in html
@end html
in para

para b tex
@tex
in tex1

in tex2
@end tex

End.
';


$result_texts{'raw_in_para'} = 'para
in verbatim

para b html
in html
in para

para b tex
in tex1

in tex2

End.
';

$result_errors{'raw_in_para'} = '';

$result_nodes_list{'raw_in_para'} = '';

$result_sections_list{'raw_in_para'} = '';

$result_sectioning_root{'raw_in_para'} = '';

$result_headings_list{'raw_in_para'} = '';


$result_converted{'plaintext'}->{'raw_in_para'} = 'para
in verbatim

   para b html in para

   para b tex

   End.
';


$result_converted{'xml'}->{'raw_in_para'} = '<para>para
</para><verbatim xml:space="preserve" endspaces=" ">
in verbatim
</verbatim>

<para>para b html
<html endspaces=" ">
in html
</html>
in para
</para>
<para>para b tex
<tex endspaces=" ">
in tex1

in tex2
</tex>
</para>
<para>End.
</para>';

1;
